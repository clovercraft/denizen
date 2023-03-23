cc_towns_registrar_npc_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        - trigger name:chat state:true
    interact scripts:
    - cc_towns_registrar_npc_i

cc_towns_registrar_npc_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - if <player.has_flag[settlement]>:
                        - define settlement <player.flag[settlement]>
                        - narrate "Hello there <player.display_name>, it looks like you're a member of <server.flag_map[settlements].deep_get[<[settlement]>.display_name]>."
                    - else:
                        - narrate "Hello there <player.display_name>! Did you want to register a settlement?"
                        - clickable save:click_yes:
                            - narrate "Alright, please type out the display name for your settlement."
                            - zap 2
                        - narrate "<green><element[Register].on_click[<entry[click_yes].command>]>"
        2:
            chat trigger:
                1:
                    trigger: /*/
                    script:
                        - define display_name <context.message>
                        - wait 1s
                        - clickable save:click_confirm:
                            - run cc_towns_registrar_setup_t def:<player>|<[display_name]>
                            - zap 1
                        - clickable save:click_cancel:
                            - zap 1
                        - narrate "To confirm, you would like to name your settlement <yellow><[display_name]><reset>, yes?"
                        - narrate "<green><element[Confirm].on_click[<entry[click_confirm].command>]> <reset>| <red><element[Cancel].on_click[<entry[click_cancel].command>]><reset>"

cc_towns_registrar_setup_t:
    type: task
    definitions: __player|display_name
    script:
        - define current_index <server.flag_map[settlements].get[index]>
        - define current_index:++
        - flag <server> settlements.index:++
        - define civilization <map.with[display_name].as[<[display_name]>].with[member_count].as[1]>
        - flag <server> settlements.<[current_index]>:<[civilization]>
        - flag <player> settlement:<[current_index]>
        - narrate "Alright, I've registered <[display_name]> with settlement ID <[current_index]>"
        - narrate "Other players can use <yellow>/joinsettlement <[current_index]><reset> to join your settlement."

cc_towns_setup_c:
    type: command
    description: Initializes the settlements flag in Denizen.
    name: setupsettlements
    usage: /setupsettlements
    permission: group.admin
    script:
        - if !<server.has_flag[settlements]>:
            - flag <server> settlements:<map.with[index].as[0]>

cc_towns_joinsettlement_c:
    type: command
    description: Joins a settlement. You can only be in one at a time but switching is free.
    name: joinsettlement
    usage: /joinsettlement <&lt>settlement_id<&gt>
    script:
        - define settlement <context.args.get[1]>
        - if <player.has_flag[settlement]>:
            - define current_settlement <player.flag[settlement]>
            - define civilization <server.flag_map[settlements.<[current_settlement]>].as[list]>
            - define display_name <[civilization].get[display_name]>
            - narrate "It looks like you're already a part of the <yellow><[display_name]><reset> settlement."
            - narrate "You can only be part of one settlement at a time. Do you want to switch settlements?"
            - clickable save:click_yes:
                - narrate "Alright, let's do it"
                - run cc_towns_joinsettlement_t def:<player>|<[settlement]>
            - clickable save:click_no:
                - narrate "Got it, we'll keep you as part of the <yellow><[display_name]><reset> settlement."
                - stop
            - narrate "<green><element[Confirm].on_click[<entry[click_yes].command>]><reset> | <red><element[Cancel].on_click[entry[click_no].command]><reset>"
        - else:
            - narrate "Alright, let's do it"
            - run cc_towns_joinsettlement_t def:<player>|<[settlement]>

cc_towns_joinsettlement_t:
    type: task
    definitions: __player|settlement
    script:
        - if <server.has_flag[settlements.<[settlement]>]>:
            - flag <player> settlement:<[settlement]>
            - if <server.flag_map[settlements.<[settlement]>].contains[member_count]>:
                - define member_count <server.flag_map[settlements.<[settlement]>.member_count]>
            - else:
                - define member_count 0
            - define member_count:++
            - define civilization <map[civilization].with[member_count].as[<[member_count]>]>
            - flag <server> settlements.<[settlement]>:<[civilization]>
            - define display_name <map[civilization].get[display_name]>
            - narrate "You have joined the <[display_name]> settlement."
        - else:
            - narrate "It looks like that settlement doesn't exist. You can use the <yellow>/objectives<reset> command to learn more about founding a settlement."