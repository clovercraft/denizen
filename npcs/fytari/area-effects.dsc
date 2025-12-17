fytari_area_effects:
    type: task
    script:
        - if <player.has_flag[fytari_blessing]>:
            - narrate "<gray>The blessing of the Fytari may only be granted once per day"
            - stop
        - flag player fytari_blessing:1 expire:20m
        - cast damage_resistance duration:15m hide_particles:true
        - cast regeneration duration:15m hide_particles:true
