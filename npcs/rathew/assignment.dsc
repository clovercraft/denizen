rathew_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run rathew_dialogue

rathew_dialogue:
    type: task
    script:
        - if <player.has_flag[rathew_met].not>:
            - narrate "<bold>Rathew:<reset> Ahoy! You aren't an inspector, right?"
            - flag player rathew_met
        - else:
            - narrate "<bold>Rathew:<reset> Ahoy <player.display_name>!"
        - flag player rathew_did_rules:!
        - flag player rathew_did_donate:!
        - flag player rathew_did_whoami:!
        - flag player rathew_did_whathave:!
        - run rathew_menu

rathew_menu:
    type: task
    script:
        - clickable rathew_whoami save:whoami until:10m
        - clickable rathew_rules save:rules until:10m
        - clickable rathew_donate save:donate until:10m
        - clickable rathew_whathave save:whathave until:10m
        - wait 1s
        - if <player.has_flag[rathew_did_whoami].not>:
            - narrate <element[<&lb><green>Who are you?<reset><&rb>].on_click[<entry[whoami].command>]>
        - if <player.has_flag[rathew_did_rules].not>:
            - narrate <element[<&lb><green>What are the rules?<reset><&rb>].on_click[<entry[rules].command>]>
        - if <player.has_flag[rathew_did_donate].not>:
            - narrate <element[<&lb><green>How do I donate?<reset><&rb>].on_click[<entry[donate].command>]>
        - if <player.has_flag[rathew_did_whathave].not>:
            - narrate <element[<&lb><green>What do you have?<reset><&rb>].on_click[<entry[whathave].command>]>

rathew_whoami:
    type: task
    script:
        - narrate "<bold>Rathew:<reset> I'm Rathew, leader of the resistance! There are too many resources going unused, TOO MANY!! Our goal is to collect the unused trash from mega builds and industrial farms and deliver it to the people in need of such goods, all for the low cost of free!"
        - wait 2s
        - narrate "<bold>Rathew:<reset> Don't go telling the shopping district inspectors though... I uh... don't have a permit for this shop."
        - flag player rathew_did_whoami:1 expire:10m
        - run rathew_menu

rathew_rules:
    type: task
    script:
        - narrate "<bold>Rathew:<reset> Rules? Pfft, what are we the shopping district? That said, we don't want the same items coming back here so only take what you are going to use. We've got a lot of hungry builders starving for specific resources after all."
        - flag player rathew_did_rules:1 expire:10m
        - run rathew_menu

rathew_donate:
    type: task
    script:
        - narrate "<bold>Rathew:<reset> Bring your goods and sort them as best as you can into the different chest categories. If materials you have don't fit in any of the other chests they can go in our Misc pile right at the entrance."
        - wait 2s
        - narrate "<bold>Rathew:<reset> If there isn't room for donation, let us know or take some of the stuff in the chests as you go. Big thing is don't put overflow materials in the Misc chest. All donations are welcome, one rats trash is another rat's treasure!"
        - flag player rathew_did_donate:1 expire:10m
        - run rathew_menu

rathew_whathave:
    type: task
    script:
        - narrate "<bold>Rathew:<reset> A little of everything. On the first floor we have our misc storage, stones, woods, soils, and redstone materials. Upstairs we have crops, tools, and several chests for blocks of every color."
        - wait 2s
        - narrate "<bold>Rathew:<reset> Can't find what you're looking for? Check back later or ask around, you never know what random blocks people are sittin on."
        - flag player rathew_did_whathave:1 expire:10m
        - run rathew_menu