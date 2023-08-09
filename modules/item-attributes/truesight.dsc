cc_enchantment_venom:
    type: enchantment
    id: cc_truesight_enchant
    slots:
    - mainhand
    - offhand
    rarity: VERY_RARE
    category: BOW
    full_name: Truesight
    min_level: 1
    max_level: 1
    min_cost: <context.level.mul[1]>
    max_cost: <context.level.mul[1]>
    after attack:
        - cast glowing duration:20s <context.victim>