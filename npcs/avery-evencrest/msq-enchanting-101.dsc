cc_msq2_start:
    type: task
    script:
        - narrate "Oh, hey! All those items everyone donated were so helpful for my research. I figure it's about time I pay it back."
        - narrate "Bring me some ink, some paper, and some lapis lazuli, and I'll explain everything."
        - clickable save:click_yes:
            - run cc_quests_rankup
            - flag <player> msq2_state:accepted
            - run cc_msq2_infoblock
        - clickable save:click_no:
            - narrate "I'll be here if you change your mind."
        - narrate "<green><element[Got it].on_click[<entry[click_yes].command>]><reset> | <red><element[Not now].on_click[<entry[click_no].command>]><reset>"

cc_msq2_handin:
    type: task
    script:
        - if <proc[cc_msq2_items_check]> == 0:
            - narrate "Hey, don't forget to bring me those items when you're ready! There's so much to teach!"
            - run cc_msq2_infoblock
            - stop
        - clickable save:click_yes:
            - take item:paper quantity:6
            - take item:lapis_lazuli quantity:6
            - take item:ink_sac quantity:1
            - flag <player> msq2_state:completed
            - flag <player> enchanting_enabled:1
            - run cc_quests_rankup
            - narrate "<dark_green><italic>Several hours pass as Avery teaches you the art of enchanting...<reset>"
            - narrate "And there you have it! There's so much more to magic than just enchanting, but it's a start. You're all set to make your own enchanted items."
        - clickable save:click_no:
            - narrate "Alright, just let me know when you're ready."
        - narrate "Great, looks like you've got everything. So thos items you brought me? The strange purple glow, the weird powers? They were enchanted. Imbued with magical energy to enhance them."
        - narrate "I can teach you how to do it yourself, so you can make your gear even better."
        - narrate "<green><element[Okay].on_click[<entry[click_yes].command>]><reset> | <red><element[Not now].on_click[<entry[click_no].command>]><reset>"


cc_msq2_items_check:
    type: procedure
    script:
        - define paper_count <player.inventory.quantity_item[paper]>
        - define ink_count <player.inventory.quantity_item[ink_sac]>
        - define lapis_count <player.inventory.quantity_item[lapis_lazuli]>
        - if <[paper_count]> >= 6 && <[ink_count]> >= 1 && <[lapis_count]> >= 6:
            - determine 1
        - else:
            - determine 0


cc_msq2_infoblock:
    type: task
    script:
        - narrate "<dark_green><bold>MSQ: Enchanting 101<reset>"
        - narrate "  <dark_green>Collect six pieces of paper, an ink sac, and six pieces of Lapis Lazuli for Avery<reset>"