cc_npc_capitolmason_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - cc_npc_capitolmason_i

cc_npc_capitolmason_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - flag <player> known_capitolmason:1
                    - clickable cc_npc_capitolmason_work_t save:click_work
                    - clickable cc_npc_capitolmason_about_t save:click_about
                    - narrate "Ah! Good to see you. To what do I owe the pleasure?"
                    - narrate "<blue><element[Work Opportunities].on_click[<entry[click_work].command>]><reset> | <blue><element[About Arthur].on_click[<entry[click_about].command>]><reset>"

cc_npc_capitolmason_about_t:
    type: task
    script:
        - narrate "There's not much to tell, really. I am brought stone and I work it into usable material for town. Occasionally, I do some art pieces, but I'm awfully busy nowadays."
        - stop

cc_npc_capitolmason_work_t:
    type: task
    script:
        - clickable cc_npc_capitolmason_buy_t save:click_sell
        - if <player.inventory.contains_item[stone|cobblestone|granite|diorite|andesite|deepslate|cobbled_deepslate|sandstone|red_sandstone|smooth_basalt]>:
            - run cc_npc_capitolmason_buy_t
        - else:
            - narrate "Oh! At the moment, it'd help if you could come by with raw stone material for me. If I think of anything suited for your expertise, I'll be sure to let you know."
            - stop

cc_npc_capitolmason_buy_t:
    type: task
    script:
        - if <player.has_flag[capitolmason_cooldown]>:
            - narrate "Ah, my apologies. I can only buy from you once per day."
            - stop
        - clickable save:click_yes:
            - if <player.has_flag[capitolmason_cooldown]>:
                - narrate "Ah, sorry. I already bought from you today."
                - stop
            - define sell_price <proc[cc_npc_capitolmason_sellprice_p]>
            - define sale_items <proc[cc_npc_capitolmason_receipt_p]>
            - narrate "Excellent. Thank you."
            - define item_count <player.inventory.quantity_item[stone|cobblestone|granite|diorite|andesite|deepslate|cobbled_deepslate|sandstone|red_sandstone|smooth_basalt]>
            - if <[item_count]> > 256:
                - define item_count 256
            - take item:stone|cobblestone|granite|diorite|andesite|deepslate|cobbled_deepslate|sandstone|red_sandstone|smooth_basalt quantity:<[item_count]>
            - define deep_count <player.inventory.quantity_item[deepslate|cobbled_deepslate]>
            - if <[deep_count]> > 128:
                - define deep_count 128
            - take item:deepslate|cobbled_deepslate quantity:<[deep_count]>
            - money give quantity:<[sell_price]> players:<player>
            - define receipt_args <list[<player>].include_single[<[sale_items]>]>
            - run cc_util_make_receipt def:<[receipt_args]>
            - run cc_npc_capitolmason_setflags_t
        - clickable save:click_no:
            - narrate "My mistake."
            - stop
        - narrate "Aha! Hey! Would I be mistaken to think that stone's for me? I have cash available for you if you're looking to sell it. <green><element[Yes].on_click[<entry[click_yes].command>]><reset> <gray><element[No].on_click[<entry[click_no].command>]><reset>"

cc_npc_capitolmason_setflags_t:
    type: task
    script:
        - flag <player> capitolmason_cooldown:true expire:20m
        - if <player.has_flag[soldto_capitolmason]>:
            - flag <player> soldto_capitolmason:++
        - else:
            - flag <player> soldto_capitolmason:1

cc_npc_capitolmason_sellprice_p:
    type: procedure
    script:
        - define stone_count <player.inventory.quantity_item[stone|cobblestone|granite|diorite|andesite|sandstone|red_sandstone|smooth_basalt]>
        - if <[stone_count]> > 128:
            - define stone_count 128
        - define stone_price 1
        - define stone_price:*:<[stone_count]>
        - define deep_count <player.inventory.quantity_item[deepslate|cobbled_deepslate]>
        - if <[deep_count]> > 128:
            - define deep_count 128
        - define deep_price 3
        - define deep_price:*:<[deep_count]>
        - define deep_price:+:<[stone_price]>
        - determine <[deep_price]>

cc_npc_capitolmason_receipt_p:
    type: procedure
    script:
        - define sale_items <list[]>
        - define stone_count <player.inventory.quantity_item[stone|cobblestone|granite|diorite|andesite|sandstone|red_sandstone|smooth_basalt]>
        - if <[stone_count]> > 128:
            - define stone_count 128
        - define stone_price 1
        - define stone_price:*:<[stone_count]>
        - define sale_items <[sale_items].include[<map[name=Stone Variants;price=1;qty=<[stone_count]>]>]>
        - define deep_count <player.inventory.quantity_item[deepslate|cobbled_deepslate]>
        - if <[deep_count]> > 128:
            - define deep_count 128
        - define deep_price 3
        - define deep_price:*:<[deep_count]>
        - define sale_items <[sale_items].include[<map[name=Deepslate Variants;price=3;qty=<[deep_count]>]>]>
        - determine <[sale_items]>