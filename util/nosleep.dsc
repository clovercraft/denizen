cc_nosleep_command:
    type: command
    name: nosleep
    description: Set a flag for 20 minutes that tells others you need the night. clears when you sleep, or when you use the command again.
    usage: /nosleep
    script:
        - if <player.has_flag[nosleep]>:
            - flag player nosleep:!
            - narrate "<gray>Your no sleep request has been cleared"
            - stop
        - flag player nosleep:true expire:20m
        - narrate "<gray>Got it. We'll remind other players not to sleep"
        - narrate targets:<server.online_players> "<green><player.display_name> has requested we keep the night. Please no sleep!"

cc_nosleep_clock:
    type: world
    events:
        on player enters bed:
            - if <player.has_flag[nosleep]>:
                - flag player nosleep:!
                - narrate "<gray>Your no sleep request has been cleared"
                - stop
            - define time <player.world.time.period>
            - define nosleep_players <server.online_players_flagged[nosleep]>
            - if <[nosleep_players].size> > 0:
                - title title:<element[<red><bold>No Sleep!]>
                - narrate "A player has requested that we keep this night"
                - determine cancelled