#Nikto Sections
nikto_interact:
    type: task
    script:
        - if <player.has_flag[silverfish_quest_refused]>:
            - narrate "<&7>You may not attempt this quest for another <player.flag_expiration[silverfish_quest_refused].from_now.formatted>"
            - stop
        - if <player.has_flag[silverfish_familiar]>:
            - if <player.has_flag[silverfish_quest_complete]>:
                - narrate "Quest Already Complete"
                - stop
            - if <player.has_flag[klaatu]>:
                - narrate "I's brother... no more. Knowledge accepted."
                - wait 1s
                - narrate "I's thank <player.name>. I's found this, you take."
                - wait 1s
                - if <player.flag[ridicule_klaatu]> >= 9:
                    - give silverfish_lesser_reward_3
                    - narrate "Oh, before <player.name> go, We's open shop's for <player.name>"
                    - toast "<&7>Quest Complete: <&5><bold>Find Missing Brother" icon:silverfish_reward
                    - flag player silverfish_quest_complete:1
                    - stop
                - if <player.flag[ridicule_klaatu]> >= 5:
                    - give silverfish_lesser_reward_2
                    - narrate "Oh, before <player.name> go, We's open shop's for <player.name>"
                    - toast "<&7>Quest Complete: <&5><bold>Find Missing Brother" icon:silverfish_reward
                    - flag player silverfish_quest_complete:1
                    - stop
                - if <player.flag[ridicule_klaatu]> >= 1:
                    - give silverfish_lesser_reward_1
                    - narrate "Oh, before <player.name> go, We's open shop's for <player.name>"
                    - toast "<&7>Quest Complete: <&5><bold>Find Missing Brother" icon:silverfish_reward
                    - flag player silverfish_quest_complete:1
                    - stop
                - else:
                    - give silverfish_lesser_reward
                    - narrate "Oh, before <player.name> go, We's open shop's for <player.name>"
                    - toast "<&7>Quest Complete: <&5><bold>Find Missing Brother" icon:silverfish_reward
                    - flag player silverfish_quest_complete:1
                    - stop
            - if <player.has_flag[silverfish_quest_3]>:
                - narrate "Barada, no more part of mind. Barada free. I's only have Klaatu."
                - wait 1s
                - narrate "I's knowing Barada desired no mind. Always want free."
                - wait 1s
                - narrate "I's thank <player.name>. I's found this in metal cave, you take."
                - wait 1s
                - give silverfish_reward
                - narrate "Oh, before <player.name> go, We's open shop's for <player.name>"
                - toast "<&7>Quest Complete: <&5><bold>Find Missing Brother" icon:silverfish_reward
                - flag player silverfish_quest_complete:1
                - stop
            - if <player.has_flag[silverfish_quest_2]>:
                - narrate "I thankful to <player.name>."
                - wait 2
                - narrate "Last seen, talk to I brother Klaatu. There. Go talk to get more knowing."
                - stop
            - if <player.has_flag[silverfish_quest_1]>:
                - narrate "I thankful to <player.name>."
                - wait 2
                - narrate "Last seen, talk to I brother Klaatu. There. Go talk to get more knowing."
                - stop
            - else:
                - narrate "Condolences <Player.name>, shop not open. I brother Missing."
                - wait 1s
                - narrate "You-help?"
                - run silverfish_quest_begin
        - if <player.location.world.moon_phase> == 1 && <player.location.world.time> >= 13500:
            - narrate "Easter egg"
            - stop
        - else:
            - if <player.has_flag[silverfish_familiar]>:
                - stop
            - else:
                - narrate "<&7>Visit more often to unlock Quest"


silverfish_quest_begin:
    type: task
    script:
        - narrate "Do you want to accept the Quest <&5><bold>Find Missing Brother<reset>?"
        - clickable silverfish_accept save:yes
        - clickable silverfish_refuse save:no
        - narrate "<&7><element[<&lb><green>Yes<&7><&rb>].on_click[<entry[yes].command>]> <&7>or <element[<&lb><red>No<&7><&rb>].on_click[<entry[no].command>]>"

silverfish_accept:
    type: task
    script:
        - flag player silverfish_quest_1:1
        - narrate "I thankful to <player.name>."
        - wait 1
        - narrate "Last seen, talk to I brother Klaatu. There. Go talk to get more knowing."

silverfish_refuse:
    type: task
    script:
        - flag player silverfish_quest_1:!
        - flag player silverfish_quest_refused:1 expires:10s
        - narrate "Then, leave I alone."
        - narrate "<&7>[Quest refused]"

# Klaatu Sections
klaatu_interact:
    type: task
    script:
        - if <player.has_flag[silverfish_quest_1]>:
            - narrate "I brother sent you? Why?"
            - clickable klaatu_quest_1 save:fun
            - clickable klaatu_quest_2 save:serious
            - narrate "<&7><element[<&lb><red>To Make Fun of you.<&7><&rb>].on_click[<entry[fun].command>]>"
            - narrate "<&7><element[<&lb><green>To Help find your brother.<&7><&rb>].on_click[<entry[serious].command>]>"
            - stop
        - if <player.has_flag[silverfish_quest_2]>:
            - narrate "<&7>Head West to the Sea, find a stony cliff."
            - stop
        - if <player.has_flag[nikto:1]>:
            - narrate "I's knowing <player.name> made Varada not return..."
            - stop
        - if <player.has_flag[silverfish_quest_3]>:
            - narrate "Knowings is wrong. Varada return later. <player.name> wait, I's knowing."
            - wait 1s
            - narrate "Go tell Nikto, <player.name>."
            - wait 1s
            - narrate "Go away from me."
            - flag player klaatu:1
        - else:
            - narrate "Biped, return later - Shops closed."

klaatu_quest_1:
    type: task
    script:
        - random:
            - narrate "Cruel bipeds be always cruel."
            - narrate "That is funny."
            - narrate "I think that about Nikto too!"
            - narrate "Nikto never serious."
            - narrate "Even so, I shop's better than Nikto's."
        - flag player ridicule_klaatu:++

klaatu_quest_2:
    type: task
    script:
        - narrate "I thank <player.name>. I thank Nikto."
        - wait 1s
        - narrate "Varada, We's brother, thought smart to go look for new things outside caves."
        - wait 1s
        - narrate "I no convince him no to go."
        - wait 1s
        - narrate "Varada is stubborn, he go even with knowledge of I's disapproval."
        - wait 2s
        - narrate "Varada said he knowledge of a biped, but not like <player.name> type. More different."
        - narrate "<&7>Klaatu points to the West."
        - wait 1s
        - narrate "Varada go that way. Out of cave. Where air is salty, where wall of stone meets water, and there is weird place. Place where bipeds put dead into ground."
        - wait 1s
        - narrate "Weird rituals. Go now, find We's brother. If <player.name> do this, We's open shops."
        - narrate "<&7>Head West to the Sea, find a stony cliff."
        - flag player silverfish_quest_1:!
        - flag player silverfish_quest_2:1

#Barada Sections - Yes it's name is Barada.  Zhag wanted Klaatu to provide the wrong name.
barada_interact:
    type: task
    script:
        - if <player.has_flag[barada]>:
            - narrate "I's remain here, I's brothers survive with no I."
            - wait 2s
            - narrate "I knowledge here is greater than stone. I knowledge here, mind is free. I is just I."
            - wait 2s
            - narrate "I... is just I."
            - flag player silverfish_quest_1:!
            - flag player silverfish_quest_2:!
            - flag player silverfish_quest_3:1
            - stop
        - if <player.has_flag[silverfish_quest_2]>:
            - narrate  "I's brothers sent <player.name> to I? I's brothers concern is great, but I remain here."
            - narrate "<&7>Try to talk to them again in a moment."
            - flag player barada:1
        - else:
            - random:
                - narrate "I far from home."
                - narrate "I's brothers concern of I."
                - narrate "Place here is lovely."
                - narrate "The biped has been kind to I."
                - narrate "I is just I here."
                - narrate "Many peace of I's mind. I's mind is just I's now."


#Reward Section
silverfish_reward:
    type: item
    material: mace
    display name: <&b><bold>True Scale of Szisquh
    lore:
    - <&6>This items holds great cultural significance. Formed in an ancient metal cave by Queen Szisquh many moons ago.<&7>
    enchantments:
    - density:5
    - unbreaking:4
    - wind_burst:3
    - mending:1

silverfish_lesser_reward:
    type: item
    material: mace
    durability: 25
    display name: <&b><bold>Old Scale of Szisquh
    lore:
    - <&6>Formed in an ancient metal cave by Queen Szisquh many moons ago. It looks a little rough.<&7>
    enchantments:
    - breach:2
    - unbreaking:2

silverfish_lesser_reward_1:
    type: item
    material: mace
    durability: 175
    display name: <&b><bold>Rough Scale of Szisquh
    lore:
    - <&6>Left to rot, this object was once a significant cultural object. Formed by the Silverfish Queen many moons ago.<&7>
    enchantments:
    - unbreaking:3

silverfish_lesser_reward_2:
    type: item
    material: mace
    durability: 350
    display name: <&b><bold>Broken Scale of Szisquh
    lore:
    - <&6>Piece of scale attached to a rod. It's in usable shape. Might have been special once upon a time.<&7>
    enchantments:
    - unbreaking:4

silverfish_lesser_reward_3:
    type: item
    material: mace
    durability: 499
    no_id: true
    display name: <&b><bold>Crumbling Scale of Szisquh
    lore:
    - <&6>Gross looking scale attached poorly to a rod. It might have been special once upon a time.<&7>
    enchantments:
    - fire_aspect:2
    - unbreaking:5
    - vanishing_curse:1


