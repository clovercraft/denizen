cc_npc_arcade_helper:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run cc_npc_arcade_helper_talk

cc_npc_arcade_helper_talk:
    type: task
    script:
        - narrate "Hello, <player.display_name>, how can I help you today?"
        - clickable cc_npc_arcade_helper_exports save:exports
        - narrate <element[<&lb><green>Park Customs: <gray>Export your Rewards<reset><&rb>].on_click[<entry[exports].command>]>
        - clickable cc_npc_arcade_helper_navigation save:navigation
        - narrate <element[<&lb><green>Navigation: <gray>Park locations and exits<reset><&rb>].on_click[<entry[navigation].command>]>
        - clickable cc_npc_arcade_helper_broken save:problem
        - narrate <element[<&lb><green>Report a Problem: <gray>Let our staff know something is wrong<&rb>].on_click[<entry[problem].command>]>

cc_npc_arcade_helper_exports:
    type: task
    script:
        # get exportable items
        - define items <player.inventory.list_contents>
        - define rewards <[items].filter_tag[<[filter_value].has_flag[reward]>]>

        # additionally flag any discs
        - define discs <[items].filter_tag[<[filter_value].material.is_record>]>
        - foreach <[discs]> as:disc:
            - if <[disc].has_lore>:
                - define rewards:->:<[disc]>

        # bail early if no rewards
        - if <[rewards].is_empty>:
            - narrate "It looks like you don't have any exportable rewards on you. Sorry about that!"
            - stop
        - narrate "I can move items from your inventory to our representative in the Lobby. Here are the items that I can export:"
        - foreach <[rewards]> as:item:
            - if <[item].material.is_record>:
                - narrate " <[item].lore.first>"
            - else:
                - narrate " <[item].display>"
        - clickable save:yes:
            - foreach <[rewards]> as:item:
                - take item:<[item]>
            - if <player.has_flag[rewards]>:
                - define old_rewards <player.flag[rewards]>
                - foreach <[old_rewards]> as:item:
                    - define rewards:->:<[item]>
            - flag player rewards:<[rewards]>
            - narrate "Alright! Your items will be waiting for you at the Lobby. Thanks for visiting!"
            - stop
        - clickable save:no:
            - narrate "No problem. Thank you for visiting, and enjoy your day!"
            - stop
        - narrate "Would you like to continue? <element[<&lb><green>Yes<reset><&rb>].on_click[<entry[yes].command>]> <element[<&lb><red>Cancel<reset><&rb>].on_click[<entry[no].command>]>"

cc_npc_arcade_helper_navigation:
    type: task
    script:
        - narrate "Sure, some help with getting around."
        - wait 1s
        - narrate "Right now, you're standing in Guest Services, at the front of the park."
        - narrate "The park entrance and exit is just outside, and there is a map of the park layout as well."
        - narrate "Following the pathways will lead you to our other attractions."
        - narrate "When you're ready to leave, simply walk up to the exit."
        - narrate "Hope that helps answer your questions! Thank you for visiting the Arcade!"

cc_npc_arcade_helper_broken:
    type: task
    script:
        - define player <player.display_name>
        - define online <server.online_players.filter_tag[<[filter_value].has_permission[cc.arcadehelp]>]>
        - narrate "We're very sorry to hear your experience in the Arcade was less than perfect."
        - if <[online].is_empty>:
            - flag server arcade_problem:<[player]>
            - narrate "Our staff team has been notified of your complaint, and will reach out to follow up via discord."
        - else:
            - narrate targets:<[online]> "<[player]> <red>has reported a problem in the Arcade."
            - narrate "Our online staff have been notified and should follow up with you promptly."

cc_npc_arcade_helper_hooks:
    type: world
    events:
        on player joins:
            - if <server.has_flag[arcade_problem]> && <player.has_permission[cc.arcadehelp]>:
                - wait 3s
                - narrate "<server.flag[arcade_problem]> <red>has reported a problem in the Arcade. No staff were online at the time of report."
                - flag server arcade_problem:!