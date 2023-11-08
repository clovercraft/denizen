cc_quest_lewis_w:
    type: world
    events:
        on player right clicks lectern in:cc_quest_lewis_notes:
            - give cc_quest_lewis_scholar_notes
            - narrate "<gray>You got <gold>Scholarly Notes<gray>! Check your inventory"
            - determine cancelled
        on player equips cc_quest_lewis_helm:
            - cast night_vision duration:infinite hide_particles
        on player unequips cc_quest_lewis_helm:
            - cast night_vision remove <player>

cc_quest_lewis_intro:
    type: task
    definitions: __player
    script:
        - narrate "Hello, fair traveller! I seem to have gotten quite lost. This port seems familiar at least... it must have been quite some time since I was last here. Thankfully, I kept a journal from the last time detailing how I was able to return home. If you could help me, I would be very grateful!"
        - clickable save:click_yes:
            - give cc_quest_lewis_journal
            - narrate "<gray>You got <gold>Journal O'Lewis<gray>! Check your inventory"
            - flag player lewis_state:accepted
        - narrate "[<green><element[Accept Quest].on_click[<entry[click_yes].command>]><reset>]"

cc_quest_lewis_check:
    type: task
    definitions: __player
    script:
        - if <player.inventory.quantity_item[ghast_tear]> >= 1 && <player.inventory.quantity_item[oak_sapling]> >= 1 && <player.inventory.quantity_item[jack_o_lantern]> >= 1:
            - narrate "Yes! Those are what the kind folk in the woods used to get me home! I hope they're okay. Oh. They moved? Well all the same, I'm glad they left you what you needed. I will get going soon, but for helping me out with this, let me leave you a gift."
            - give cc_quest_lewis_helm
        - else:
            - narrate "Hello there! You haven't found anything about those kind folks who helped me out before have you?"

cc_quest_lewis_journal:
    type: book
    title: <gold>Journal O'Lewis
    author: <yellow>Nereculas
    signed: true
    text:
    - I write this journal should I ever find myself in this strange world again. Yonder, about 330 paces where the solitary sun goes to sleep, there lies a hole in the earth like a mouth of rock and root. Within its belly lies a settlement of the kindhearted.
    - Magicians and scholars of stone worked wonders to return me to my home. Return to this place, uncover the tools they used once upon a time, and you shall be rewarded.

cc_quest_lewis_scholar_notes:
    type: book
    title: <gold>Scholarly Notes
    author: <yellow>Nereculas
    signed: true
    text:
    - You find a tattered, dampstained book deep within the belly of the earth.<p>Translating it takes a few moments, but it seems to describe a summoning ritual...no? a banishment?
    - A man of hollow eyes and eerie grin has found his way to us by means of cart. In strange tongue, he speaks of a distant land he must return to. The occultists tell us they require three things to reveal the path Mr. O'Lantern once tread
    - The first comes from sorrow, the tear of a ghast to heal this broken rift.<p>The second comes from our realm. The symbol of life, the sapling of oak.<p>The final, to light the way home. A pumpkin illuminated from within.

cc_quest_lewis_helm:
    type: item
    material: carved_pumpkin
    mechanisms:
        unbreakable: true
        attribute_modifiers:
            generic_armor:
                1:
                    operation: add_number
                    amount: 2
                    slot: head
    display name: <gold>O'Lantern Helm
    lore:
    - <green>Quest Reward!