cc_keys_golden:
    type: item
    material: paper
    allow in material recipes: false
    mechanisms:
        custom_model_data: 201
    display name: <gold>Golden Key

cc_keys_silver:
    type: item
    material: paper
    allow in material recipes: false
    mechanisms:
        custom_model_data: 202
    display name: <aqua>Silver Key

cc_keys_simple:
    type: item
    material: paper
    allow in material recipes: false
    mechanisms:
        custom_model_data: 203
    display name: Key

cc_keys_ac_ticket:
    type: item
    material: paper
    allow in material recipes: false
    mechanisms:
        custom_model_data: 204
    display name: <dark_green>Arcade Ticket

cc_keys_menu:
    type: inventory
    inventory: CHEST
    title: <black>Keys
    size: 9
    gui: true
    slots:
    - [cc_keys_simple] [cc_keys_silver] [cc_keys_golden] [cc_keys_ac_ticket] [] [] [] [] []