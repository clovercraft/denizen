cc_npc_capitoltavernkeep_quest_give_t:
    type: task
    script:
        - narrate "<dark_green>Talk to all four Capitol Citizen NPCs.<reset>"
        - narrate "<yellow>Duncan Miller<dark_green> can be found at his farm on the Southern end of town."
        - narrate "<yellow>Arthur Moore<dark_green> can be found just North of <yellow>Duncan<dark_green> in the Foremans Office of Moore Construction."
        - narrate "<yellow>Agnes Thorgrim<dark_green> can be found at her Smithy at the market square."
        - narrate "<yellow>Wyatt Combse<dark_green> can be found at the lumber mill across the bridge to the North of the dry docks."

cc_npc_capitoltavernkeep_quest_handin_t:
    type: task
    script:
        - flag <player> capitoltavernkeep_quest_greetings:1
        - give stone_axe quantity:1
        - give stone_shovel quantity:1
        - give stone_pickaxe quantity:1
        - give stone_sword quantity:1
        - give leather_boots quantity:1
        - give leather_chestplate quantity:1
        - give leather_helmet quantity:1
        - give leather_leggings quantity:1
        - give torch quantity:32