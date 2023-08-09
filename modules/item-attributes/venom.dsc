cc_enchantment_venom:
    type: enchantment
    id: cc_venom_enchant
    slots:
    - mainhand
    - offhand
    rarity: VERY_RARE
    category: BOW
    full_name: Venom
    min_level: 1
    max_level: 1
    min_cost: <context.level.mul[1]>
    max_cost: <context.level.mul[1]>
    after attack:
        - define slow_dur <util.random.int[5].to[10]>
        - define poison_dur <util.random.int[10].to[20]>
        - cast slow duration:<[slow_dur]> <context.victim>
        - cast poison duration:<[poison_dur]> <context.victim>