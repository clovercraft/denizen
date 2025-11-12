cc_firstjoin_choices:
    type: world
    events:
        on player right clicks oak_button in:firstjoin_ngc:
            - run cc_firstjoin_confirm def:ngc
        on player right clicks oak_button in:firstjoin_kowloon:
            - run cc_firstjoin_confirm def:kowloon
        on player right clicks oak_button in:firstjoin_lux:
            - run cc_firstjoin_confirm def:lux
        on player right clicks oak_button in:firstjoin_wild:
            - run cc_firstjoin_confirm def:wild

cc_firstjoin_confirm:
    type: task
    definitions: warp
    script:
        - clickable save:confirm:
            - run cc_firstjoin_choose def:<[warp]>
        - clickable save:cancel:
            - narrate "<gray>Cancelled choice."
            - stop
        - narrate "This choice is final. Are you sure? <element[<green>Yes<reset>].on_click[<entry[confirm].command>]> | <element[<red>Cancel<reset>].on_click[<entry[cancel].command>]>"

cc_firstjoin_choose:
    type: task
    definitions: warp
    script:
        - if <player.has_flag[hometown]>:
            - narrate "You have already selected a home town. You cannot select another."
            - stop
        - permission add "essentials.warps.lobby"
        - permission add "essentials.warps.spawn"
        - flag player hometown:<[warp]>
        - if <[warp]> == wild:
            - run cc_firstjoin_wild
            - stop
        - define permission "essentials.warps.<[warp]>"
        - permission add <[permission]>
        - narrate "You have chosen your home. Good luck on your journey!"
        - wait 3s
        - execute as_player "warp <[warp]>"
        - wait 3s
        - narrate "<&7>Use <&a>/lobby<&7> at any time to visit the server lobby for basic goods, and to access other worlds."

cc_firstjoin_wild:
    type: task
    script:
        - narrate "You have chosen the path of the wilderness."
        - wait 3s
        - narrate "Explore where you will, and travel to the cities in due time."
        - wait 3s
        - narrate "We shall place you in this world, some place new. Good luck."
        - wait 3s
        - execute as_player "wild"