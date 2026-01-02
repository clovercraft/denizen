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
        on player right clicks player flagged:hs_seeker:
            - define tagged <context.entity>
            - if <server.has_flag[hs_running]> && <player.has_flag[hs_active]> && <[tagged].has_flag[hs_active]> && <[tagged].has_flag[hs_hidden]>:
                - define remaining_players <server.online_players_flagged[hs_active]>
                - flag <[tagged]> hs_seeker
                - flag <[tagged]> hs_hidden:!
                - define remaining_hiders <server.online_players_flagged[hs_hidden]>
                - narrate "<aqua><[tagged].display_name> was found by <player.display_name>!<reset>" targets:<[remaining_players]>
                - if <[remaining_hiders].size> <= 0:
                    - narrate "<red>Seekers win!<reset>" targets:<[remaining_players]>
                    - run cc_hide_seek_end_no_check
                - else:
                    - narrate "<red><[remaining_hiders].size> players remain.<reset>" targets:<[remaining_players]>
