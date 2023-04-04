cc_hide_seek_join:
    type: task
    debug: false
    script:
        - if <player.has_flag[hs_active]>:
            - narrate "<red>You are already in the match."
            - stop
        - else:
            - flag player hs_active expire:12h
            - narrate "<green>You have joined the Hide & Seek match!"
            - stop
