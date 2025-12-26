isolation_area_clock:
    type: world
    debug: false
    events:
        on player enters isolation:
            - run isolation_on_enter


isolation_on_enter:
    type: task
    script:
        - define isolation_sickness 0
        - if <player.has_flag[isolation_sickness]>:
            - define isolation_sickness <player.flag[isolation_sickness]>
        - define isolation_sickness:++
        - choose <[isolation_sickness]>:
            - case 1 2:
                - run isolation_sickness_phase_one
            - case 3 4:
                - run isolation_sickness_phase_two
            - default:
                - run isolation_final
        - flag player isolation_sickness:<[isolation_sickness]>
        - define spawnpoint l@-2720.5,72.1,-1738.5,112,1,world
        - wait 3s
        - teleport <player> <[spawnpoint]>

isolation_sickness_phase_one:
    type: task
    script:
        - cast darkness amplifier:10 duration:5s hide_particles
        - cast confusion duration:5s hide_particles
        - wait 3s
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:0.2
        - playsound <player.location> sound:entity.warden.heartbeat volume:0.2
        - wait 10t
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:0.4
        - playsound <player.location> sound:entity.warden.heartbeat volume:0.4
        - wait 10t
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:0.8
        - playsound <player.location> sound:entity.warden.heartbeat volume:0.8
        - wait 10t
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:1.0
        - playsound <player.location> sound:entity.warden.heartbeat volume:1.0
        - playsound <player.location> sound:entity.wither.spawn volume:0.5

isolation_sickness_phase_two:
    type: task
    script:
        - cast darkness amplifier:10 duration:15s hide_particles
        - cast confusion duration:5s hide_particles
        - wait 1s
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:0.6
        - playsound <player.location> sound:entity.warden.heartbeat volume:0.6
        - hurt
        - wait 10t
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:0.8
        - playsound <player.location> sound:entity.warden.heartbeat volume:0.8
        - hurt
        - wait 10t
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:1.0
        - playsound <player.location> sound:entity.warden.heartbeat volume:1.0
        - hurt
        - wait 10t
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:1.2
        - playsound <player.location> sound:entity.warden.heartbeat volume:1.2
        - playsound <player.location> sound:entity.wither.spawn volume:1
        - narrate "<gold>You have an uneasy feeling..."

isolation_final:
    type: task
    script:
        - flag player isolation_cursed:1
        - cast slow_digging amplifier:1 duration:1hr hide_particles:true
        - cast darkness amplifier:10 duration:35s hide_particles
        - cast confusion duration:5s hide_particles
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:0.6
        - playsound <player.location> sound:entity.warden.heartbeat volume:0.6
        - hurt
        - wait 10t
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:0.8
        - playsound <player.location> sound:entity.warden.heartbeat volume:0.8
        - hurt
        - wait 10t
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:1.0
        - playsound <player.location> sound:entity.warden.heartbeat volume:1.0
        - hurt
        - wait 10t
        - playsound <player.location> sound:ambient.basalt_deltas.mood sound_category:hostile volume:1.2
        - playsound <player.location> sound:entity.warden.heartbeat volume:1.2
        - foreach <server.online_players_flagged[isolation_sickness]> as:flagged_player:
            - playsound <[flagged_player].location> sound:entity.wither.spawn volume:1
        - narrate "<dark_red>Something feels wrong..."