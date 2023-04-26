custom_blocks_handler_events:
    type: world
    debug: false
    events:
        on player places stone:
            - if <player.item_in_hand.has_flag[is_custom_block]||false>:
                - determine passively cancelled
                - run cc_anchorstone_place_t def:<context.location>
        on delta time secondly every:5:
            - run cc_anchorstone_pulse_t
        on player right clicks block with:warp_glyph:
            - define target <context.location.material.name.if_null[air]>
            - define interactable <proc[cc_is_interactable].context[<[target]>]>
            - if !<[interactable]>:
                - run cc_anchorstone_glyph_use
        on warp command:
            - run cc_anchorstone_glyph_clear

cc_anchorstone_remove_c:
    type: command
    name: removeanchorstone
    description: Removes the warp anchorstone in front of the player
    usage: /removeanchorstone
    permission: group.staff
    aliases:
        - ranchor
    script:
        - define customBlockStands <player.location.center.below[1.86].find_entities[armor_stand].within[3].filter[custom_name.contains[anchorBlock]]>
        - if <[customBlockStands].size||0> >= 1:
            - define endrod <[customBlockStands].get[1].location.find_blocks[end_rod].within[3]>
            - modifyblock <[endrod].get[1]> air
            - remove <[customBlockStands].get[1]>
            - wait 1t
            - give warp_anchorstone

cc_anchorstone_place_t:
    type: task
    definitions: location
    script:
        - wait 1t
        - spawn armor_stand[custom_name=anchorBlock;equipment=air|air|air|warp_anchorstone;gravity=false;visible=false] <[location].center.below[1.86]>
        - modifyblock <[location]> end_rod

cc_anchorstone_pulse_t:
    type: task
    debug: false
    script:
        - foreach <server.online_players> as:__player:
            - define anchor_stone <player.location.find_entities[armor_stand].within[250].filter[custom_name.contains[anchorBlock]]>
            - if <[anchor_stone].size||0> >= 1:
                - if !<player.has_permission[essentials.warps.*]>:
                    - narrate "You are now within range of a warp point!"
                    - permission add 'essentials.warps.*'
            - else:
                - if <player.has_permission[essentials.warps.*]> && !<player.has_flag[warpglyph]>:
                    - narrate "You are now out of range range of the warp network"
                    - permission remove 'essentials.warps.*'