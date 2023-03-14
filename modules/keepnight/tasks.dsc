t_keepnight_check:
    type: task
    script:
        - if <server.has_flag[nosleep]>:
            - narrate "Someone has requested we keep night. Please don't sleep!"
            - determine cancelled

t_keepnight_clear:
    type: task
    script:
        - flag server nosleep:!
        - flag <server.online_players_flagged[nosleep]> nosleep:!