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
                    - run cc_npc_set_known def:<player>|capitol_farmer
                    - clickable save:click_work usages:1:
                        - if <player.inventory.contains_item[bone_meal]>:
                            - run cc_npc_capitolfarmer_buy_t
                        - else:
                            - narrate "I'm always looking for quality fertilizers, I'll pay you for any bone meal you can get me."
                            - stop
                    - clickable save:click_about usages:1:
                        - narrate "My family and I have been tending the land here since the town's first days. It's tough, but knowing we help keep people happy and healthy helps morale."
                        - stop
                    - clickable cc_npc_capitolfarmer_quest_t save:click_quest
                    - narrate "Howdy, hey! What's up?"
                    - define soldto <proc[cc_npc_get_soldto].context[<player>|capitol_farmer]>
                    - if <[soldto].is[more].than[3]>:
                        - narrate "<blue><element[Work Opportunities].on_click[<entry[click_work].command>]><reset> | <blue><element[About Duncan].on_click[<entry[click_about].command>]><reset> | <blue><element[Quest].on_click[<entry[click_quest].command>]><reset>"
                    - else:
                        - narrate "<blue><element[Work Opportunities].on_click[<entry[click_work].command>]><reset> | <blue><element[About Duncan].on_click[<entry[click_about].command>]><reset>"

cc_npc_capitolfarmer_buy_t:
    type: task
    script:
        - if <player.has_flag[capitolfarmer_cooldown]>:
            - narrate "Ah, my apologies. I can only buy from you once per day."
            - stop
        - define sale_items <list[<map[id=bone_meal;name=Bone Meal;price=2;max=256]>]>
        - clickable save:click_yes usages:1:
            - flag <player> capitolfarmer_cooldown:true expire:20m
            - run cc_npc_shopkeeper_buy def:<list[<player>].include_single[<[sale_items]>]>
            - run cc_npc_set_soldto def:<player>|capitol_farmer
            - narrate "Good stuff. Thank you."
        - clickable save:click_no:
            - narrate "Awe, okay. That's cool."
            - stop
        - narrate "Oo! OO! Hey, I need some of that bone meal. I'll pay you for it. Take my money."
        - narrate "<green><element[Yes].on_click[<entry[click_yes].command>]><reset> <gray><element[No].on_click[<entry[click_no].command>]><reset>"