cc_npc_capitoltavernkeep_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - cc_npc_capitoltavernkeep_i

cc_npc_capitoltavernkeep_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - clickable cc_npc_capitoltavernkeep_quest_give_t save:click_quest
                    - define well_known <proc[cc_npc_capitoltavernkeep_wellknown_p].context[<player>]>
                    - if (<[well_known]> == 1) && !<player.has_flag[capitoltavernkeep_quest_greetings]>:
                        - narrate "Hey there, <player.display_name>! I've heard good things about you from the other folks in town. Here, I've got some gear to get you started on your journies."
                        - run cc_npc_capitoltavernkeep_quest_handin_t
                    - else if <player.has_flag[capitoltavernkeep_quest_greetings]>:
                        - narrate "Hey there <player.display_name>, good to see you today!"
                    - else if <player.has_flag[known_capitoltavernkeep]>:
                        - narrate "Hey there, have you talked to everyone yet? As a reminder, you should go meet Duncan, Agnes, Arthur, and Wyatt."
                        - narrate "<green><element[Okay!].on_click[<entry[click_quest].command>]><reset>"
                    - else:
                        - flag <player> known_capitoltavernkeep:1
                        - narrate "Wonderful to see a new face here! Tell you what. Go meet some folks around town and I'll hook you up with some gear to get you started. At the moment, I think Duncan, Agnes, Arthur, and Wyatt are gonna be your best friends. So start with them."
                        - narrate "<green><element[Okay!].on_click[<entry[click_quest].command>]><reset>"

cc_npc_capitoltavernkeep_wellknown_p:
    type: procedure
    definitions: __player
    script:
        - define known <proc[cc_npc_get_knownlist]>
        - if <[known].size.is[less].than[4]>:
            - determine 0
        - determine 1