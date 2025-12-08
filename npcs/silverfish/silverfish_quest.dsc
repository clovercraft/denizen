#Nikto Sections
nikto_interact:
    type: task
    script:
        - if <player.has_flag[silverfish_quest_complete]>:
            - run nikto_shop
            - stop
        - if <player.has_flag[silverfish_quest_refused]>:
            - narrate "<&7>You may not attempt this quest for another <player.flag_expiration[silverfish_quest_refused].from_now.formatted>"
            - stop
        - if <player.has_flag[silverfish_familiar]>:
            - if <player.has_flag[silverfish_quest_complete]>:
                - narrate "<&7>Quest Already Complete"
                - stop
            - if <player.has_flag[klaatu]>:
                - narrate "<bold>Nikto:<reset> I's brother... no more. Knowledge accepted."
                - wait 1s
                - narrate "<bold>Nikto:<reset> I's thank <player.name>. I's found this, you take."
                - wait 1s
                - if <player.flag[ridicule_klaatu]> >= 9:
                    - give silverfish_lesser_reward_3
                    - narrate "<bold>Nikto:<reset> Oh, before <player.name> go, We's open shop's for <player.name>"
                    - toast "<&7>Quest Complete: <&5><bold>Find Missing Brother" icon:silverfish_reward
                    - flag player silverfish_quest_complete:1
                    - stop
                - if <player.flag[ridicule_klaatu]> >= 5:
                    - give silverfish_lesser_reward_2
                    - narrate "<bold>Nikto:<reset> Oh, before <player.name> go, We's open shop's for <player.name>"
                    - toast "<&7>Quest Complete: <&5><bold>Find Missing Brother" icon:silverfish_reward
                    - flag player silverfish_quest_complete:1
                    - stop
                - if <player.flag[ridicule_klaatu]> >= 1:
                    - give silverfish_lesser_reward_1
                    - narrate "<bold>Nikto:<reset> Oh, before <player.name> go, We's open shop's for <player.name>"
                    - toast "<&7>Quest Complete: <&5><bold>Find Missing Brother" icon:silverfish_reward
                    - flag player silverfish_quest_complete:1
                    - stop
                - else:
                    - give silverfish_lesser_reward
                    - narrate "<bold>Nikto:<reset> Oh, before <player.name> go, We's open shop's for <player.name>"
                    - toast "<&7>Quest Complete: <&5><bold>Find Missing Brother" icon:silverfish_reward
                    - flag player silverfish_quest_complete:1
                    - stop
            - if <player.has_flag[silverfish_quest_3]>:
                - narrate "<bold>Nikto:<reset> I's joyous that Barada's safe. I's thank <player.name> for spreading knowings of this."
                - wait 1s
                - narrate "<bold>Nikto:<reset> I's always knowing Barada desired to leave the many minds. Joyous he was able to do so."
                - wait 1s
                - narrate "<bold>Nikto:<reset> I would knowings <player.name> of all Silverfish history, but Kschka would know better."
                - wait 1s
                - narrate "<bold>Nikto:<reset> I's thank <player.name> again. To show thanks, I's want <player.name> to take this..."
                - wait 1s
                - give silverfish_reward
                - wait 1s
                - narrate "<bold>Nikto:<reset> Entrusted to us by Queen this was. <player.name> should have."
                - wait 1s
                - narrate "<bold>Nikto:<reset> Oh, before <player.name> go, We's open shop's for <player.name>"
                - toast "<&7>Quest Complete: <&5><bold>Find Missing Brother" icon:silverfish_reward
                - flag player silverfish_quest_complete:1
                - stop
            - if <player.has_flag[silverfish_quest_2]> or <player.has_flag[silverfish_quest_1]>:
                - narrate "<bold>Nikto:<reset> I thankful to <player.name>."
                - wait 2
                - narrate "<bold>Nikto:<reset> Last seen, talk to I brother Klaatu. There. Go talk to get more knowing."
                - stop
            - else:
                - narrate "<bold>Nikto:<reset> Condolences <Player.name>, shop not open. I brother Missing."
                - wait 1s
                - narrate "<bold>Nikto:<reset> You-help?"
                - run silverfish_quest_begin
        - else:
            - if <player.has_flag[silverfish_familiar]>:
                - stop
            - else:
                - narrate "<&7>Visit more often to unlock Quest"


silverfish_quest_begin:
    type: task
    script:
        - narrate "<&7>Do you want to accept the Quest <&5><bold>Find Missing Brother<&7>?"
        - clickable silverfish_accept save:yes until:2m
        - clickable silverfish_refuse save:no until:2m
        - narrate "<&7><element[<&lb><green>Yes<&7><&rb>].on_click[<entry[yes].command>]> <&7>or <element[<&lb><red>No<&7><&rb>].on_click[<entry[no].command>]>"

silverfish_accept:
    type: task
    script:
        - flag player silverfish_quest_1:1
        - narrate "<bold>Nikto:<reset> I thankful to <player.name>."
        - wait 1
        - narrate "<bold>Nikto:<reset> Last seen, talk to I brother Klaatu. There. Go talk to get more knowing."

silverfish_refuse:
    type: task
    script:
        - flag player silverfish_quest_1:!
        - flag player silverfish_quest_refused:1 expires:10s
        - narrate "<bold>Nikto:<reset> Then, leave I alone."
        - narrate "<&7>[Quest refused]"

# Klaatu Sections
klaatu_interact:
    type: task
    script:
        - if <player.has_flag[silverfish_quest_complete]>:
            - run klaatu_shop
            - stop
        - if <player.has_flag[silverfish_quest_1]>:
            - narrate "<bold>Klaatu:<reset> I brother sent you? Why?"
            - clickable klaatu_quest_1 save:fun until:2m
            - clickable klaatu_quest_2 save:serious until:2m
            - narrate "<&7><element[<&lb><red>To Make Fun of you.<&7><&rb>].on_click[<entry[fun].command>]>"
            - narrate "<&7><element[<&lb><green>To Help find your brother.<&7><&rb>].on_click[<entry[serious].command>]>"
            - stop
        - if <player.has_flag[silverfish_quest_2]>:
            - narrate "<&7>Head West to the Sea, find a stony cliff."
            - stop
        - if <player.has_flag[silverfish_quest_3]>:
            - narrate "<bold>Klaatu:<reset> <player.name> knowings is wrong. Barada will return later. Just wait, <player.name>, I's knowing is true."
            - wait 1s
            - narrate "<bold>Klaatu:<reset> Go tell Nikto, <player.name>."
            - wait 1s
            - narrate "<bold>Klaatu:<reset> Go away from me, now."
            - flag player klaatu:1
        - else:
            - narrate "<bold>Klaatu:<reset> Biped, return later - Shops closed."

klaatu_quest_1:
    type: task
    script:
        - random:
            - narrate "<bold>Klaatu:<reset> Cruel bipeds be always cruel."
            - narrate "<bold>Klaatu:<reset> That is funny."
            - narrate "<bold>Klaatu:<reset> I think that about Nikto too!"
            - narrate "<bold>Klaatu:<reset> Nikto never serious."
            - narrate "<bold>Klaatu:<reset> Even so, I shop's better than Nikto's."
        - flag player ridicule_klaatu:++

klaatu_quest_2:
    type: task
    script:
        - narrate "<bold>Klaatu:<reset> I thank <player.name>. I thank Nikto."
        - wait 1s
        - narrate "<bold>Klaatu:<reset> Barada, We's brother, thought smart to go look for new things outside caves."
        - wait 1s
        - narrate "<bold>Klaatu:<reset> I no convince him no to go."
        - wait 1s
        - narrate "<bold>Klaatu:<reset> Barada is stubborn, he go even with knowledge of I's disapproval."
        - wait 2s
        - narrate "<bold>Klaatu:<reset> Barada said he knowledge of a biped, but not like <player.name> type. More different."
        - narrate "<&7>Klaatu points to the West."
        - wait 1s
        - narrate "<bold>Klaatu:<reset> arada go that way. Out of cave. Where air is salty, where wall of stone meets water, and there is weird place. Place where bipeds put dead into ground."
        - wait 1s
        - narrate "<bold>Klaatu:<reset> Weird rituals. Go now, find We's brother. If <player.name> do this, We's open shops."
        - narrate "<&7>Head West to the Sea, find a stony cliff."
        - flag player silverfish_quest_1:!
        - flag player silverfish_quest_2:1

#Barada Sections - Yes it's name is Barada.  Zhag wanted Klaatu to provide the wrong name.
barada_interact:
    type: task
    script:
        - if <player.has_flag[silverfish_quest_complete]>:
            - narrate "<bold>Barada:<reset> I's remain here, I's brothers survive without I."
            - wait 2s
            - narrate "<bold>Barada:<reset> I knowledge here is greater than stone. I knowledge here, mind is free. I is just I."
            - wait 2s
            - narrate "<bold>Barada:<reset> I... is just I."
            - stop
        - if <player.has_flag[barada]>:
            - narrate "<bold>Barada:<reset> I's remain here, I's brothers survive without I."
            - wait 2s
            - narrate "<bold>Barada:<reset> I knowledge here is greater than stone. I knowledge here, mind is free. I is just I."
            - wait 2s
            - narrate "<bold>Barada:<reset> I... is just I now, none others."
            - wait 2s
            - flag player silverfish_quest_1:!
            - flag player silverfish_quest_2:!
            - flag player silverfish_quest_3:1
            - stop
        - if <player.has_flag[silverfish_quest_2]>:
            - narrate "<bold>Barada:<reset> I's brothers, Klaatu and Nikto, sent <player.name> to I? I's brothers concern is great, but I remain here."
            - narrate "<&7>Try to talk to them again in a moment."
            - flag player barada:1
        - else:
            - random:
                - narrate "<bold>Barada:<reset> I far from home."
                - narrate "<bold>Barada:<reset> I's brothers concern of I."
                - narrate "<bold>Barada:<reset> Place here is lovely."
                - narrate "<bold>Barada:<reset> The biped has been kind to I."
                - narrate "<bold>Barada:<reset> I is just I, here."
                - narrate "<bold>Barada:<reset> I's without others minds, peace finally."


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



#Debug
silverfish_quest_debug:
    type: command
    description: Silverfish Quest Debug.
    permission: cc.silverfishquestdebug
    name: silverfishquestdebug
    usage: /silverfishquestdebug
    script:
        - flag player silverfish_familiar:!
        - flag player silverfish_quest_1:!
        - flag player silverfish_quest_2:!
        - flag player silverfish_quest_3:!
        - flag player silverfish_quest_complete:!
        - flag player silverfish_quest_refused:!
        - flag player silverfish_visit_cooldown:!
        - flag player silverfish_visits:!
        - flag player ridicule_klaatu:!
        - flag player klaatu:!
        - flag player barada:!
        - narrate "<&7>Silverfish Quest Flags Cleared"
