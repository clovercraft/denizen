cc_hide_seek:
    type: command
    debug: false
    name: hide-seek
    description: Hide and Seek game command. See help for sub-commands.
    usage: /hide-seek <&lt>action<&gt>
    aliases:
        - hs
    tab completions:
        1: join|leave|start|end|help
    script:
        - if <context.args.size> == 0:
            - run cc_hide_seek_help
            - stop
        - choose <context.args.first>:
            - case join:
                - run cc_hide_seek_join
            - case leave:
                - run cc_hide_seek_leave
            - case start:
                - run cc_hide_seek_start
            - case end:
                - run cc_hide_seek_end
            # - case help:
            - default:
                - run cc_hide_seek_help

cc_hide_seek_help:
    type: procedure
    debug: false
    script:
        - narrate "<yellow>Hide & Seek Help"
        - narrate "<yellow>/hide-seek join  - Join the Hide & Seek match."
        - narrate "<yellow>/hide-seek leave - Leave the Hide & Seek match."
        - narrate "<yellow>/hide-seek start - Start the Hide & Seek match."
        - narrate "<yellow>/hide-seek end   - End the Hide & Seek match."
        - narrate "<yellow>/hide-seek help  - Show this help message."

c_hide_seek_end_no_check:
    type: task
    debug: false
    script:
        - flag server hs_vote_end:!
        - flag server hs_running:!
        - narrate "<red>The match has ended, thanks for playing!<reset>" targets:<server.online_players_flagged[hs_active]>
        - foreach <server.players_flagged[hs_active]> as:hs_player:
            - flag <[hs_player]> hs_active:!
        - foreach <server.players_flagged[hs_hidden]> as:hs_player:
            - flag <[hs_player]> hs_hidden:!
        - foreach <server.players_flagged[hs_seeker]> as:hs_player:
            - flag <[hs_player]> hs_seeker:!


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

cc_hide_seek_start:
    type: task
    debug: false
    script:
        - if <server.has_flag[hs_running]>:
            - narrate "<red>A match is already in progress.<reset>"
            - stop
        - if <server.online_players_flagged[hs_active].size> < 2:
            - narrate "<red>There are not enough players to start a match.<reset>"
            - stop
        - define hs_players <server.online_players_flagged[hs_active]>
        - narrate "<aqua>Selecting a <gold>seeker<aqua>...<reset>" targets:<[hs_players]>
        - wait 2s
        # Define seeker
        - define hs_seeker <[hs_players].random>
        - flag <[hs_seeker]> hs_seeker expire:12h
        - narrate "<gold>You are the seeker!<reset>" targets:<[hs_seeker]>
        # Define hiders
        - define hs_hiders <[hs_players].exclude[<[hs_seeker]>]>
        # Add hs_hidden flag to non-seeker players.
        # This should be removed if the player leaves the match early.
        - foreach <[hs_hiders]> as:hs_hider:
            - flag <[hs_hider]> hs_hidden expire:12h
            - narrate "<aqua>You are not the <gold>seeker<aqua>.<reset>" targets:<[hs_hider]>
        - wait 1s
        - narrate "<red>Match starting in 5 seconds...<reset>" targets:<[hs_players]>
        - wait 2s
        - title title:<red>3<reset> targets:<[hs_players]> fade_in:0s
        - wait 1s
        - title title:<yellow>2<reset> targets:<[hs_players]> fade_in:0s
        - wait 1s
        - title title:<green>1<reset> targets:<[hs_players]> fade_in:0s
        - wait 1s
        - define title_text "<aqua>Match Start!<reset>"
        - title title:<[title_text]> targets:<[hs_players]> fade_in:0s
        - wait 3s
        # Give players two minutes to hide.
        # 120 seconds = 6s darkness + 84s blindness + 30s warning
        - define title_text "<aqua>Players have 2 minutes to hide!<reset>"
        - narrate <[title_text]> targets:<[hs_players]>
        - title title:<gold>Seek!<reset> subtitle:<[title_text]> targets:<[hs_seeker]>
        - foreach <[hs_hiders]> as:hs_hider:
            - title title:<aqua>Hide!<reset> subtitle:<[title_text]> targets:<[hs_hider]>
        - cast darkness duration:10s <[hs_seeker]>
        - wait 6s
        # - wait 1s
        - cast blindness duration:120s <[hs_seeker]>
        - wait 84s
        # - wait 1s
        - define title_text "<gold>30 seconds left!<reset>"
        - narrate <[title_text]> targets:<[hs_players]>
        - title subtitle:<[title_text]> targets:<[hs_players]>
        - wait 30s
        # - wait 5s
        - narrate "<red>The hunt is on!<reset>" targets:<[hs_players]>
        - cast darkness remove <[hs_seeker]>
        - cast blindness remove <[hs_seeker]>
        - flag server hs_running expire:12h

