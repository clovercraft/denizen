the_isolation_on_enter:
    type: task
    script:
        - define isolation_sickness 0
        - if <player.has_flag[isolation_sickness]>:
            - define isolation_sickness <player.flag[isolation_sickness]>
        - define isolation_sickness:++
        - if <[isolation_sickness].is_more_than_or_equal_to[1]>:
            - run isolation_sickness_phase_one
        - if <[isolation_sickness].is_more_than_or_equal_to[3]>:
            - run isolation_sickness_phase_two
        - if <[isolation_sickness].is_more_than_or_equal_to[10]>:
            - run isolation_final
        - flag player isolation_sickness:<[isolation_sickness]>

isolation_sickness_phase_one:
    type: task
    script:
        - narrate "sickness 1"

isolation_sickness_phase_two:
    type: task
    script:
        - narrate "sickness 2"

isolation_final:
    type: task
    script:
        - flag player isolation_cursed:1
        - cast slow_digging amplifier:1 duration:infinite hide_particles:true
        - narrate "oh you're fucked"