cc_npc_capitollumber_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - cc_npc_capitollumber_i

cc_npc_capitollumber_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - flag <player> known_capitollumberer:1
                    - clickable cc_npc_capitollumber_work_t save:click_work
                    - clickable cc_npc_capitollumber_about_t save:click_about
                    - narrate "Hey, pal. What can I do for you?"
                    - narrate "<blue><element[Work Opportunities].on_click[<entry[click_work].command>]><reset> | <blue><element[About Wyatt].on_click[<entry[click_about].command>]><reset>"
        2:
            click trigger:
                script:
                    - zap 1

cc_npc_capitollumber_about_t:
    type: task
    script:
        - narrate "Oh, well… I'm a lumberjack. I collect and work lumber for the construction team. With all the buzz around going out to sea, I just can't find the time to keep up."
        - stop

cc_npc_capitollumber_work_t:
    type: task
    definitions: player
    script:
        - clickable cc_npc_capitollumber_sell_t save:click_sell
        - if <player.inventory.contains_item[*_log|*_planks]>:
            - run cc_npc_capitollumber_buy_t
        - else:
            - narrate "If you have the time and the energy, I'd be happy to pay you for any work you do in bringing me logs and planks."
            - stop

cc_npc_capitollumber_buy_t:
    type: task
    script:
        - if <player.has_flag[capitollumber_cooldown]>:
            - narrate "Ah, my apologies. I can only buy from you once per day."
            - stop
        - define sale_items <list[]>
        - define qty_log <player.inventory.quantity_item[*_log]>
        - if <[qty_log]> > 128:
            - define qty_log 128
        - define qty_planks <player.inventory.quantity_item[*_planks]>
        - if <[qty_planks]> > 128:
            - define qty_planks 128
        - define sell_price 0
        - if <[qty_log]> > 0:
            - define price_log <[qty_log]>
            - define price_log:*:4
            - define sell_price:+:<[price_log]>
            - define sale_items <[sale_items].include[<map[name=Logs;price=4;qty=<[qty_log]>]>]>
	    - if <[qty_planks]> > 0:
        	- define sell_price:+:<[qty_planks]>
            - define sale_items <[sale_items].include[<map[name=Planks;price=1;qty=<[qty_planks]>]>]>
        - clickable save:click_yes:
            - if <player.has_flag[capitollumber_cooldown]>:
                - narrate "Ah, sorry. I already bought from you today."
                - stop
            - define sale_items <list[]>
            - define qty_log <player.inventory.quantity_item[*_log]>
            - if <[qty_log]> > 128:
                - define qty_log 128
            - define qty_planks <player.inventory.quantity_item[*_planks]>
            - if <[qty_planks]> > 128:
                - define qty_planks 128
            - define sell_price 0
            - if <[qty_log]> > 0:
                - define price_log <[qty_log]>
                - define price_log:*:4
                - define sell_price:+:<[price_log]>
                - define sale_items <[sale_items].include[<map[name=Logs;price=4;qty=<[qty_log]>]>]>
            - if <[qty_planks]> > 0:
                - define sell_price:+:<[qty_planks]>
                - define sale_items <[sale_items].include[<map[name=Planks;price=1;qty=<[qty_planks]>]>]>
            - narrate "Good deal."
            - take item:*_log quantity:<[qty_log]>
            - take item:*_planks quantity:<[qty_planks]>
            - money give quantity:<[sell_price]> players:<player>
            - define receipt_defs <list[<player>].include_single[<[sale_items]>]>
            - run cc_util_make_receipt def:<[receipt_defs]>
            - run cc_npc_capitollumber_setflags_t
        - clickable save:click_no:
            - narrate "Agh...shame. Offer stands, though."
            - stop
        - narrate "Are you interested in offloading that lumber? I'll buy off all the logs and planks you have. Don't want you to go uncompensated for hard work. Deal? <[sell_price]>☺. <green><element[Yes].on_click[<entry[click_yes].command>]><reset> <gray><element[No].on_click[<entry[click_no].command>]><reset>"

cc_npc_capitollumber_setflags_t:
    type: task
    script:
        - flag <player> capitollumber_cooldown:true expire:20m
        - if <player.has_flag[soldto_capitollumber]>:
            - flag <player> soldto_capitollumber:++
        - else:
            - flag <player> soldto_capitollumber:1