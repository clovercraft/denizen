cc_get_msq_step:
    type: procedure
    definitions: __player
    script:
        - if !<player.has_flag[msq2_state]>:
            - determine msq2
        - if <player.flag[msq2_state]> != completed:
            - determine msq2
        - determine msq3