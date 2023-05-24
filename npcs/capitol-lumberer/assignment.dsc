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
                    - run cc_npc_set_known def:<player>|capitol_lumberer
                    - clickable save:click_work usages:1:
                        - if <player.inventory.contains_item[*_log|*_planks]>:
                            - run cc_npc_capitollumber_buy_t
                            - stop
                        - else:
                            - narrate "If you have the time and the energy, I'd be happy to pay you for any work you do in bringing me logs and planks."
                            - stop
                    - clickable save:click_about usages:1:
                        - narrate "Oh, well… I'm a lumberjack. I collect and work lumber for the construction team. With all the buzz around going out to sea, I just can't find the time to keep up."
                        - stop
                    - narrate "Hey, pal. What can I do for you?"
                    - narrate "<blue><element[Work Opportunities].on_click[<entry[click_work].command>]><reset> | <blue><element[About Wyatt].on_click[<entry[click_about].command>]><reset>"


cc_npc_capitollumber_buy_t:
    type: task
    script:
        - if <player.has_flag[capitollumber_cooldown]>:
            - narrate "Ah, my apologies. I can only buy from you once per day."
            - stop
        - clickable save:click_yes usages:1:
            - flag <player> capitollumber_cooldown:true expire:20m
            - opentrades <script[cc_npc_capitollumber_trades].data_key[trades]> title:Wyatt players:<player>
        - clickable save:click_no:
            - narrate "Agh...shame. Offer stands, though."
            - stop
        - narrate "Are you interested in offloading that lumber? I'll buy off all the logs and planks you have. Don't want you to go uncompensated for hard work. Deal? <green><element[Yes].on_click[<entry[click_yes].command>]><reset> <gray><element[No].on_click[<entry[click_no].command>]><reset>"

cc_npc_capitollumber_trades:
    type: data
    trades:
        - trade[max_uses=8;inputs=oak_log[quantity=16];result=cc_trades_dubloons[quantity=48];has_xp=false]
        - trade[max_uses=8;inputs=oak_planks[quantity=16];result=cc_trades_dubloons[quantity=16];has_xp=false]
        - trade[max_uses=8;inputs=birch_log[quantity=16];result=cc_trades_dubloons[quantity=48];has_xp=false]
        - trade[max_uses=8;inputs=birch_planks[quantity=16];result=cc_trades_dubloons[quantity=16];has_xp=false]
        - trade[max_uses=8;inputs=spruce_log[quantity=16];result=cc_trades_dubloons[quantity=48];has_xp=false]
        - trade[max_uses=8;inputs=spruce_planks[quantity=16];result=cc_trades_dubloons[quantity=16];has_xp=false]
        - trade[max_uses=8;inputs=jungle_log[quantity=16];result=cc_trades_dubloons[quantity=48];has_xp=false]
        - trade[max_uses=8;inputs=jungle_planks[quantity=16];result=cc_trades_dubloons[quantity=16];has_xp=false]
        - trade[max_uses=8;inputs=acacia_log[quantity=16];result=cc_trades_dubloons[quantity=48];has_xp=false]
        - trade[max_uses=8;inputs=acacia_planks[quantity=16];result=cc_trades_dubloons[quantity=16];has_xp=false]
        - trade[max_uses=8;inputs=dark_oak_log[quantity=16];result=cc_trades_dubloons[quantity=48];has_xp=false]
        - trade[max_uses=8;inputs=dark_oak_planks[quantity=16];result=cc_trades_dubloons[quantity=16];has_xp=false]