cc_attr_recoil:
    type: task
    script:
        - define destination <player.location.backward[3]>
        - push <player> origin:<player.location> destination:<[destination]> no_rotate

cc_enchantment_recoil:
    type: enchantment
    id: cc_recoil_enchant
    slots:
    - mainhand
    - offhand
    rarity: VERY_RARE
    category: BOW
    full_name: Recoil <context.level>
    min_level: 1
    max_level: 5
    min_cost: <context.level.mul[1]>
    max_cost: <context.level.mul[2]>
    after attack:
        - define destination <context.attacker.location.backward[<context.level>]>
        - push <context.attacker> origin:<context.attacker.location> destination:<[destination]> no_rotate