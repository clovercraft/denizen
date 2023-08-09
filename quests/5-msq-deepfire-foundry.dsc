cc_msq5_avery:
    type: task
    script:
        - narrate "Oh, hello there! Thanks so much for your help clearing out that fortress in the nether! Bikz and I have been studying the area since you made it safe enough for us. Actually, <yellow>Bikz<&r> was mentioning something about a deeper area he thought we might be able to access. You should chat with him."

cc_msq5_handin:
    type: task
    script:
        - flag <player> msq5_state:completed
        - narrate "HAH! You actually did it! I think Avery nearly had a heart attack, going on about archeological integrity."
        - narrate "In any case, well done. Sounded like quite the battle down there. Looks like you got a good share of the loot too."
        - narrate "You can take that there template and netherite and use it in a <yellow>Smithing Table<reset> to make even stronger armor."
        - wait 5s
        - narrate "<dark_gray>Blew up a damn hallway hah. I like this kid."

cc_msq5_entry:
    type: task
    script:
        - if <player.has_flag[msq5_state]> && <player.flag[msq5_state]> == start:
            - if <player.inventory.quantity_item[netherite_upgrade_smithing_template]> > 0:
                - run cc_msq5_handin
                - stop
            - else:
                - narrate "Hm? Haven't gotten around to digging that hole yet?"
                - wait 5s
                - run cc_msq5_infoblock
                - stop
        - flag <player> msq5_state:start
        - permission add clovercraft.msq.deepflamefoundry
        - narrate "Hm? Ah, right. Avery mentioned you might stop by. Hey, lean in close here a sec."
        - wait 3s
        - narrate "<gray>Avery wouldn't approve, but uh. you wanna blow something up?<&r>"
        - wait 3s
        - narrate "I found a weak spot in one of the caved in hallways in that big old stronghold you tore through. There's probably more to find back there if we can find a way through."
        - wait 3s
        - narrate "<gray>A way through like this TNT, if you know what I mean."
        - give tnt quantity:1
        - wait 3s
        - narrate "I think you might be able to figure it out."
        - wait 5s
        - run cc_msq5_infoblock

cc_msq5_infoblock:
    type: task
    script:
        - narrate "<dark_gray>MSQ5: <gold>Deep Fire Foundry<reset>"
        - narrate "  <gray>Deep Fire Foundry is a challenging dungeon with both combat and puzzles. It is intended for a party of four players, but can be run with a minimum of two."
        - narrate "  <gray>To form a party, find some friends and use the <yellow>/party invite <&lt>player<&gt><gray> command to invite them to your party"
        - narrate "  <gray>You'll be notified in chat when they accept your invitation."
        - narrate "  <gray>When you're ready, use the command <yellow>/dungeon play deep_fire_foundry<gray> to begin the dungeon."
        - narrate "  <gray>Note: All players must have accepted the quest from <yellow>Bikz<gray> before they will be able to play the dungeon."
        - narrate "  <gray>Once you've completed the dungeon, return to <yellow>Bikz<gray> with an <dark_purple>Upgrade Template<gray> to help them further research potions."