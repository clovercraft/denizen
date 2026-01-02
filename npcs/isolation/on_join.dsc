isolation_join_events:
    type: world
    events:
        after player joins flagged:isolation_cursed:
            - define duration <util.random.int[1].to[8]>
            - cast darkness amplifier:5 duration:<[duration]> hide_particles
        after player joins flagged:isolation_watcher:
            - define cursed <server.players_flagged[isolation_cursed]>
            - if <[cursed].size.is_more_than_or_equal_to[1]>:
                - narrate "<bold>SYS:<reset> The following players are cursed: <[cursed].formatted>"