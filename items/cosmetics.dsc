cc_item_goose_hat_white:
    type: item
    material: paper
    allow in material recipes: false
    flags:
        reward: true
    mechanisms:
        custom_model_data: 400
    display name: Goose Hat

cc_item_balloons:
    type: item
    material: paper
    allow in material recipes: false
    mechanisms:
        custom_model_data: 401
    display name: Balloons


cc_cosmetic_items_menu:
    type: inventory
    inventory: CHEST
    title: <black>Cosmetic Items
    size: 9
    gui: true
    slots:
    - [cc_item_goose_hat_white] [cc_item_balloons] [] [] [] [] [] [] []