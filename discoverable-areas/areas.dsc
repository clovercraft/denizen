cc_discoverable_areas_list:
    type: data
    index:
        - meagles_nest
        - hidden_grove
        - hidden_shrine
        - silverfish_caves
        - abandoned_village
        - fytari_groveheart
        - the_monastery
        - abandoned_fort
    meagles_nest:
        fancy_name: Magpie Eagle Nests
        icon_item: cc_discoverable_areas_meagles_icon
        description: The abandoned nests of the once proud Magpie Eagles
        teleport_target: l@-124.5,228,179.5,world
    hidden_grove:
        fancy_name: Hidden Grove
        icon_item: cc_discoverable_areas_hidden_grove_icon
        description: The Hidden Village of the Kitsune Tribe. Lead by Yuna, the Kitsune Matriarch.
        teleport_target: l@-3039.5,101,440.5,world
    hidden_shrine:
        fancy_name: Hidden Shrine
        icon_item: cc_discoverable_areas_hidden_shrine_icon
        description: The Hidden Kitsune Shrine. Dedicated to the Fallen Kitsune: Kuro, Daughter of Yuna.
        teleport_target: l@-3470,76,265,world
    silverfish_caves:
        fancy_name: Silverfish Hive
        icon_item: cc_discoverable_areas_silverfish_caves_icon
        description: A strange conglomeration of many sentient Silverfish and their queen
        teleport_target: l@283,48,179,world
    abandoned_village:
        fancy_name: Abandoned Fishing Village
        icon_item: cc_discoverable_areas_abandoned_village_icon
        description: The burned out ruins of a fishing village. Rumor has it that this is where the Kitsune Kuro was slain, and the second arrival of the humans were driven out.
        teleport_target: l@16.5,64,4389.5,world
    fytari_groveheart:
        fancy_name: Fytari Groveheart
        icon_item: cc_discoverable_areas_fytari_groveheart_icon
        description: Druidic energy hums through its roots and branches, shaping the land and nurturing every creature touched by its influence.
        teleport_target: l@-3102,149,155,world
    the_monastery:
        fancy_name: The Monastery
        icon_item: cc_discoverable_areas_monastery_icon
        description: A lonely monastery where the sky meets the sea. Home to the mighty TeeBeeDee and his secrets.
        teleport_target: l@-3908.5,88,739.5,world
    abandoned_fort:
        fancy_name: Abandoned Fort
        icon_item: cc_discoverable_areas_abandoned_fort_icon
        description: An old military fortress since abandoned by humans. Now something else resides within its ruined palisade walls...
        teleport_target: l@418.5,108,-107.5,world

cc_discoverable_areas_undiscovered_icon:
    type: item
    material: paper
    allow in material recipes: false
    display name: <dark_purple><magic>Undiscovered
    lore:
        - <gray>An undiscovered wonder
    mechanisms:
        custom_model_data: 108

cc_discoverable_areas_meagles_icon:
    type: item
    material: feather
    allow in material recipes: false
    display name: <green>Magpie Eagle Nests
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: meagles_nest

cc_discoverable_areas_hidden_grove_icon:
    type: item
    material: fox_spawn_egg
    allow in material recipes: false
    display name: <&d>Hidden Grove
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: hidden_grove

cc_discoverable_areas_hidden_shrine_icon:
    type: item
    material: emerald_block
    allow in material recipes: false
    display name: <&d>Hidden Shrine
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: hidden_shrine

cc_discoverable_areas_silverfish_caves_icon:
    type: item
    material: silverfish_spawn_egg
    allow in material recipes: false
    display name: <gold>Silverfish Hive
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: silverfish_caves

cc_discoverable_areas_abandoned_village_icon:
    type: item
    material: coal_block
    allow in material recipes: false
    display name: <red>Abandoned Fishing Village
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: abandoned_village

cc_discoverable_areas_fytari_groveheart_icon:
    type: item
    material: flowering_azalea
    allow in material recipes: false
    display name: <dark_green>Fytari Groveheart
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: fytari_groveheart

cc_discoverable_areas_monastery_icon:
    type: item
    material: paper
    mechanisms:
        custom_model_data: 109
    allow in material recipes: false
    display name: <dark_red>The Monastery
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: the_monastery

cc_discoverable_areas_abandoned_fort_icon:
    type: item
    material: iron_sword
    allow in material recipes: false
    display name: <gold>Abandoned Fort
    lore:
        - <gray>Left-click to teleport here
        - <gray>Right-click for more info
    flags:
        area: abandoned_fort