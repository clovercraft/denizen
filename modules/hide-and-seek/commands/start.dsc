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
        - narrate "<aqua>Selecting a <gold>Seeker<aqua>...<reset>" targets:<[hs_players]>
        - wait 2s
        # Define seeker
        - define hs_seeker <[hs_players].random>
        - flag <[hs_seeker]> hs_seeker expire:12h
        - narrate "<aqua>You are the <gold>Seeker!<reset>" targets:<[hs_seeker]>
        # Define hiders
        - define hs_hiders <[hs_players].exclude[<[hs_seeker]>]>
        # Add hs_hidden flag to non-seeker players.
        # This should be removed if the player leaves the match early.
        - foreach <[hs_hiders]> as:hs_hider:
            - flag <[hs_hider]> hs_hidden expire:12h
            - narrate "<aqua>You are a <light_purple>Hider<aqua>! Get ready to hide!<reset>" targets:<[hs_hider]>
        - wait 1s
        - narrate "<red>Match starting in 5 seconds...<reset>" targets:<[hs_players]>
        - wait 2s
        - playsound <[hs_players]> sound:entity_warden_step pitch:2.0 sound_category:master
        - title title:<red>3<reset> targets:<[hs_players]> fade_in:0s
        - wait 1s
        - playsound <[hs_players]> sound:entity_warden_step pitch:2.0 sound_category:master
        - title title:<yellow>2<reset> targets:<[hs_players]> fade_in:0s
        - wait 1s
        - playsound <[hs_players]> sound:entity_warden_step pitch:2.0 sound_category:master
        - title title:<green>1<reset> targets:<[hs_players]> fade_in:0s
        - wait 1s
        - define title_text "<aqua>Match Start!<reset>"
        - playsound <[hs_players]> sound:item_goat_horn_sound_0 pitch:0.9 sound_category:master
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
        - playsound <[hs_players]> sound:entity_warden_tendril_clicks pitch:0.1 sound_category:master
        - narrate "<red>The hunt is on!<reset>" targets:<[hs_players]>
        - narrate "<light_purple>Hiders<aqua>, be sure you're hidden!<reset>" targets:<[hs_hiders]>
        - narrate "<gold>Seeker<aqua>, go find them!<reset>" targets:<[hs_seeker]>
        - cast darkness remove <[hs_seeker]>
        - cast blindness remove <[hs_seeker]>
        - flag server hs_running expire:12h

