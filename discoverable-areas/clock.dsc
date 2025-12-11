cc_discoverable_areas:
    type: world
    events:
        after player enters meagles_nest:
            - run cc_discoverable_areas_on_discover def:<player>|meagles_nest
        after player enters hidden_grove:
            - run cc_discoverable_areas_on_discover def:<player>|hidden_grove
        after player enters hidden_shrine:
            - run cc_discoverable_areas_on_discover def:<player>|hidden_shrine
        after player enters silverfish_caves:
            - run cc_discoverable_areas_on_discover def:<player>|silverfish_caves
            - run silverfish_collective_prox_update
        after player enters abandoned_village:
            - run cc_discoverable_areas_on_discover def:<player>|abandoned_village
        after player enters fytari_groveheart:
            - run cc_discoverable_areas_on_discover def:<player>|fytari_groveheart
        after player enters the_monastery:
            - run cc_discoverable_areas_on_discover def:<player>|the_monastery
        after player enters abandoned_fort:
            - run cc_discoverable_areas_on_discover def:<player>|abandoned_fort

cc_discoverable_areas_on_discover:
    type: task
    definitions: __player|areaSlug
    script:
        - define area_data <script[cc_discoverable_areas_list].data_key[<[areaSlug]>]>
        - define is_first_visit <proc[cc_discoverable_areas_first_visit].context[<player>|<[areaSlug]>]>
        - if <[is_first_visit]>:
            # flag the player
            - define playerDiscoveries <proc[cc_discoverable_areas_get_player_discoveries].context[<player>]>
            - define playerDiscoveries <[playerDiscoveries].include[<[areaSlug]>]>
            - flag player discovered_areas:<[playerDiscoveries]>
            # toast the discovery
            - define toast_text "You have discovered <[area_data].get[fancy_name]>"
            - define toast_icon <item[<[area_data].get[icon_item]>]>
            - toast <[toast_text]> frame:challenge icon:<[toast_icon]>
            # tell the player about the location
            - narrate <bold><[area_data].get[fancy_name]><reset>
            - narrate <[area_data].get[description]>
            # if this is their first discovery, give info about the command
            - if <player.has_flag[first_discovery].not>:
                - narrate "<gray>You can use the <yellow>/discoveries<gray> command to view your discovered locations"
                - flag player first_discovery:1
            # grant discovery reward
            - experience give 50

cc_discoverable_areas_get_player_discoveries:
    type: procedure
    definitions: __player
    script:
        - define playerDiscoveries <list[]>
        - if <player.has_flag[discovered_areas]>:
            - define playerDiscoveries <player.flag[discovered_areas]>
        - determine <[playerDiscoveries]>

cc_discoverable_areas_first_visit:
    type: procedure
    definitions: __player|area
    script:
        - define playerDiscoveries <proc[cc_discoverable_areas_get_player_discoveries].context[<player>]>
        - determine <[playerDiscoveries].contains[<[area]>].not>