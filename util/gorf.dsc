world_gorf:
    type: world
    debug: false
    events:
        after player right clicks birch_button in:gorf:
            - run task_gorf_check def:<player>

task_gorf_check:
    type: task
    definitions: __player
    script:
    - if <server.has_flag[gorfcooldown]>:
        - narrate "<red>Not gorf time yet"
        - stop
    - flag server gorfcooldown:1 expire:5m
    - define player_name <player.display_name>
    - narrate "<[player_name]> has called forth a GORF!" targets:<server.online_players>
    - title title:<element[GORF].color[green].bold> targets:<server.online_players>