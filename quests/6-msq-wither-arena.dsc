cc_msq6_avery:
    type: task
    script:
        - clickable save:msq6_avery_two:
                - narrate "I brought them back to town here and was working with a local sorcerer named <yellow>Reginald Alchemite<reset> to work out the location of the ritual, but he seems to have left town rather abruptly. He did, however, leave me this <yellow>map<reset>. Perhaps you can go see what's out there?"
                - run cc_msq6_giveitems
        - clickable save:msq6_avery_one:
            - narrate "Do you recall those horrifying blackened skeletons you fought off? Well. I've found records that call them <yellow>Wither Skeletons<reset>. Apparently their skulls were used in some ancient rituals. <gray><element[<&lb>Continue<&rb>].on_click[<entry[msq6_avery_two].command>]>"
        - narrate "Oh! Hello there! I was hoping you'd stop by. Bikz and I have been doing some exploring of that massive keep you cleared out for us. There's so much to learn! <gray><element[<&lb>Continue<&rb>].on_click[<entry[msq6_avery_one].command>]>"

cc_msq6_entry:
    type: task
    script:
        - if <player.has_flag[msq6_state]> && <player.flag[msq6_state]> == start:
            - if <player.inventory.contains_item[nether_star]>:
                - run cc_msq6_handin
                - stop
            - narrate "Well, no time like the present. Go on champ."
            - run cc_msq6_infoblock
            - stop
        - flag <player> msq6_state:start
        - permission add clovercraft.msq.towersofratia
        - clickable save:continue1:
            - narrate "Alas, the towers are sealed to me. Even if I could enter, I would not dare stand against such an adversary. You, however... You might stand a chance. Perhaps you can find a way inside and retrieve a <yellow>Wither Star<reset> for me?"
            - run cc_msq6_infoblock
        - narrate "Greetings, adventurer. I thought you would arrive a little sooner, ah well. Avery found my map then, I take it? This area behind me is known as the <yellow>Towers of Ratia<reset>. Long ago, mages and warriors would work together here to harvest from the great beast <yellow>Wither<reset>. <gray><element[<&lb>Continue<&rb>].on_click[<entry[continue1].command>]>"

cc_msq6_handin:
    type: task
    script:
        - flag <player> msq6_state:completed
        - narrate "Very well done. All that power! And you've harnessed it for yourself. I can only imagine what we might do with this discovery. I have much work to do now, you can be on your way. Here, for your trouble."
        - money give players:<player> quantity:500
        - narrate "<yellow>+500 smiley bucks!"
        - narrate "<yellow>Quest Complete!"

cc_msq6_giveitems:
    type: task
    debug: true
    script:
        - give filled_map[map=429]
        - give cc_msq6_infobook

cc_msq6_infobook:
    type: book
    title: <gold>MSQ6<&co> Towers of Ratia
    author: <green>Clovercraft
    signed: true
    text:
    - Main Story Quest 6<n>Towers of Ratia<p>Avery has been working with Reginald Alchemite to locate the ritual site used to summon the Wither.<p>Reginald has left town, leaving only a map pointing to his location.
    - Avery and Reginald had narrowed the location down to an area South-East of Silanah, around x500, z4500.<p>Follow the map to the towers and find Reginald.

cc_msq6_infoblock:
    type: task
    script:
        - narrate "<dark_gray>MSQ6: <gold>Towers of Ratia<reset>"
        - narrate "  <gray>Dungeon"
        - narrate "  <gray>Difficulty: <gold>Moderate"
        - narrate "  <gray>Minimum Players: 3"
        - narrate "  <gray>Start Command: <yellow>/dungeon play towersOfRatia"
        - narrate "  <gray>Note: All players must have accepted the quest from <yellow>Reginald<gray> before they will be able to play the dungeon."