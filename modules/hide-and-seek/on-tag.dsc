cc_hide_seek_on_tag:
    type: world
    debug: false
    events:
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
