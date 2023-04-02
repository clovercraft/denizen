cc_april_w:
    type: world
    debug: false
    events:
        on player places block:
            - if <util.random_chance[1]>:
                - if <util.random_chance[5]>:
                    - spawn warden <player.location>
                - else:
                    - spawn rabbit <player.location>
            - else:
                - spawn rabbit <player.location>
        on delta time minutely every:5:
            - weather thunder reset:2m
        on delta time minutely every:1:
            - foreach <server.online_players> as:__player:
                - kill <player.location.find_entities[warden].within[50]>
        after lightning strikes:
            - if <util.random_chance[5]> && !<cuboid[capitol_land].contains[<context.location>]>:
                - spawn warden <context.location>