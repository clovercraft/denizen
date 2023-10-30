cc_npc_lewis_lantern_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - cc_npc_lewis_lantern_i

cc_npc_lewis_lantern_i:
    type: interact
    steps:
        1:
            click trigger:
                script:
                    - define status <proc[cc_get_lewis_state].context[<player>]>
                    - if <[status]> == start:
                        - run cc_quest_lewis_intro
                    - if <[status]> == accepted:
                        - run cc_quest_lewis_check

cc_get_lewis_state:
    type: procedure
    definitions: __player
    script:
        - if !<player.has_flag[lewis_state]>:
            - flag player lewis_state:start
            - determine start
        - else:
            - determine <player.flag[lewis_state]>