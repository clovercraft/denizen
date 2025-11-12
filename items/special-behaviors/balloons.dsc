cc_items_behavior_balloons:
    type: world
    events:
        on player right clicks air with:cc_item_balloons:
            - if <player.has_flag[balloon_float]>:
                - define time_left <player.flag_expiration[balloon_float].from_now.formatted>
                - narrate "<gray>balloons on cooldown: <[time_left]>"
                - stop
            - flag player balloon_float:true expire:2m
            - cast levitation duration:10s
            - cast slow_falling duration:15s