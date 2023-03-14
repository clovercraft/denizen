cc_npc_avery_evencrest_movement:
    type: world
    events:
        on time 8 in world:
            - define npc <npc[n@27]>
            - teleport <[npc]> <[npc].anchor[guild]>
        on time 16 in world:
            - define npc <npc[n@27]>
            - teleport <[npc]> <[npc].anchor[library]>
        on time 0 in world:
            - define npc <npc[n@27]>
            - teleport <[npc]> <[npc].anchor[tavern]>

cc_npc_avery_evencrest_playercheck:
    type: procedure
    script:
        - define npc <npc[n@27]>
        - define players <[npc].location.find_players_within[30]>
        - determine <[players].size>