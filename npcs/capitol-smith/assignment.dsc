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
                    - run cc_npc_set_known def:<player>|capitol_smith
                    - clickable save:click_work usages:1:
                        - clickable cc_npc_capitolsmith_sellcoal_t save:sell_coal usages:1
                        - if <player.inventory.contains_item[coal|charcoal]>:
                            - narrate "I see you've got some fuel in your inventory. Would you like to <blue><element[sell].on_click[<entry[sell_coal].command>]><reset> that to me?"
                        - else:
                            - narrate "I'm blasting through fuels with all these requisitions coming in from the state. Bring me coal or quality charcoal, and I'll make it worth your while."
                    - narrate "Work or Trade? <blue><element[Work].on_click[<entry[click_work].command>]><reset>"


cc_npc_capitolsmith_sellcoal_t:
    type: task
    script:
        - if <player.has_flag[capitolsmith_cooldown]>:
            - narrate "Sorry friend, I can only buy from you once per day."
            - stop
        - flag <player> capitolsmith_cooldown:true expire:20m
        - define sale_items <list[<map[id=coal;name=Coal;price=1;max=128]>].include_single[<map[id=charcoal;name=Charcoal;price=1;max=128]>]>
        - run cc_npc_shopkeeper_buy def:<list[<player>].include_single[<[sale_items]>]>
        - run cc_npc_set_soldto def:<player>|capitol_smith
        - narrate "A whole bunch of Fuel! Here's some coin for your efforts."