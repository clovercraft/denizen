cc_msq1_start:
    type: task
    script:
        - narrate "oh, hi there. Do you have a moment? My name is Avery, I'm something of a traveling scholar and..."
        - wait 1s
        - narrate "Well, I've been hearing about some of the mysterious things folks have been finding in these parts, and wanted to do a little research."
        - narrate "I don't suppose you'd be interested in helping? I'll make it worth your while. Might even settle down here and teach you some of what I know. So what do you say?"
        - clickable save:click_yes:
            - run cc_msq1_flags_setup
            - narrate "Great! If you find any items with a strange glow, bring them to me. I'll be sure to pay you for them."
            - run cc_msq1_infoblock
            - flag <player> msq1_state:accepted
        - clickable save:click_no:
            - narrate "Alright. Let me know if you change your mind."
        - narrate "<green><element[Yes].on_click[<entry[click_yes].command>]><reset> | <red><element[No].on_click[<entry[click_no].command>]><reset>"

cc_msq1_donate:
    type: task
    script:
        - if <server.flag[msq1_participants]> > 15 && <server.flag[msq1_donations]> > 480:
            - narrate "Oh, Hey! All those items everyone donated were so helpful for my research. I'm going to be settling down in town soon, then I can teach you what I know!"
            - stop
        - if <proc[cc_msq1_enchanted_check]>:
            - narrate "Hey again. I've got a feeling you've got some of those items I was looking for. Looking to donate them?"
            - narrate "<dark_red>WARNING:<reset> Avery will remove ALL enchanted items from your inventory. If there's anything you don't want to sell, store it somewhere before proceeding."
            - clickable save:click_yes:
                - narrate "Fantastic, thank you. These will make a massive difference for my research."
                - run cc_msq1_take_enchanted
            - clickable save:click_no:
                - narrate "Okay. Don't forget I'll make it worth your while, though."
            - narrate "<green><element[Yes].on_click[<entry[click_yes].command>]><reset> | <red><element[No].on_click[<entry[click_no].command>]><reset>"
        - else:
            - narrate "Still looking for those items? I might do some research in the capitol building in the meantime. And that tavern in Cliffside looks pretty cozy as well."
            - narrate "Maybe some of the other adventurers in the Guild Hall could help too...So much to do..."

cc_msq1_take_enchanted:
    type: task
    script:
        - define items <player.inventory.list_contents>
        - define item_count 0
        - foreach <[items]> as:item:
            - if <[item].enchantment_types.size> > 0:
                - define item_count:++
                - take item:<[item]>
        - define reward 100
        - define reward:*:<[item_count]>
        - money give quantity:<[reward]> players:<player>
        - if <player.has_flag[msq1_donated]> == false:
            - flag <player> msq1_donated:1
            - flag <server> msq1_participants:++
        - flag <server> msq1_donations:+:<[item_count]>
        - narrate "Here's <[reward]>☺ for your help."
        - run cc_msq1_counts

cc_msq1_infoblock:
    type: task
    script:
        - narrate "<dark_green>Main Story Quest: Inquisitive Minds<reset>"
        - narrate "  <dark_green>Work with others to bring Avery Evencrest enchanted materials that they may study.<reset>"
        - narrate "  <dark_green>Avery may be found in various locations throughout Port Branta.<reset>"
        - run cc_msq1_counts

cc_msq1_counts:
    type: task
    script:
        - define player_count <server.flag[msq1_participants]>
        - define item_count <server.flag[msq1_donations]>
        - narrate "  <dark_green>[<[item_count]>/480 Items]<reset>"
        - narrate "  <dark_green>[<[player_count]>/15 Players]<reset>"

cc_msq1_flags_setup:
    type: task
    script:
        - if <server.has_flag[msq1_participants]> == false:
            - flag <server> msq1_participants:0
        - if <server.has_flag[msq1_donations]> == false:
            - flag <server> msq1_donations:0

cc_msq1_enchanted_check:
    type: procedure
    script:
        - define items <player.inventory.list_contents>
        - foreach <[items]> as:item:
            - if <[item].enchantment_types.size> > 0:
                - determine true
        - determine false

cc_msq1_info_command:
    type: command
    name: msq-info
    description: Get the current Main Story Quest information
    usage: /msq-info
    script:
        - run cc_msq1_infoblock