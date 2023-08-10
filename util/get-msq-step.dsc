cc_get_msq_step:
    type: procedure
    definitions: __player
    script:
        - if !<player.has_flag[msq2_state]>:
            - determine msq2
        - if <player.flag[msq2_state]> != completed:
            - determine msq2
        - if !<player.has_flag[msq3_state]> || <player.flag[msq3_state]> != completed:
            - determine msq3
        - if !<player.has_flag[msq4_state]> || <player.flag[msq4_state]> != completed:
            - determine msq4
        - if !<player.has_flag[msq5_state]> || <player.flag[msq5_state]> != completed:
            - determine msq5
        - determine msq6