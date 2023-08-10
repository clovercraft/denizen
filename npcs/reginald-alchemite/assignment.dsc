cc_npc_reginald_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - cc_npc_avery_reginald_i

cc_npc_avery_reginald_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - define quest <proc[cc_get_msq_step].context[<player>]>
                    - if <[quest]> == msq6:
                        - if <player.flag[msq6_state]> == completed:
                            - narrate "Greetings."
                            - stop
                        - run cc_msq6_entry
                        - stop
                    - else:
                        - narrate "Hello there. How did you get all the way out here?"