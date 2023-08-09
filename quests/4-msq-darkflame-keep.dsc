cc_msq4_intro:
    type: task
    script:
        - narrate "Thanks for your help with all that portal research. Since we've had the gates open to the other side, I've done a bit of exploring"
        - narrate "While I was wandering that fiendish hellscape, I stumbled upon the fellow downstairs, <yellow>Bikz<reset>. He seems to know quite a lot about the landscape over there."
        - narrate "I've been looking into these strange elixirs we've been finding. Bikz seems to think he knows where we can learn more. Why don't you talk to him and see if you can help."
        - flag <player> msq4_state:start

cc_msq4_entry:
    type: task
    script:
        - define state <proc[cc_msq4_state].context[<player>]>
        - choose <[state]>:
            - case start:
                - run cc_msq4_start
            - case accepted:
                - run cc_msq4_bookcheck

cc_msq4_start:
    type: task
    script:
        - narrate "Hm? Oh, you must be one of Avery's adventurers. You sure you want to take this one? It could cost you your life."
        - clickable save:click_yes:
            - narrate "Good then. There's an old fortress out in the distant realms. Legend has it that keep is where all potion brewing research originated."
            - narrate "I've done some tinkering, and I think I've got a lock on a portal that should put you just outside the keep."
            - narrate "Travel there, and bring back those ancient dolts notes so we can get to making potions again, hm?"
            - flag <player> msq4_state:accepted
            - permission add clovercraft.msq.darkflamekeep
            - clickable cc_msq4_infoblock save:info
            - narrate "<green><element[continue].on_click[<entry[info].command>]>"
        - clickable save:click_no:
            - narrate "Probably for the best. Gear up and come back later."
            - stop
        - narrate "<element[<green>I'm ready.<reset>].on_click[<entry[click_yes].command>]> | <element[<gray>Not yet.<reset>].on_click[<entry[click_no].command>]>"

cc_msq4_bookcheck:
    type: task
    script:
        - if <player.inventory.contains_item[cc_msq4_tome_of_brewing]>:
            - narrate "Huh. You survived then? Curious."
            - narrate "Take that book to Avery, I've no use for it but they should be able to sort it out."
        - else:
            - narrate "No book yet hm? Well, we can only expect so much from you overworlders."
        - stop

cc_msq4_handin:
    type: task
    script:
        - if <player.inventory.contains_item[cc_msq4_tome_of_brewing]>:
            - narrate "Excellent! I'm so glad you made it out of there, what a terrible place. This knowledge will help enormously though, one moment..."
            - take item:cc_msq4_tome_of_brewing
            - lookclose <npc[27]> false
            - walk <npc[27]> <npc.anchor[potions]>
            - wait 5s
            - walk <npc[27]> <npc.anchor[idle]>
            - lookclose <npc[27]> true
            - narrate "That'll do it! I think this should be of some use. Throw it in one of these <yellow>brewing stands<reset> with some ingredients and a bottle and you should get a potion!"
            - give blaze_powder quantity:3
            - flag <player> msq4_state:completed
            - flag <player> brewing_enabled:true

cc_msq4_infoblock:
    type: task
    script:
        - narrate "<dark_gray>MSQ4: <gold>Darkflame Keep<reset>"
        - narrate "  <gray>Darkflame Keep is a challenging dungeon, intended to be played with a party of four players."
        - narrate "  <gray>To form a party, find some friends and use the <yellow>/party invite <&lt>player<&gt><gray> command to invite them to your party"
        - narrate "  <gray>You'll be notified in chat when they accept your invitation."
        - narrate "  <gray>When you're ready, use the command <yellow>/dungeon play darkflame_keep<gray> to begin the dungeon."
        - narrate "  <gray>Note: All players must have accepted the quest from <yellow>Bikz<gray> before they will be able to play the dungeon."
        - narrate "  <gray>Once you've completed the dungeon, return to <yellow>Avery<gray> with a <dark_purple>Tome of Brewing<gray> to help them further research potions."

cc_msq4_state:
    type: procedure
    definitions: __player
    script:
        - if <player.has_flag[msq4_state]>:
            - define state <player.flag[msq4_state]>
        - else:
            - define state start
        - determine <[state]>

cc_msq4_tome_of_brewing:
    type: item
    material: book
    display name: <&d>Tome of Brewing<&r>
    lore:
    - <&5><&k>Forbidden Knowledge
    allow in material recipes: false