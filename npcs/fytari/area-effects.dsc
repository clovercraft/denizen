fytari_area_effects:
    type: task
    script:
        - define fytari_core l@-3118,142,131,world
        - while <player.location.distance[<[fytari_core]>].horizontal.is_less_than_or_equal_to[50]>:
            - cast damage_resistance duration:15s hide_particles:true
            - cast regeneration duration:15s hide_particles:true
            - wait 14s
