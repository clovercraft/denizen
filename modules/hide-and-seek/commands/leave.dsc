cc_hide_seek_leave:
    type: task
    debug: false
    script:
        - if !<player.has_flag[hs_active]>:
            - narrate "<red>You are not in a match."
            - stop
        - if <server.online_players_flagged[hs_seeker].size> <= 1 && <player.flag[hs_seeker]>:
            - narrate "<red>The Hide & Seek match has ended due to no remaining seekers.<reset>" targets:<server.online_players_flagged[hs_active]>
            - ~run cc_hide_seek_end_no_check
        - narrate "<green>You have left the Hide & Seek match!" targets:<player>
        - flag player hs_seeker:!
        - flag player hs_hidden:!
        - flag player hs_active:!
        - stop

