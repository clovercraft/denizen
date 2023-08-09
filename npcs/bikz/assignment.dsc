cc_npc_bizk_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - cc_npc_avery_bizk_i

cc_npc_avery_bizk_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - define quest <proc[cc_get_msq_step].context[<player>]>
                    - if <[quest]> == msq5:
                        - if <player.flag[msq5_state]> == completed:
                            - run "What's up bud?"
                            - stop
                        - run cc_msq5_entry
                        - stop
                    - if <[quest]> != msq4:
                        - narrate "Hrm. Did you need something?"
                        - stop
                    - run cc_msq4_entry