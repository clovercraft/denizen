cc_npc_capitolsmith_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - cc_npc_capitolsmith_i

cc_npc_capitolsmith_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - flag <player> known_capitolsmith:1
                    - clickable cc_npc_capitolsmith_work_t save:click_work
                    - narrate "Work or Trade? <blue><element[Work].on_click[<entry[click_work].command>]><reset>"

cc_npc_capitolsmith_work_t:
    type: task
    definitions: player
    script:
        - clickable cc_npc_capitolsmith_sellcoal_t save:sell_coal
        - if <player.inventory.contains_item[coal|charcoal]>:
            - narrate "I see you've got some fuel in your inventory. Would you like to <blue><element[sell].on_click[<entry[sell_coal].command>]><reset> that to me?"
        - else:
            - narrate "I'm blasting through fuels with all these requisitions coming in from the state. Bring me coal or quality charcoal, and I'll make it worth your while."

cc_npc_capitolsmith_sellcoal_t:
    type: task
    script:
        - if <player.has_flag[capitolsmith_cooldown]>:
            - narrate "Sorry friend, I can only buy from you once per day."
            - stop
        - define sell_price 0
        - define sell_count 0
        - define sale_items <list[]>
        - define coal_count <player.inventory.quantity_item[coal]>
        - if <[coal_count]> > 128:
            - define coal_count 128
        - if <[coal_count]> > 0:
            - define sell_price:+:<[coal_count]>
            - define sale_items <[sale_items].include[<map[name=Coal;price=1;qty=<[coal_count]>]>]>
            - define sell_count:+:<[coal_count]>
            - take item:coal quantity:<[coal_count]>
        - define charcoal_count <player.inventory.quantity_item[charcoal]>
        - if <[charcoal_count]> > 128:
            - define charcoal_count 128
        - if <[charcoal_count]> > 0:
            - define sell_price:+:<[charcoal_count]>
            - define sale_items <[sale_items].include[<map[name=Charcoal;price=1;qty=<[charcoal_count]>]>]>
            - define sell_count:+:<[charcoal_count]>
            - take item:charcoal quantity:<[charcoal_count]>
        - narrate "A whole <[sell_count]> pieces of Fuel! Here's some coin for your efforts."
        - define sell_price <[sell_count]>
        - money give quantity:<[sell_price]> players:<player>
        - define receipt_args <list[<player>].include_single[<[sale_items]>]>
        - run cc_util_make_receipt def:<[receipt_args]>
        - run cc_npc_capitolsmith_setflags_t

cc_npc_capitolsmith_setflags_t:
    type: task
    script:
        - flag <player> capitolsmith_cooldown:true expire:20m
        - if <player.has_flag[soldto_capitolsmith]>:
            - flag <player> soldto_capitolsmith:++
        - else:
            - flag <player> soldto_capitolsmith:1