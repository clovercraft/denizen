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
                    - run cc_npc_set_known def:<player>|capitol_mason
                    - clickable save:click_work usages:1:
                        - if <player.inventory.contains_item[stone|cobblestone|granite|diorite|andesite|deepslate|cobbled_deepslate|sandstone|red_sandstone|smooth_basalt]>:
                            - run cc_npc_capitolmason_buy_t
                            - stop
                        - else:
                            - narrate "Oh! At the moment, it'd help if you could come by with raw stone material for me. If I think of anything suited for your expertise, I'll be sure to let you know."
                            - stop
                    - clickable save:click_about usages:1:
                        - narrate "There's not much to tell, really. I am brought stone and I work it into usable material for town. Occasionally, I do some art pieces, but I'm awfully busy nowadays."
                        - stop
                    - narrate "Ah! Good to see you. To what do I owe the pleasure?"
                    - narrate "<blue><element[Work Opportunities].on_click[<entry[click_work].command>]><reset> | <blue><element[About Arthur].on_click[<entry[click_about].command>]><reset>"

cc_npc_capitolmason_buy_t:
    type: task
    script:
        - if <player.has_flag[capitolmason_cooldown]>:
            - narrate "Ah, my apologies. I can only buy from you once per day."
            - stop
        - define stone_items <map[name="Stone Variants";price=1;max=128].with[id].as[<list[stone|cobblestone|granite|diorite|andesite|sandstone|red_sandstone|smooth_basalt]>]>
        - define deep_items <map[name="Deepslate Variants";price=3;max=128].with[id].as[<list[deepslate|cobbled_deepslate]>]>
        - define sale_items <list[<[stone_items]>].include_single[<[deep_items]>]>
        - clickable save:click_yes usages:1:
            - flag <player> capitolmason_cooldown:true expire:20m
            - run cc_npc_shopkeeper_buy def:<list[<player>].include_single[<[sale_items]>]>
            - run cc_npc_set_soldto def:<player>|capitol_mason
            - narrate "Excellent. Thank you."
        - clickable save:click_no:
            - narrate "My mistake."
            - stop
        - narrate "Aha! Hey! Would I be mistaken to think that stone's for me? I have cash available for you if you're looking to sell it. <green><element[Yes].on_click[<entry[click_yes].command>]><reset> <gray><element[No].on_click[<entry[click_no].command>]><reset>"