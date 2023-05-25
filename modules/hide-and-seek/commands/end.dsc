cc_hide_seek_end_no_check:
    type: task
    debug: false
    script:
        - define remaining_players <server.online_players_flagged[hs_active]>
        - flag server hs_vote_end:!
        - flag server hs_running:!
        - narrate "<red>The match has ended, thanks for playing!<reset>" targets:<server.online_players_flagged[hs_active]>
        - foreach <server.players_flagged[hs_active]> as:hs_player:
            - flag <[hs_player]> hs_active:!
        - foreach <server.players_flagged[hs_hidden]> as:hs_player:
            - flag <[hs_player]> hs_hidden:!
        - foreach <server.players_flagged[hs_seeker]> as:hs_player:
            - flag <[hs_player]> hs_seeker:!
        - wait 5s
        - sidebar remove players:<[remaining_players]>


cc_hide_seek_end:
    type: task
    debug: false
    script:
        - if !<server.has_flag[hs_running]>:
            - narrate "<red>There is no Hide & Seek match running."
            - stop
        - if !<player.has_flag[hs_hidden]>:
            - narrate "<red>You are not a hider."
            - stop
        - if <server.has_flag[hs_vote_end]>:
            - flag server hs_vote_end:+:1
        - else:
            - flag server hs_vote_end:1 expire:4h
        - narrate "<aqua>You vote to end the match.<reset>"
        - define remaining_hiders <server.online_players_flagged[hs_hidden].size>
        # Permit vote to end if votes exceed half of the remaining hiders.
        - define remaining_hiders_div <[remaining_hiders].div[2].round_down>
        - if <server.flag[hs_vote_end]> >= <[remaining_hiders_div]>:
            - narrate "<red>The match has been ended by a vote!<reset>" targets:<server.online_players_flagged[hs_active]>
            - ~run cc_hide_seek_end_no_check
        - stop
