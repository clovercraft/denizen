cc_hide_seek_config:
    type: data
    # lines:
    # - "Players: test"
    # - "[players:hs_active] temp"
    lines:
    - "Game Time: <aqua><reset>"
    # - "<&8>-----------------------<reset>"
    # - "Time: "
    game_time_max: 10
    # Duration in minutes for players to hide
    game_hide_duration: 2
    # Hide duration in seconds of darkness
    game_hide_darkness: 10
    game_hide_sequence:
        # Assumes a structure of:
        # - <command>:<data>:<target>
        - darkness:10s:seekers
        - wait:6s
        - blindness:120s:seekers
        - wait:84s
        - warning:30s

