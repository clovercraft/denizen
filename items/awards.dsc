cc_awards_blue_ribbon:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 1
    display name: <blue>First Place

cc_awards_red_ribbon:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 2
    display name: <red>Second Place

cc_awards_green_ribbon:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 3
    display name: <green>Third Place

cc_awards_bronze_crown:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 4
    display name: <gold>Bronze Crown

cc_awards_bronze_medal:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 5
    display name: <gold>Bronze Medal

cc_awards_bronze_present:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        gift: bronze
        reward: true
    mechanisms:
        custom_model_data: 6
    display name: <gold>Bronze Gift

cc_awards_bronze_trophy:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 7
    display name: <gold>Third Place

cc_awards_golden_crown:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 8
    display name: <yellow>Golden Crown

cc_awards_golden_medal:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 9
    display name: <yellow>Golden Medal

cc_awards_golden_present:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        gift: gold
        reward: true
    mechanisms:
        custom_model_data: 10
    display name: <yellow>Golden Gift

cc_awards_golden_trophy:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 11
    display name: <yellow>First Place

cc_awards_silver_crown:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 12
    display name: <aqua>Silver Crown

cc_awards_silver_medal:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 13
    display name: <aqua>Silver Medal

cc_awards_silver_present:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        gift: silver
        reward: true
    mechanisms:
        custom_model_data: 14
    display name: <aqua>Silver Gift

cc_awards_silver_trophy:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 15
    display name: <aqua>Second Place

cc_awards_menu:
    type: inventory
    inventory: CHEST
    title: <black>Award Items
    size: 27
    gui: true
    slots:
    - [cc_awards_golden_crown] [cc_awards_golden_medal] [cc_awards_golden_trophy] [cc_awards_golden_present] [] [] [cc_awards_blue_ribbon] [cc_awards_green_ribbon] [cc_awards_red_ribbon]
    - [cc_awards_silver_crown] [cc_awards_silver_medal] [cc_awards_silver_trophy] [cc_awards_silver_present] [] [] [] [] []
    - [cc_awards_bronze_crown] [cc_awards_bronze_medal] [cc_awards_bronze_trophy] [cc_awards_bronze_present] [] [] [] [] []