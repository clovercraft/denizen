cc_food_chocolate_bar:
    type: item
    material: cookie
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1
    display name: Chocolate Bar

cc_food_tropical_poboy:
    type: item
    material: cookie
    mechanisms:
        custom_model_data: 2
    display name: Tropical Poboy
    recipes:
        1:
            type: shaped
            recipe_id: tropical_poboy
            output_quantity: 1
            input:
            - air|bread|air
            - air|tropical_fish|air
            - air|bread|air

cc_food_cotton_candy:
    type: item
    material: cookie
    allow in material recipes: false
    mechanisms:
        custom_model_data: 3
    display name: Cotton Candy

cc_food_popcorn:
    type: item
    material: cookie
    allow in material recipes: false
    mechanisms:
        custom_model_data: 4
    display name: Popcorn

cc_food_ice_cream_vanilla:
    type: item
    material: cookie
    allow in material recipes: false
    mechanisms:
        custom_model_data: 5
    display name: Vanilla Ice Cream

cc_food_ice_cream_chocolate:
    type: item
    material: cookie
    allow in material recipes: false
    mechanisms:
        custom_model_data: 6
    display name: Chocolate Ice Cream

cc_food_ice_cream_strawberry:
    type: item
    material: cookie
    allow in material recipes: false
    mechanisms:
        custom_model_data: 7
    display name: Strawberry Ice Cream

cc_food_sweetroll:
    type: item
    material: cookie
    allow in material recipes: false
    mechanisms:
        custom_model_data: 8
    display name: Sweetroll

cc_food_mead:
    type: item
    material: potion
    allow in material recipes: false
    mechanisms:
        custom_model_data: 100
    display name: Mead

cc_food_wine:
    type: item
    material: potion
    allow in material recipes: false
    mechanisms:
        custom_model_data: 101
    display name: Wine

cc_food_rum:
    type: item
    material: potion
    allow in material recipes: false
    mechanisms:
        custom_model_data: 102
    display name: Rum

cc_food_menu:
    type: inventory
    inventory: CHEST
    title: <black>Foods
    size: 18
    gui: true
    slots:
    - [cc_food_chocolate_bar] [cc_food_tropical_poboy] [cc_food_cotton_candy] [cc_food_popcorn] [cc_food_ice_cream_vanilla] [cc_food_ice_cream_chocolate] [cc_food_ice_cream_strawberry] [cc_food_sweetroll] []
    - [cc_food_mead] [cc_food_wine] [cc_food_rum] [] [] [] [] [] []