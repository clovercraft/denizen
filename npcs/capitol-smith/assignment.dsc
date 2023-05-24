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
        - opentrades <script[cc_npc_capitolsmith_trades].data_key[trades]> title:Agnes players:<player>

cc_npc_capitolsmith_trades:
    type: data
    trades:
        - trade[max_uses=8;inputs=coal[quantity=16];result=cc_trades_dubloons[quantity=16];has_xp=false]
        - trade[max_uses=8;inputs=charcoal[quantity=16];result=cc_trades_dubloons[quantity=16];has_xp=false]