cc_camel_removal_clock:
    type: world
    events:
        on system time hourly:
            - foreach <server.online_players> as:target:
                - run cc_camel_removal def:<[target]>


cc_camel_removal:
    type: task
    definitions: __player
    script:
    - foreach <player.location.find_entities[camel].within[50]> as:camel:
        - if <[camel].has_saddle> = true or <[camel].is_leashed> = true:
            - narrate "has leash or saddle"
        - else:
            - remove <[camel]>