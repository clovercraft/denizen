cc_npc_avery_evencrest_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - cc_npc_avery_evencrest_i

cc_npc_avery_evencrest_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - define quest <proc[cc_get_msq_step].context[<player>]>
                    - if <[quest]> == msq2:
                        - define quest_step start
                        - if <player.has_flag[msq2_state]>:
                            - define quest_step <player.flag[msq2_state]>
                        - if <[quest_step]> == start:
                            - run cc_msq2_start
                            - stop
                        - if <[quest_step]> == accepted:
                            - run cc_msq2_handin
                            - stop
                        - if <[quest_step]> == completed:
                            - narrate "Hey, how's the enchanting going? I've just been getting back into my research. Turns out there's way more going on around here than I'd originaly thought. I might be in need of your services again in the future."
                    - if <[quest]> == msq3:
                        - define quest_step start
                        - if <player.has_flag[msq3_state]>:
                            - define quest_step <player.flag[msq3_state]>
                        - if <[quest_step]> == start:
                            - run cc_msq3_start
                            - stop
                        - if <[quest_step]> == waiting:
                            - run cc_msq3_farewell
                            - stop
                        - if <[quest_step]> == portal:
                            - run cc_msq3_handin
                            - stop
                        - if <[quest_step]> == completed:
                            - run cc_msq4_intro
                    - if <[quest]> == msq4:
                        - define step <proc[cc_msq4_state].context[<player>]>
                        - if <[step]> == start:
                            - run cc_msq4_intro
                        - if <[step]> == accepted:
                            - run cc_msq4_handin
                    - if <[quest]> == msq5:
                        - run cc_msq5_avery
                    - if <[quest]> == msq6:
                        - run cc_msq6_avery
