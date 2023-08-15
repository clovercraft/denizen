cc_pronouns_world:
    type: world
    events:
        after player joins:
            - run cc_pronouns_init

cc_pronouns_init:
    type: task
    script:
        - if <player.has_flag[pronouns]>:
            - define display <player.display_name>
            - define listDisplay "<[display]> <gray>(<player.flag[pronouns]>)<reset>"
            - tablist update uuid:<player.uuid> display:<[listDisplay]>
            - narrate "pronouns set to: <player.flag[pronouns]>"
        - else:
            - if !<player.has_flag[pronoun_info]>:
                - narrate "Welcome back! You can now set your pronouns using the <yellow>/pronouns<reset> command. Your selection will display in the tablist. You will only see this reminder once."
                - flag <player> pronoun_info:1


cc_pronouns_setup_c:
    type: command
    debug: false
    name: pronouns
    description: Set your tab-list pronouns
    usage: /pronouns
    tab completions:
    script:
        - narrate "<gray>Click an option to select<reset>"
        - clickable save:p_sheher:
            - flag <player> pronouns:she/her
            - run cc_pronouns_init
        - clickable save:p_shethey:
            - flag <player> pronouns:she/they
            - run cc_pronouns_init
        - clickable save:p_theythem:
            - flag <player> pronouns:they/them
            - run cc_pronouns_init
        - clickable save:p_hehim:
            - flag <player> pronouns:he/him
            - run cc_pronouns_init
        - clickable save:p_hethey:
            - flag <player> pronouns:he/they
            - run cc_pronouns_init
        - clickable save:p_any:
            - flag <player> pronouns:any
            - run cc_pronouns_init
        - clickable save:p_itits:
            - flag <player> pronouns:it/its
            - run cc_pronouns_init
        - clickable save:p_neo:
            - flag <player> pronouns:neopronouns
            - run cc_pronouns_init
        - narrate "<element[<&lb>she/her<&rb>].on_click[<entry[p_sheher].command>]>"
        - narrate "<element[<&lb>she/they<&rb>].on_click[<entry[p_shethey].command>]>"
        - narrate "<element[<&lb>they/them<&rb>].on_click[<entry[p_theythem].command>]>"
        - narrate "<element[<&lb>he/him<&rb>].on_click[<entry[p_hehim].command>]>"
        - narrate "<element[<&lb>he/they<&rb>].on_click[<entry[p_hethey].command>]>"
        - narrate "<element[<&lb>any<&rb>].on_click[<entry[p_any].command>]>"
        - narrate "<element[<&lb>it/its<&rb>].on_click[<entry[p_itits].command>]>"
        - narrate "<element[<&lb>neopronouns<&rb>].on_click[<entry[p_neo].command>]>"
        - if <player.has_flag[pronouns]>:
            - narrate "<yellow>Currently: <player.flag[pronouns]>"