cc_arcade_clock:
    type: world
    events:
        on player dies:
            - if <player.location.world.name> == arcade || <player.location.world.name> == onlyspruce:
                - if <player.has_flag[arcade_respawn]>:
                    - teleport <player> <player.flag[arcade_respawn]>
                - else:
                    - teleport <player> <server.flag[arcade_respawn_default]>
                - narrate "<green>Arcade CC:<reset> You died! But no worries, the arcade saved you."
                - determine cancelled
        on player right clicks acacia_button in:arcade_cactice_respawn_btn:
            - run cc_arcade_respawn
        on player right clicks acacia_button in:arcade_respawn_endertoss:
            - run cc_arcade_respawn
        on player right clicks acacia_button in:arcade_respawn_dropper:
            - run cc_arcade_respawn
        on player right clicks acacia_button in:anvildrop_respawn:
            - run cc_arcade_respawn
        on player right clicks composter:
            - if <player.location.world.name> == arcade:
                - run cc_arcade_trashcan
        on player right clicks oak_button in:boozone:
            - run cc_arcade_boo

cc_arcade_respawn:
    type: task
    script:
        - flag player arcade_respawn:<player.location>
        - narrate "<green>Arcade CC:<reset> respawn point set!"

cc_arcade_trashcan:
    type: task
    script:
        - clickable save:yes:
            - inventory clear
        - narrate "<green>Arcade CC:<reset> Would you like to clear your inventory? <element[<&lb><green>Yes<reset><&rb>].on_click[<entry[yes].command>]>"

cc_arcade_boo:
    type: task
    script:
        - define player_name <player.display_name>
        - if <server.has_flag[bootimer]>:
            - narrate "Too soon to boo!"
            - stop
        - title title:<&6>Boo! targets:<server.online_players>
        - define roll <util.random.int[1].to[10]>
        - if <[roll]> => 5:
            - playsound <server.online_players> sound:ambient_cave volume:0.5
        - narrate "<dark_gray>You've been spooked by <[player_name]>"
        - flag server bootimer:1 expire:5m