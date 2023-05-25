# Based on original design of Magic Sidebar by mcmonkey
# ------------------------- Begin configuration -------------------------
cc_hide_seek_sidebar_config:
    type: data
    # How many updates per second (acceptable values: 1, 2, 4, 5, 10)
    per_second: 1
    title: <aqua><bold>Hide & Seek<reset>
    game_timer_title: Game Timer <server.flag_expiration[hs_max]>
    active_title: <aqua>Lobby<reset>
    hiders_title: <green>Hiders<reset>
    seekers_title: <gold>Seekers<reset>
# ------------------------- End of configuration -------------------------

cc_hide_seek_sidebar_world:
    type: world
    debug: false
    events:
        on delta time secondly:
        - ~run cc_hide_seek_sidebar_update


cc_hide_seek_sidebar_update:
    type: procedure
    debug: false
    script:
    - define per_second <script[cc_hide_seek_sidebar_config].data_key[per_second]>
    - define wait_time <element[1].div[<[per_second]>]>s
    - define players <server.online_players_flagged[hs_active]>
    - define title <script[cc_hide_seek_sidebar_config].data_key[title]>
    - repeat <[per_second]>:
        - sidebar title:<[title].parsed> values:<proc[cc_hide_seek_sidebar_lines_proc]> players:<[players]> per_player
        - wait <[wait_time]>

cc_hide_seek_sidebar_lines_proc:
    type: procedure
    debug: false
    script:
    - define active_title <script[cc_hide_seek_sidebar_config].data_key[active_title]>
    - define hiders_title <script[cc_hide_seek_sidebar_config].data_key[hiders_title]>
    - define seekers_title <script[cc_hide_seek_sidebar_config].data_key[seekers_title]>
    - define actives <server.online_players_flagged[hs_active]>
    - define hiders <server.online_players_flagged[hs_hidden]>
    - define seekers <server.online_players_flagged[hs_seeker]>
    # Game not started; list the lobby with all active players
    # - flag server hs_game_time_max:<[game_time]> expire:<[game_time]>
    # - if !<server.has_flag[hs_max]>:
    #     - define game_time <script[cc_hide_seek_config].data_key[game_time_max]>
    #     - define list  "Game Time: <[game_time]>"
    # - else:
    #     - define game_time <server.flag_expiration[hs_max].sub[<util.time_now>]>
    #     # - define game_time:-:<time[<util.time_now>]>
    # - define list  "Game Time: <[game_time]>"

    - if !<server.has_flag[hs_running]>:
        # - define list:->:<[active_title].parsed>
        - foreach <[actives]> as:active:
            - if !<[active].has_flag[hs_hidden]> && !<[active].has_flag[hs_seeker]>:
                    - define tmp " <aqua>-<reset> <[active].display_name>"
                    - define list:->:<[tmp]>
    - else:
        # - define list:->:<[hiders_title].parsed>
        - foreach <[hiders]> as:hidden:
            - define tmp " - <green><[hidden].name> (hiding)<reset>"
            - define list:->:<[tmp]>
        # - define list:->:<[seekers_title].parsed>
        - foreach <[seekers]> as:seeker:
            - define tmp " - <red><[seeker].name> (seeking)<reset>"
            - define list:->:<[tmp]>
    - determine <[list]>
