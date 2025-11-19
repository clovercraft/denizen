kitsune_transformation:
    type: world
    events:
        on player right clicks air with:hoshi_no_tama:
            - if <player.has_flag[transforming]>:
                - flag <player> transforming:1 expire:10s
                - run on_transform_cooldown
            - else:
                - flag <player> transforming:1 expire:10s
                - narrate "<&7>Your <&b><bold>Hoshi No Tama<&7> Glows"
                - wait 1s
                - foreach <player.equipment_map> key:key as:val:
                    - drop <[val]>
                - equip <player> head:kitsune_ears
                - equip <player> body:air
                - equip <player> legs:air
                - equip <player> boots:air
                - equip <player> hand:air
                - equip <player> offhand:air
                - equip <player> saddle:air
                - wait 1s
                - narrate "<&7>Your <&b><bold>Hoshi No Tama<&7> Stops Glowing"


on_transform_cooldown:
    type: task
    script:
        - narrate "<&7>You tried to access your powers too often. Please wait 10 Seconds."

kitsune_ears:
    type: item
    material: paper
    allow in material recipes: false
    display name: <&b><bold>Kitsune Ears
    lore:
    - <&6>A visible sign of your Kitsune Nature
    enchantments:
    - protection:4
    - aqua_affinity:3
    - respiration:3
    - binding_curse:1
    - vanishing_curse:1
    mechanisms:
        hides: all
        custom_model_data: 1004
        attribute_modifiers:
            generic_armor:
                1:
                    operation: add_number
                    amount: 5
                    slot: head



