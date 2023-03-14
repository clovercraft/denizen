w_keep_night:
    type: world
    debug: false
    events:
        on player enters bed:
            - inject t_keepnight_check
        on time 8 in world:
            - run t_keepnight_clear
