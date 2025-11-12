cc_items_command:
    type: command
    name: ccitems
    description: Open the custom items menu
    usage: /ccitems <&lt>category<&gt>
    permission: cc.items
    tab completions:
        1: awards|food|keys|games|icons|cosmetics
    script:
        - define type <context.args.get[1]>
        - choose <[type]>:
            - case awards:
                - inventory open d:cc_awards_menu
            - case food:
                - inventory open d:cc_food_menu
            - case keys:
                - inventory open d:cc_keys_menu
            - case games:
                - inventory open d:cc_game_items_menu
            - case icons:
                - inventory open d:cc_icon_items_menu
            - case cosmetics:
                - inventory open d:cc_cosmetic_items_menu
            - default:
                - narrate "You did not specify a valid item category. Please choose from awards, food, or keeys"

cc_items_w:
    type: world
    events:
        on player clicks item in cc_awards_menu:
            - run cc_items_onclick def:<context.item>|cc_awards_menu
        on player clicks item in cc_food_menu:
            - run cc_items_onclick def:<context.item>|cc_food_menu
        on player clicks item in cc_keys_menu:
            - run cc_items_onclick def:<context.item>|cc_keys_menu
        on player clicks item in cc_game_items_menu:
            - run cc_items_onclick def:<context.item>|cc_game_items_menu
        on player clicks item in cc_icon_items_menu:
            - run cc_items_onclick def:<context.item>|cc_icon_items_menu
        on player clicks item in cc_cosmetic_items_menu:
            - run cc_items_onclick def:<context.item>|cc_cosmetic_items_menu

cc_items_onclick:
    type: task
    definitions: item|menu
    script:
        - if <[item]> == <item[air]>:
            - stop
        - narrate "Giving <player.display_name> 1: <[item].display>"
        - give <[item]> quantity:1