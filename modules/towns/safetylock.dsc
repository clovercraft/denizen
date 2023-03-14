cc_towns_safetylock_w:
    type: world
    debug: false
    events:
        #on entity spawns in:capitol_land:
            - if <context.entity.is_monster>:
                - determine cancelled