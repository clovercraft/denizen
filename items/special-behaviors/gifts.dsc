cc_items_behavior_gifts_clock:
    type: world
    debug: false
    events:
        on player right clicks air with:cc_awards_bronze_present:
            - define item <player.item_in_hand>
            - run cc_items_behavior_gifts def:<[item]>
        on player right clicks air with:cc_awards_silver_present:
            - define item <player.item_in_hand>
            - run cc_items_behavior_gifts def:<[item]>
        on player right clicks air with:cc_awards_golden_present:
            - define item <player.item_in_hand>
            - run cc_items_behavior_gifts def:<[item]>

cc_items_behavior_gifts:
    type: task
    definitions: item
    script:
        - if !<[item].has_flag[gift]>:
                - stop
        - define gift_category <[item].flag[gift]>
        - define gift_options <script[cc_items_behavior_gifts_loot].data_key[<[gift_category]>]>
        - define max_opt <[gift_options].size>
        - define roll <util.random.int[1].to[<[max_opt]>]>
        - define gift <[gift_options].get[<[roll]>]>
        - foreach <util.color_names> as:color:
            - playeffect effect:ENTITY_EFFECT at:<player.eye_location> quantity:25 special_data:[color=<[color]>]
        - playsound <player.location> sound:ENTITY_PLAYER_LEVELUP
        - take iteminhand
        - give <[gift]> slot:hand

cc_items_behavior_gifts_loot:
    type: data
    bronze:
        - saddle
        - golden_apple
        - cc_item_balloons
        - cc_item_balloons
        - cc_item_balloons
    silver:
        - wither_skeleton_skull
        - camel_spawn_egg
        - cc_item_goose_hat_white
        - cc_item_goose_hat_white
    gold:
        - enchanted_golden_apple
        - enchanted_golden_apple
        - enchanted_golden_apple
        - enchanted_golden_apple
        - netherite_ingot
        - beacon
        - silence_armor_trim_smithing_template
