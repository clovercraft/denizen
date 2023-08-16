cc_item_chocobar:
    type: item
    material: cookie
    mechanisms:
        custom_model_data: 1
    display name: Choco Bar
    flags:
        chocobar: 1
    recipes:
        1:
            type: shaped
            recipe_id: chocobar
            output_quantity: 3
            input:
            - air|air|air
            - sugar|milk_bucket|sugar
            - cocoa_beans|cocoa_beans|cocoa_beans

cc_item_spicy_chocobar:
    type: item
    material: cookie
    mechanisms:
        custom_model_data: 1
    display name: <dark_purple><italic>Choco Bar*
    lore:
    - <dark_red>Illicit
    - <gray>Firey
    flags:
        chocobar: 1
        spicy: 1
    recipes:
        1:
            type: shapeless
            input: cc_item_chocobar|torchflower

cc_item_pitcher_chocobar:
    type: item
    material: cookie
    mechanisms:
        custom_model_data: 1
    display name: <dark_purple><italic>Choco Bar*
    lore:
    - <dark_red>Illicit
    - <gray>Voidtouched
    flags:
        chocobar: 1
        pitcher: 1
    recipes:
        1:
            type: shapeless
            input: cc_item_chocobar|pitcher_plant


cc_chocobar_w:
    type: world
    events:
        on player consumes item:
            - if !<context.item.has_flag[chocobar]>:
                - stop
            - if <context.item.has_flag[spicy]>:
                - cast speed duration:3m amplifier:3 hide_particles
                - burn <player> duration:10s
            - if <context.item.has_flag[pitcher]>:
                - cast slow_falling duration:3m amplifier:3 hide_particles
                - cast blindness duration:10s
            - cast night_vision duration:3m hide_particles