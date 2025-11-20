cc_discoverable_areas_on_discover:
    type: task
    definitions: __player|areaName|areaSlug|icon
    script:
        - define is_first_visit <proc[cc_discoverable_areas_first_visit].context[<player>|<[areaSlug]>]>
        - if <[is_first_visit]>:
            - run cc_discoverable_areas_flag_player def:<player>|<[areaSlug]>
            - run cc_discoverable_areas_toast def:<player>|<[areaName]>|<[icon]>

cc_discoverable_areas_toast:
    type: task
    definitions: __player|area|icon
    script:
        - define text "You have discovered <[area]>!"
        - toast <[text]> frame:challenge icon:<[icon]>

cc_discoverable_areas_flag_player:
    type: task
    definitions: __player|area
    script:
        - define playerDiscoveries <proc[cc_discoverable_areas_get_player_discoveries].context[<player>]>
        - define playerDiscoveries <[playerDiscoveries].include[<[area]>]>
        - flag player discovered_areas:<[playerDiscoveries]>

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