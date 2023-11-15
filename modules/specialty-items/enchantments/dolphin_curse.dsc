cc_enchant_dolphinscurse:
    type: enchantment
    id: cc_curse_dolphin
    slots:
    - feet
    rarity: VERY_RARE
    category: ARMOR_FEET
    full_name: Dolphins Curse
    min_level: 1
    max_level: 1
    min_cost: 5
    max_cost: 5
    is_curse: true
    is_tradable: true
    is_discoverable: true

cc_enchant_dolphins_curse_clock:
    type: world
    events:
        on player toggles swimming:
            - run cc_enchant_dolphinscurse_check
        on delta time secondly every:15:
            - run cc_enchant_dolphinscurse_tick
        after dolphin dies:
            - drop cc_enchant_dolphinscurse_book <context.damager.location>

cc_enchant_dolphinscurse_check:
    type: task
    definitions: __player
    script:
        - define boots <item[<player.equipment_map.get[boots]>]>
        - define enchants <[boots].enchantment_types>
        - if <[enchants].contains[<enchantment[cc_curse_dolphin,1]>]>:
            - if <player.has_flag[dolphins_curse]>:
                - flag player dolphins_curse:!
            - else:
                - flag player dolphins_curse:1

cc_enchant_dolphinscurse_tick:
    type: task
    script:
        - define swimmers <server.players_flagged[dolphins_curse]>
        - cast speed amplifier:3 duration:18 hide_particles
        - take xp quantity:5

cc_enchant_dolphinscurse_boots:
    type: item
    material: netherite_boots
    display name: Flippers
    enchantments:
    - cc_curse_dolphin:1
