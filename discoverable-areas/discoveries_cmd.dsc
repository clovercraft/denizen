cc_discoveries_cmd:
    type: command
    name: discoveries
    description: Open your encyclopedia and view the things you have discovered!
    usage: /discoveries
    script:
        - inventory open destination:cc_discoveries_inventory

cc_discoveries_inventory:
    type: inventory
    inventory: GENERIC
    title: <black>Discoveries
    size: 27
    gui: true
    procedural items:
        - define list <list>
        - define areas <proc[cc_discoverable_areas_get_player_discoveries].context[<player>]>
        - foreach <[areas]> as:area:
            - define area_item <script[cc_discoverable_areas_list].data_key[<[area]>.icon_item]>
            - define list <[list].include[<[area_item]>]>
        - determine <[list]>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

cc_discoveries_inventory_clock:
    type: world
    events:
        on player right clicks item in cc_discoveries_inventory:
            - run cc_discoveries_click_moreinfo def:<player>|<context.item>
            - inventory close destination:cc_discoveries_inventory
        on player left clicks item in cc_discoveries_inventory:
            - run cc_discoveries_click_teleport def:<player>|<context.item>
            - inventory close destination:cc_discoveries_inventory

cc_discoveries_click_moreinfo:
    type: task
    definitions: __player|item
    script:
        - narrate "more info"

cc_discoveries_click_teleport:
    type: task
    definitions: __player|item
    script:
        - if <[item].has_flag[area].not>:
            - stop
        - define area_name <[item].flag[area]>
        - define display_name <script[cc_discoverable_areas_list].data_key[<[area_name]>.fancy_name]>
        - define teleport_target <script[cc_discoverable_areas_list].data_key[<[area_name]>.teleport_target]>
        - title "subtitle:Teleporting you to <[display_name]> in 3" stay:1s fade_in:0.5s fade_out:0.5s
        - wait 1s
        - title "subtitle:Teleporting you to <[display_name]> in 2" stay:1s fade_out:0.5s
        - wait 1s
        - title "subtitle:Teleporting you to <[display_name]> in 1" stay:1s fade_out:0.5s
        - wait 1s
        - teleport <player> <[teleport_target]>
        - playsound <player> sound:ENTITY_ENDERMAN_TELEPORT volume:0.5