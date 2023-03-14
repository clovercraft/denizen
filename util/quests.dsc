cc_quests_rankup:
    type: task
    script:
        - if <player.has_flag[qrank]>:
            - flag <player> qrank:++
        - else:
            - flag <player> qrank:1