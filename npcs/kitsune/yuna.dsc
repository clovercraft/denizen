hoshi_no_tama:
    type: item
    material: heart_of_the_sea
    display name: <&b><bold>Hoshi No Tama
    lore:
    - <&6>Houses Part of your Soul<&7>
    enchantments:
    - lure:1
    mechanisms:
        hides: all

yuna_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run yuna_interact


yuna_interact:
    type: task
    script:
        - if <player.has_flag[yuna_quest_start]>:
            - run yuna_wait_for_return
            - stop
        - if <player.has_flag[yuna_quest_complete]>:
            - narrate "You may repeat this quest in 1 day"
        - narrate "<&7>Ah… a mortal with a curious spirit."
        - wait 1
        - narrate "<&7>I am <&5>Yuna, Kistsune Matriarch<&7> of the Hidden Grove."
        - wait 1
        - narrate "<&7>To earn my trust—and a fragment of my power—you must aid me in restoring the groves sacred power."
        - wait 1
        - narrate "<&7>Bring me these offerings, and I shall grant you a Hoshi no Tama, the star orb of my kin."
        - wait 1
        - clickable yuna_accept save:yes
        - clickable yuna_refuse save:no
        - narrate "<&7><element[<&lb><green>Yes<&7><&rb>].on_click[<entry[yes].command>]> <&7>or <element[<&lb><red>No<&7><&rb>].on_click[<entry[no].command>]>"

yuna_accept:
    type: task
    script:
        - flag player yuna_quest_start:1
        - flag player yuna_ghast_tear:!
        - flag player yuna_glowstone_dust:!
        - flag player yuna_rabbit_hide:!
        - flag player yuna_amethyst_shard:!
        - narrate "I need you to gather the follow items:"
        - wait 1
        - narrate "1 <&6>Ghast Tear<&7> - A symbol of sorrow"
        - wait 1
        - narrate "1 <&6>Glowstone Dust<&7> - The essence of light"
        - wait 1
        - narrate "1 <&6>Rabbit Hide<&7> - To veil your spirit"
        - wait 1
        - narrate "1 <&6>Amethyst Shard<&7> - A crystal of dreams"
        - wait 1
        - narrate "<&7>[Quest <&b><bold>The Kitsunes Favor<&7> accepted. Gather the items listed to get your reward."

yuna_refuse:
    type: task
    script:
        - narrate "<&7>Okay. Come back if you ever change your mind"
        - narrate "<&7>[Quest refused]"

yuna_wait_for_return:
    type: task
    script:
        - define item <player.item_in_hand>
        - if <[item]> == <item[ghast_tear]>:
            - narrate "<&7>Ah.  The Ghast Tear."
            - take item:ghast_tear
            - narrate "<&7>[<&b><bold>1 Ghast Tear - A symbol of sorrow<&7> removed]"
            - flag player yuna_ghast_tear:1
            - wait 2
        - if <[item]> == <item[glowstone_dust]>:
            - narrate "<&7>Ah.  The Glowstone Dust."
            - take item:glowstone_dust
            - narrate "<&7>[<&b><bold>1 Glowstone Dust - The essence of light<&7> removed]"
            - flag player yuna_glowstone_dust:1
            - wait 2
        - if <[item]> == <item[rabbit_hide]>:
            - narrate "<&7>Ah.  The Rabbit Hide."
            - take item:rabbit_hide
            - narrate "<&7>[<&b><bold>1 Rabbit Hide - To veil your spirit<&7> removed]"
            - flag player yuna_rabbit_hide:1
            - wait 2
        - if <[item]> == <item[amethyst_shard]>:
            - narrate "<&7>Ah.  The Amethyst Shard."
            - take item:amethyst_shard
            - narrate "<&7>[<&b><bold>1 Amethyst Shard - A crystal of dreams<&7> removed]"
            - flag player yuna_amethyst_shard:1
            - wait 2
        - if <player.has_flag[yuna_ghast_tear]> && <player.has_flag[yuna_glowstone_dust]> && <player.has_flag[yuna_rabbit_hide]> && <player.has_flag[yuna_amethyst_shard]>:
            - narrate "<&7>Well done!!"
            - flag player yuna_ghast_tear:!
            - flag player yuna_glowstone_dust:!
            - flag player yuna_rabbit_hide:!
            - flag player yuna_amethyst_shard:!
            - wait 2
            - toast "<&7>Quest Complete: <&b><bold>The Kitsune's Favor" icon:hoshi_no_tama
            - give hoshi_no_tama
            - narrate "<&7>[Quest <&b><bold>The Kitsune's Favor<&7> complete. May be repeated in 1 day.]"
            - flag player yuna_quest_start:!
            - flag player yuna_quest_complete:1 expire:1d
        - else:
            - run yuna_quest_items_left


yuna_quest_items_left:
    type: task
    script:
        - if !<player.has_flag[yuna_ghast_tear]>:
            - narrate "You still need to hand in <&b><bold>1 Ghast Tear - A symbol of sorrow"
            - wait 1s
        - if !<player.has_flag[yuna_glowstone_dust]>:
            - narrate "You still need to hand in <&b><bold>1 Glowstone Dust - The essence of light"
            - wait 1s
        - if !<player.has_flag[yuna_rabbit_hide]>:
            - narrate "You still need to hand in <&b><bold>1 Rabbit Hide - To veil your spirit"
            - wait 1s
        - if !<player.has_flag[yuna_amethyst_shard]>:
            - narrate "You still need to hand in <&b><bold>1 Amethyst Shard - A crystal of dreams"
            - wait 1s


yuna_debug:
    type: command
    name: yunareset
    description: Resets All Yuna flags
    usage: /yunareset <&lt>category<&gt>
    script:
            - flag player yuna_ghast_tear:!
            - flag player yuna_glowstone_dust:!
            - flag player yuna_rabbit_hide:!
            - flag player yuna_amethyst_shard:!
            - flag player yuna_quest_start:!
            - flag player yuna_quest_complete:!