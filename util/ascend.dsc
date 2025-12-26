cc_ascend_command:
    type: command
    name: ascend
    description: Become ungovernable
    usage: /ascend
    permission: cc.ascencion
    script:
        - adjust <player> invulnerable:true
        - glow <player> true
        - spawn lightning_bolt <player.location>
        - cast speed amplifier:5 duration:infinite hide_particles
        - cast night_vision duration:infinite hide_particles
        - cast saturation amplifier:10
        - cast jump duration:infinite amplifier:5 hide_particles
        - define held_item <player.item_in_hand>
        - flag player ascencion_item:<[held_item]>
        - take iteminhand
        - give cc_ascend_sword

cc_mortal_command:
    type: command
    name: remortalize
    description: Return to the mortal coil
    usage: /remortalize
    permission: cc.ascencion
    script:
        - adjust <player> invulnerable:false
        - glow <player> false
        - cast speed remove <player>
        - cast night_vision remove <player>
        - cast jump remove <player>
        - take item:cc_ascend_sword
        - give item:<player.flag[ascencion_item]>

cc_ascend_sword:
    type: item
    material: netherite_sword
    allow in material recipes: false
    display name: <dark_red>Crestbreaker
    lore:
        - <dark_purple>A blade turned red by blood
        - <dark_purple>Forged to break the world
    mechanisms:
        attribute_modifiers:
            attack_damage:
                1:
                    operation: add_number
                    amount: 100
                    slot: HAND