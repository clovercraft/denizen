cc_hide_seek_game_clock:
    type: world
    debug: false
    events:
        on delta time secondly every:5:
            - if <server.has_flag[hs_running]>:
                - if !<server.has_flag[hs_timing]>:
                    - flag server hs_warning expire:8m
                    - flag server hs_max expire:10m
                    - flag server hs_timing
                - else:
                    - if !<server.has_flag[hs_warning]> && !<server.has_flag[hs_warning_given]>:
                        - narrate "<aqua>Two minutes remaining in the Hide & Seek match!<reset>" targets:<server.online_players_flagged[hs_active]>
                        - flag server hs_warning_given expire:4m
                    - else if <server.has_flag[hs_warning_given]> && !<server.has_flag[hs_max]>:
                        - flag server hs_timing:!
                        - flag server hs_warning_given:!
                        - run cc_hide_seek_end_no_check

