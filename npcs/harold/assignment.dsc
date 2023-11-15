cc_npc_niuf_harold_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - cc_npc_niuf_harold_i

cc_npc_niuf_harold_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - define status <proc[cc_get_harold_state].context[<player>]>
                    - if <[status]> == start:
                        - run cc_quest_harold_intro
                    - if <[status]> == accepted:
                        - narrate "Those bandits took my supplies and my beloved Penelopy to the camp to the east! Please, I need your help."
                    - if <[status]> == combat:
                        - run cc_quest_harold_check
                    - if <[status]> == complete:
                        - run cc_quest_harold_trade

cc_get_harold_state:
    type: procedure
    definitions: __player
    script:
        - if !<player.has_flag[harold_state]>:
            - flag player harold_state:start
            - determine start
        - else:
            - determine <player.flag[harold_state]>