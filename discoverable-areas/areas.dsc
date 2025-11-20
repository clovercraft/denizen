cc_discoverable_areas_list:
    type: data
    meagles_nest:
        fancy_name: Magpie Eagle Nests
        icon_item: cc_discoverable_areas_meagles_icon
        teleport_target: l@-124.5,228,179.5,world
    hidden_grove:
        fancy_name: The Hidden Grove
        icon_item: cc_discoverable_areas_hidden_grove_icon
        teleport_target: l@-3040.5,101,445.5,world
    silverfish_caves:
        fancy_name: The Silverfish Caves
        icon_item: cc_discoverable_areas_silverfish_caves_icon
        teleport_target: l@301.5,23,178.5,world
    abandoned_village:
        fancy_name: The Abandoned Village
        icon_item: cc_discoverable_areas_abandoned_village_icon
        teleport_target: l@16.5,64,4389.5,world

cc_discoverable_areas_meagles_icon:
    type: item
    material: paper
    allow in material recipes: false
    display name: <green>Magpie Eagle Nests
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: meagles_nest

cc_discoverable_areas_hidden_grove_icon:
    type: item
    material: paper
    allow in material recipes: false
    display name: <&d>The Hidden Grove
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: hidden_grove

cc_discoverable_areas_silverfish_caves_icon:
    type: item
    material: paper
    allow in material recipes: false
    display name: <gold>The Silverfish Caves
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: silverfish_caves

cc_discoverable_areas_abandoned_village_icon:
    type: item
    material: paper
    allow in material recipes: false
    display name: <red>The Abandoned Village
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: abandoned_village