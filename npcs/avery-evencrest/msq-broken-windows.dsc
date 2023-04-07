cc_msq3_world:
    type: world
    events:
        on player joins:
            - run cc_msq3_announce
        on player left clicks block flagged:msq3_searching:
            - define location <proc[cc_msq3_atlocation].context[<player>]>
            - define target <context.location.material.name.if_null[air]>
            - run cc_msq3_blockcheck def:<player>|<[location]>|<[target]>

cc_msq3_announce:
    type: task
    script:
        - wait 30s
        - if <player.has_flag[msq2_state]> && !<player.has_flag[msq3_state]>:
            - flag <player> msq3_state:start
            - narrate "<dark_green><bold>MSQ3: Shattered Windows<reset>"
            - narrate "<dark_green>  You have a new letter from Avery Evencrest."
            - narrate "<dark_green>  Hey <player.display_name><dark_green>! When you have a moment, why don't you swing by my observatory. I've got some new findings you could help me out with. Cheers! Avery Evencrest"
        - if <player.has_flag[msq3_state]> && <player.flag[msq3_state]> == waiting:
            - narrate "<dark_green><bold>MSQ3: Shattered Windows<reset>"
            - narrate "<dark_green>  You have a new letter from Avery Evencrest."
            - narrate "<dark_green>  I've put together my data with your findings out in the field, and if you're ready for it, I think I know what to do next. Meet at my observatory when you're ready, but make sure you come ready for a fight."

cc_msq3_farewell:
    type: task
    script:
        - narrate "Hey there, I see you came ready, that's good. The next step in my research is going to be a bit dangerous, so I won't fault you if you back out. I need someone to try going through this strange purple fluid that these structures generate."
        - wait 2s
        - narrate "From what I can tell, there shouldn't be any danger inherit in the structures themselves, but I'm not sure where they lead. I've taken to calling them portals, since the items I've thrown in so far have clearly gone somewhere else."
        - wait 2s
        - narrate "If you're feeling brave enough, you can construct one of these portals on your own and head through to the other side. It seems like they need to be at least two blocks wide and three blocks tall, so make sure you don't build too small. Here, I've gathered the materials you'll need."
        - give obsidian quantity:10
        - give flint_and_steel quantity:1
        - narrate "Do let me know when you make it back safely though, yes? I'm very curious what you find!"
        - flag <player> nether_enabled:true
        - flag <player> msq3_state:portal

cc_msq3_handin:
    type: task
    script:
        - narrate "Oh! So you made it back! That's excellent news, I was worried about you. I can't wait to dig in to all the exciting new things you find beyond these strange swirling portals!"
        - flag <player> msq3_state:completed
        
cc_msq3_start:
    type: task
    script:
        - narrate "Hey there! I've noticed these strange obsidian structures dotting the landscape since I arrived here in town, and I'm hoping to figure out their origin. Folks around here seem pretty hesitant to talk about the subject, but maybe you can help me!"
        - wait 2s
        - narrate "If you're up for it, maybe you could go take some notes for me on the materials those structures are made up of? I'm close to figuring this out, and I'll make sure it's worth your time."
        - clickable usages:1 save:click_yes:
            - flag <player> msq3_state:accepted
            - flag <player> msq3_searching:0
            - narrate "Great! I've got a field journal here you can use to record your findings. The first structure I'd like you to look into is at <yellow>-1865, 1000<reset>. There should be good samples of the <yellow>strange bloody stone<reset> there. I'll find some more places for you to investigate while you travel."
            - give <player> cc_msq3_field_journal
	    - wait 3s
	    - narrate "<dark_green>Travel to locations provided by Avery, then left-click on the block they ask about to log it in your journal."
        - clickable usages:1 save:click_no:
            - narrate "No worries, I'm sure you have lots to do. If you change your mind, make sure to come back and visit!"
        - narrate "<green><element[Accept Quest].on_click[<entry[click_yes].command>]><reset> | <red><element[Decline].on_click[<entry[click_no].command>]>"

cc_msq3_field_journal:
    type: book
    title: Field Journal
    author: Avery Evencrest
    signed: true
    text:
        - <bold>Entry #1<reset><n><n>I've discovered several of these strange structures scattered seemingly at random throughout my travels.<n><n>The reason for their existence escapes my knowledge, but they're shaped from a dark, nigh-indestructible
        - stone that only the strongest of tools could seem to break.<n><n>I've yet to encounter such a rock anywhere, so I'll have to do some sleuthing around the local taverns to see if anyone is familiar with this durable substance.
        - Whatever these structures are, they were built with intention and not formed naturally, as constructed stone bricks and forged gold adorn the area. Who built all of this...and why?<n><n>The most puzzling factor to these structures is the
        - presence of lava that appears to have no point of origin, and I can't make heads or tails of how it got there...<n><n>And this other stone - well I'm leery of calling it a stone at all, for the appearance and texture are almost flesh-like...
        - I've never seen anything quite like it, and while I acknowledge an intense curiousity as to its makeup and origins, I must confess a growing dread stirs within me if I stare at it too long.<n><n>I'm hoping to attempt a reconstruction of
        - the original shape of the structure, if I can figure out how to collect more of these impervious boulders.
        - <bold>Entry #2<reset><n><n>I've discovered that the purple, sturdy stone is quite well-known by Agnes, who calls it obsidian. She said that I can find more of it deeper in the caves where water and lava converge, and if I'm feeling favored by the gods, I could try
        - to collect some lava myself and form the stone with water and an appropriate framework.<n><n>Collecting a fluid so intensely hot feels like a fool's errand, so I think I'll leave it to the local adventurous souls to do some spelunking and collect what I'll
        - need for my...project.<n><n>As for the dreaded fleshy earth, I've spent some time asking around. It seems folks aren't too interested in talking, but I've gathered from whispers that the locals call it "bloodstone," an apt name for a rock of this make if I ever
        - heard one. I don't know it's purpose yet, or what it could mean.
        - <bold>Entry #3<reset><n><n>I have now reconstructed the vague rectangular shape that the structure had. Something told me it needed flame, so I attempted to light the obsidian ablaze. Instead, a purple...material, appeared.
        - The material is transparent, like tinted glass, but moves and swirls like water.<n><n>I was drawn to touch it, but when I did my head spun and I grew dizzy as I felt my body getting lighter. Thankfully, the effect seems temporary.
        - Experiments with throwing items through the strange...liquid? have yielded interesting results. Items seem to disappear as soon as they make contact. I wonder where they go. I wonder if it could do the same for living beings...
        - For now, more research needs to be done to see if this could feasibly be safe. I'll have to see if some of the adventurers who helped me earlier can collect more data.

cc_msq3_blockcheck:
    type: task
    definitions: __player|location|target
    script:
        - if <[location]> == none:
            - stop
        - if <proc[cc_msq3_testblock].context[<[target]>|<[location]>]> == 1:
            - narrate "<gray><italic>This block seems safe enough. I'll make a note for Avery."
            - flag <player> msq3_searching:++
            - wait 3s
            - run cc_msq3_nextportal def:<[location]>
            - if <[location]> == portal5:
                - flag <player> msq3_searching:!
                - flag <player> msq3_state:waiting

cc_msq3_nextportal:
    type: task
    definitions: location
    script:
        - narrate "<dark_green>MSQ: A new message from Avery!"
        - choose <[location]>:
            - case portal1:
                - narrate "<dark_green>  Great! I've found another portal for you to investigate. When you have time, travel to <yellow>-3135, 1025<dark_green>. I heard about some strange <yellow> dripping obsidian<dark_green> there, see if you can find it."
            - case portal2:
                - narrate "<dark_green>  Fantastic, what a strange material. Some of these portals sound like they might have even more structural components. I heard mention of one at <yellow>245, 1940<dark_green> that even has <yellow>iron bars<dark_green>. Can you look into that for me?"
            - case portal3:
                - narrate "<dark_green>  Interesting, so it seems these portals DO have some construction to them then. I've got another spot for you to check out, over at <yellow>-640, 4690<dark_green>. Can you investigate the <yellow>magma<dark_green> in that area?"
            - case portal4:
                - narrate "<dark_green>  Similar to the lava, I just can't tell where this came from. One last place I'd like you to investigate. I heard at the tavern last night that a structure at <yellow>7400, -9915<dark_green> has some high value <yellow>gold blocks<dark_green> in its composure. Go take a look?"
            - case portal5:
                - narrate "<dark_green>  Alright, I think we've seen enough. It will take me some time to collate all this data, but I'll send you a message when I'm ready for the next steps in this experiment."
                

cc_msq3_updatebook:
    type: task
    script:
        - take item:cc_msq3_field_journal from:<player> quantity:1
        - define newBook <item[cc_msq3_field_journal]>
        - define pages <[newBook].book_pages>
        - define pages:->:<element[A new page]>
        - adjust def:newBook book_pages:<[pages]>
        - give <player> <[newBook]>

cc_msq3_atlocation:
    type: procedure
    definitions: __player
    script:
        - define location <player.location>
        - if <[location].is_within[portal1]>:
            - determine portal1
        - if <[location].is_within[portal2]>:
            - determine portal2
        - if <[location].is_within[portal3]>:
            - determine portal3
        - if <[location].is_within[portal4]>:
            - determine portal4
        - if <[location].is_within[portal5]>:
            - determine portal5
        - determine none

cc_msq3_testblock:
    type: procedure
    definitions: target|location
    script:
        - narrate "<[location]>: <[target]>"
        - define match 0
        - choose <[location]>:
            - case portal1:
                - if <list[OBSIDIAN|NETHERACK].contains[<[target]>]>:
                    - define match 1
            - case portal2:
                - if <list[CRYING_OBSIDIAN|NETHERACK|ICE].contains[<[target]>]>:
                    - define match 1
            - case portal3:
                - if <list[IRON_BARS|OBSIDIAN|CRACKED_STONE_BRICKS].contains[<[target]>]>:
                    - define match 1
            - case portal4:
                - if <list[MAGMA_BLOCK|MOSSY_STONE_BRICKS|OBSIDIAN].contains[<[target]>]>:
                    - define match 1
            - case portal5:
                - if <list[OBSIDIAN|CRYING_OBSIDIAN|GOLD_BLOCK].contains[<[target]>]>:
                    - define match 1
        - determine <[match]>