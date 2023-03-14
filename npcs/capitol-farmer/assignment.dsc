cc_npc_capitolfarmer_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - cc_npc_capitolfarmer_i

cc_npc_capitolfarmer_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - clickable cc_npc_capitolfarmer_work_t save:click_work
                    - clickable cc_npc_capitolfarmer_about_t save:click_about
                    - clickable cc_npc_capitolfarmer_quest_t save:click_quest
                    - flag <player> known_capitolfarmer:1
                    - narrate "Howdy, hey! What's up?"
                    - if <player.has_flag[soldto_capitolfarmer]> && <player.flag[soldto_capitolfarmer]> > 3:
                        - narrate "<blue><element[Work Opportunities].on_click[<entry[click_work].command>]><reset> | <blue><element[About Duncan].on_click[<entry[click_about].command>]><reset> | <blue><element[Quest].on_click[<entry[click_quest].command>]><reset>"
                    - else:
                        - narrate "<blue><element[Work Opportunities].on_click[<entry[click_work].command>]><reset> | <blue><element[About Duncan].on_click[<entry[click_about].command>]><reset>"

cc_npc_capitolfarmer_about_t:
    type: task
    script:
        - narrate "My family and I have been tending the land here since the town's first days. It's tough, but knowing we help keep people happy and healthy helps morale."
        - stop

cc_npc_capitolfarmer_work_t:
    type: task
    script:
        - if <player.inventory.contains_item[bone_meal]>:
            - run cc_npc_capitolfarmer_buy_t
        - else:
            - narrate "I'm always looking for quality fertilizers, I'll pay you for any bone meal you can get me."
            - stop

cc_npc_capitolfarmer_buy_t:
    type: task
    script:
        - if <player.has_flag[capitolfarmer_cooldown]>:
            - narrate "Ah, my apologies. I can only buy from you once per day."
            - stop
        - clickable save:click_yes:
            - if <player.has_flag[capitolfarmer_cooldown]>:
                - narrate "Ah, sorry. I already bought from you today."
                - stop
            - define sale_items <list[]>
            - define qty_meal <player.inventory.quantity_item[bone_meal]>
            - if <[qty_meal]> > 256:
                - define qty_meal 256
            - define sell_price <[qty_meal]>
            - define sell_price:*:3
            - define sale_items <[sale_items].include[<map[name=Bone Meal;price=3;qty=<[qty_meal]>]>]>
            - narrate "Good stuff. Thank you."
            - take item:bone_meal quantity:<[qty_meal]>
            - money give quantity:<[sell_price]> players:<player>
            - define receipt_args <list[<player>].include_single[<[sale_items]>]>
            - run cc_util_make_receipt def:<[receipt_args]>
            - run cc_npc_capitolfarmer_setflags_t
        - clickable save:click_no:
            - narrate "Awe, okay. That's cool."
            - stop
        - narrate "Oo! OO! Hey, I need some of that bone meal. I'll pay you for it. Take my money. <green><element[Yes].on_click[<entry[click_yes].command>]><reset> <gray><element[No].on_click[<entry[click_no].command>]><reset>"

cc_npc_capitolfarmer_setflags_t:
    type: task
    script:
        - flag <player> capitolfarmer_cooldown:true expire:20m
        - if <player.has_flag[soldto_capitolfarmer]>:
            - flag <player> soldto_capitolfarmer:++
        - else:
            - flag <player> soldto_capitolfarmer:1