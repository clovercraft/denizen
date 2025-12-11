kschka_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run kschka_interact


kschka_interact:
    type: task
    script:
        - if <player.has_flag[silverfish_general_history]> && <player.has_flag[silverfish_world_history]>:
            - narrate "<bold>Kshka: <reset>Welcome back <player.name>."
            - wait 1s
            - narrate "<bold>Kshka: <reset>Did you want to hear about our Histories again?"
            - wait 1s
            - clickable kschka_general_history save:generalhistory until:2m
            - clickable kschka_world_history save:worldhistory until:2m
            - clickable save:endconvo:
                - narrate "<bold>Kshka: <reset>Goodbye."
                - stop
            - narrate "<&7><element[<&lb><&2>General History<&7><&rb>].on_click[<entry[generalhistory].command>]> <&7>| <element[<&lb><&5>World History<&7><&rb>].on_click[<entry[worldhistory].command>]> | <element[<&lb><&4>No Thank you.<&7><&rb>].on_click[<entry[endconvo].command>]>"
            - stop
        - narrate "<bold>Kshka: <reset>Oh my, someone new - Hello!"
        - wait 2s
        - narrate "<bold>Kshka:<reset> I hope you were given permission by the Queen to enter this chamber... No? I am sure it will be fine."
        - wait 1s
        - narrate "<bold><player.name>:<reset> You seem to be more articulate than the other silverfish I've spoken to..."
        - wait 1s
        - narrate "<bold>Kshka:<reset> Yes - I've been studying the languages & cultures of this world. It seems that there are many great things to learn. It is humbling."
        - wait 1s
        - narrate "<bold>Kshka:<reset> My name is Kschka, and I am the keeper of information within this hive colony. Who are you?"
        - wait 1s
        - narrate "<bold><player.name>:<reset> My name is <Player.name>. I am the keeper of mines... and craftings."
        - wait 1s
        - narrate "<bold>Kshka:<reset> Facinating, and what brings you to my domain?"
        - wait 1s
        - clickable kschka_explore save:explore until:2m
        - clickable kschka_history save:history until:2m
        - narrate "<&7><element[<&lb><&6>Just exploring around.<&7><&rb>].on_click[<entry[explore].command>]> <&7>| <element[<&lb><&3>I wanted to know more of your history<&7><&rb>].on_click[<entry[history].command>]>"


kschka_explore:
    type: task
    script:
        - narrate "<bold>Kshka:<reset> I see, well... This is the library. Only myself and the Queen are usually allowed in here. You see, we have to keep it away from the others."
        - wait 1s
        - narrate "<bold>Kshka:<reset> Only because some might consider it... taboo."
        - wait 1s
        - narrate "<bold>Kshka:<reset><italic> Too close to dancing with human relics."
        - wait 1s
        - narrate "<bold>Kshka:<reset> So please, <player.name>, don't mention this place to the others."
        - wait 1s
        - narrate "<bold><player.name>:<reset> I will not speak of this place to any of the Silverfish, promise."
        - wait 1s
        - narrate "<&7>Kschka will bow their head in silent thanks."
        - stop


kschka_history:
    type: task
    script:
        - narrate "<bold>Kshka:<reset> I see. Well, I can allow only two of the books for viewing.... but you might not be able to read them."
        - wait 1s
        - narrate "<bold><player.name>:<reset> Why is that?"
        - wait 1s
        - narrate "<bold>Kshka:<reset> It is written in the cultural language. So, unless you know that, it might be difficult."
        - wait 1s
        - narrate "<bold>Kshka:<reset> I can, however, give you a… summary if you would like?"
        - wait 2s
        - narrate "<bold><player.name>:<reset>  I would love that."
        - wait 1s
        - narrate "<bold><player.name>:<reset> What would you like to know:"
        - wait 1s
        - clickable kschka_general_history save:generalhistory until:2m
        - clickable kschka_world_history save:worldhistory until:2m
        - narrate "<&7><element[<&lb><&2>General History.<&7><&rb>].on_click[<entry[generalhistory].command>]> <&7>| <element[<&lb><&5>I wanted to know more of your history<&7><&rb>].on_click[<entry[worldhistory].command>]>"



kschka_general_history:
    type: task
    script:
        - narrate "<bold>Kshka:<reset> Let’s see… I think I will start with our Queen…"
        - wait 2s
        - narrate "<bold>Kshka:<reset> Many moons ago, and a winter besides. Before shadows learned to walk, before the stones knew the weight of sorrow, the earth was whole and waiting. From its depths rose Szisquh, our Queen, born of silence and strength. Her scales shimmered like rivers beneath moonlight. rent the earth as we do still. One day, the ground trembled—not with the fury of quakes, but with a sharper cry, a sound that split the silence of stone."
        - clickable save:continue1 until:2m:
            - narrate "<bold>Kshka:<reset> She descended into the underworld to investigate, and there she beheld strangers: bipeds, clanking and hammering with tools of alien craft. In those days, the world was raw and restless. Yet Szisquh saw not chaos, but possibility. Where others clawed for survival, she dreamed of harmony. She carved paths through the deep earth, not for conquest, but for kinship. And when the first fires of craft burned in the hands of strangers, she did not curse them—she listened. For in the clang of iron and the glow of molten ore, she heard the whisper of a future where strength and wisdom walk together."
            - clickable save:continue2 until:2m:
                - narrate "<bold>Kshka:<reset> Yet the tale does not end in peace. When Szisquh drew near, the bipeds struck without word or mercy. It is fate that she didn’t perish that very day to those vile things, deaf to the voice of earth. Forsaking her before getting to know her."
                - clickable save:continue3 until:2m:
                    - narrate "<bold>Kshka:<reset> One day, she shadowed a band of them hauling metal. They led her to a cavern wrought of iron, where fire roared and molten rivers glowed white and red. There, the bipeds bent ore to their will, forging blades to bite deeper into the stone. Their fires burned not only ore, but threads of unseen power. Some say the first scars upon the leylines were struck in those forges. Szisquh watched, bewitched by their craft—yet while her gaze lingered, our kin perished."
                    - clickable save:continue4 until:2m:
                        - narrate "<bold>Kshka:<reset> In time, the bipeds vanished, leaving only echoes. When Szisquh rose to the surface, she found a world transformed: new species, a great migration, and the birth of community. Among the voices that rose in council was one of grace and daring—a Kitsune princess whose name would one day be carved in stone: Kuro. For the first time in many ages, survival was not a struggle. Joining this community, Szisquh spoke then of progress. She urged us to cast off old taboos, to claim the secrets of metal and fire. Suggesting that metalworking and mining be embraced. To her it was a step forward."
                        - clickable save:continue5 until:2m:
                            - narrate "<bold>Kshka:<reset> Then, silence. She was gone for what felt like many moons, and darkness fell upon us. Silverfish dwindled, and whispers of murder stirred. We suspected the Meagles, though the Kobolds boasted of the deed—yet no Kobold had ever walked these mountains."
                            - clickable save:continue6 until:2m:
                                - narrate "<bold>Kshka:<reset> When Szisquh returned, she bore a relic of power, entrusted to the Three Brothers: Klaatu, Varada, and Nikto. But the slaughter of our kin did not cease. Truth came like a blade—the Meagles feasted upon us, claiming the law of nature. Even when the gods themselves carved a tablet forbidding such blasphemy, they defied it."
                                - wait 2s
                                - narrate "<bold>Kshka:<reset> You will note a stone tablet in the corner. It is written in the same text and lettering as the books. Language of the Silverfish. How curious, how convenient."
                                - clickable save:continue7 until:2m:
                                    - narrate "<bold>Kshka:<reset> But vengeance came, in part. A Meagle fell, and we consumed its flesh—a bitter rite, yet a sign. From that day, we vowed to strengthen the community, even amid scorn. We turned to the soil, raising mushrooms in shadow. Hardship tempered us, and with metal tools, our harvest grew."
                                    - flag player silverfish_general_history:1
                                    - clickable save:endconvo until:2m:
                                        - narrate "<bold><player.name>:<reset> Such a fascinating history. I've learned some things I didn't know before. Thank you. I hope you have a good day. Goodbye"
                                        - wait 1s
                                        - if <player.has_flag[silverfish_general_history]> && <player.has_flag[silverfish_world_history]>:
                                            - run silverfish_history_reward
                                            - stop
                                        - stop
                                    - clickable kschka_world_history save:worldhistory until:2m
                                    - narrate "<&7><element[<&lb><&4>End Conversation.<&7><&rb>].on_click[<entry[endconvo].command>]> <&7>| <element[<&lb><&5>Tell me about the History of the World<&7><&rb>].on_click[<entry[worldhistory].command>]>"
                                - narrate "<&lb><&2><element[Continue].on_click[<entry[continue7].command>]><reset><&rb>"
                            - narrate "<&lb><&2><element[Continue].on_click[<entry[continue6].command>]><reset><&rb>"
                        - narrate "<&lb><&2><element[Continue].on_click[<entry[continue5].command>]><reset><&rb>"
                    - narrate "<&lb><&2><element[Continue].on_click[<entry[continue4].command>]><reset><&rb>"
                - narrate "<&lb><&2><element[Continue].on_click[<entry[continue3].command>]><reset><&rb>"
            - narrate "<&lb><&2><element[Continue].on_click[<entry[continue2].command>]><reset><&rb>"
        - narrate "<&lb><&2><element[Continue].on_click[<entry[continue1].command>]><reset><&rb>"



kschka_world_history:
    type: task
    script:
        - narrate "<bold>Kshka:<reset> Ah, yes… The history of the world… Where to begin…"
        - wait 1s
        - narrate "<bold>Kshka:<reset> Countless winters past, before silverfish or any kin walked this soil, there were others—strange bipeds in great numbers. Not quite like you, <Player.name>, yet akin to those who dwell in shadowed towers and dark forest mansions. We know little of that age. But this much is certain: they infested the land and laid waste to its beauty. Their constant expansion, though a sight to behold, was also their downfall. These... bipeds destroyed themselves like they were destroying the natural world."
        - clickable save:continue1 until:2m:
            - narrate "<bold>Kshka:<reset> Once the wilds returned, a great migration occurred. Many species, like we silverfish, came to this part of the world. This was many moons and a winter ago. As nature reclaimed its dominion, it brought with it the Kitsune and the Fytari. Two species who share many things, who chose to become a single unified community. Among the Kitsune was Kuro, a princess whose grace embodied the hope of this new union. Her vision was simple: a world where all could coexist. This, alone, was a good omen for the future of this world, but along with this joining came a meteor shower. The gods, fate, nature... whatever you believe, also believed in this communal union, and reclamation."
            - clickable save:continue2 until:2m:
                - narrate "<bold>Kshka:<reset> As quickly as good things can occur, so must the bad. The peace that blanketed this world could not last forever. Leylines of magic, natural things within this world somehow became corrupted. Perhaps it was by the hand of the humans, or some other force... Either way, this corrupted Leyline caused terrible things to awaken within the protection of the night. To this day, that effect lingers, as you have surely sensed."
                - clickable save:continue3 until:2m:
                    - narrate "<bold>Kshka:<reset> This is about the time where the many species chose to gather and form a community. We saw how the bipeds used the land to create food. Their craft bewitched us, stirred our wonder. We chose to forgo total demonization of all things those bipeds were about, and took their farming technology for ourselves. This new way to sustain us was like nothing we'd experienced before. No longer did we need to hunt and kill each other like before. We could grow our own food. Sustain ourselves."
                    - clickable save:continue4 until:2m:
                        - narrate "<bold>Kshka:<reset> A time of peace and growth, and it was bountiful. We, the Silverfish, the Meagles, Fytari, Kistune, the Troll, The Sires, the Great Dogs, and many more. It was almost natural how the community formed around this single technology. It was when we decided that power, within the community, was gained by actions - followers - and agreements. Although things were a little chaotic, there were some clear hierarchies. Some still hold to this day."
                        - clickable save:continue5 until:2m:
                            - narrate "<bold>Kshka:<reset> The community chose to build a great meeting area, to honor the community and give access for everyone to have a voice. It was Kuro who spoke most passionately for unity, urging us to learn from the bipeds rather than fear them. Unfortunately, not all thought this was a good idea. One of the groups, the Kobolds who have chosen to remain outside the community, decided to sabotage this meeting area. It was a terrible thing, but they were thwarted by the Great Dogs in a vicious display of their power. It's around this time that the community closed their doors to the Kobolds. They are, and will always be, enemies of the community. Especially because the Kobolds adore the bipeds with great passion, if not only for their shiny trinkets and rocks."
                            - clickable save:continue6 until:2m:
                                - narrate "<bold>Kshka:<reset> Throughout the hardships, more species seem to show themselves or travel to this area. The community has a strong foothold in the world at this point in time. Hillfolk, goblins, and spiders migrate into the community to which they are generally welcomed. It's these migrations that bring word that bipeds aren't completely extinct. Kuro believed the bipeds could change. Against counsel, she welcomed them with open arms, offering sanctuary beneath the Kitsune banners. It was a gamble born of hope. The bipeds chose to stain that offering with blood. Killing the Kitsune Princess, Kuro."
                                - clickable save:continue7 until:2m:
                                    - narrate "<bold>Kshka:<reset> That incident is what sparked the time of War. The community agreed that the bipeds were no longer to be given the benefit of the doubt, enemies. The Meagles and the Great Dogs confront the hostile Kobolds, victory is assured. The Kobolds are run out of the general area of the community, never to return. The Meagles lead the fight on the bipeds, after they destroy some of their nesting grounds."
                                    - clickable save:continue8 until:2m:
                                        - narrate "<bold>Kshka:<reset> It was at this time that the community chose to close its borders... And only until recently has that been shown some leniency. We all gathered to hold a funeral for Kuro. Cherry blossom petals drifted on the wind as chants rose to the heavens. It's Kuro's tale that gives the community great caution against new people. And just last winter, a shrine to Kuro was built. The truth is, we all wanted to see the bipeds in a different light... Kuro was the only one willing to try. Her death left the community with a hole"
                                        - clickable save:continue9 until:2m:
                                            - narrate "<bold>Kshka:<reset> It's been a while since that day. The community is still reeling, we can feel it. Trust in strangers doesn't come too easily. So you must be someone special. Still... "
                                            - wait 2s
                                            - narrate "<bold>Kshka:<reset> Thank you for listening to me ramble about the history of the world."
                                            - flag player silverfish_world_history:1
                                            - clickable save:endconvo until:2m:
                                                - if <player.has_flag[silverfish_general_history]> && <player.has_flag[silverfish_world_history]>:
                                                    - run silverfish_history_reward
                                                    - stop
                                                - stop
                                            - clickable kschka_general_history save:generalhistory until:2m
                                            - narrate "<&7><element[<&lb><&4>End Conversation.<&7><&rb>].on_click[<entry[endconvo].command>]> <&7>| <element[<&lb><&5>Tell me about your general history.<&7><&rb>].on_click[<entry[generalhistory].command>]>"
                                        - narrate "<&lb><&2><element[Continue].on_click[<entry[continue9].command>]><reset><&rb>"
                                    - narrate "<&lb><&2><element[Continue].on_click[<entry[continue8].command>]><reset><&rb>"
                                - narrate "<&lb><&2><element[Continue].on_click[<entry[continue7].command>]><reset><&rb>"
                            - narrate "<&lb><&2><element[Continue].on_click[<entry[continue6].command>]><reset><&rb>"
                        - narrate "<&lb><&2><element[Continue].on_click[<entry[continue5].command>]><reset><&rb>"
                    - narrate "<&lb><&2><element[Continue].on_click[<entry[continue4].command>]><reset><&rb>"
                - narrate "<&lb><&2><element[Continue].on_click[<entry[continue3].command>]><reset><&rb>"
            - narrate "<&lb><&2><element[Continue].on_click[<entry[continue2].command>]><reset><&rb>"
        - narrate "<&lb><&2><element[Continue].on_click[<entry[continue1].command>]><reset><&rb>"


silverfish_history_reward:
    type: task
    script:
        - narrate "<bold>Kshka:<reset> Before you go…"
        - wait 1s
        - narrate "<bold>Kshka:<reset> I want to thank you for your interest in the history of our people."
#       Holding Spot for Reward
        - wait 1s
        - narrate "<bold>Kshka:<reset> Please, stop by anytime <Player.name>."
        - stop


kshcka_debug:
    type: command
    description: Kshcka Debug.
    permission: cc.kshckadebug
    name: kshckadebug
    usage: /kshckadebug
    script:
        - flag player silverfish_general_history:!
        - flag player silverfish_world_history:!
        - narrate "<&7>Kschka Flags Cleared"
