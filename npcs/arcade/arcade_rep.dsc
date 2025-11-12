cc_npc_arcade_rep:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run cc_npc_arcade_rep_talk

cc_npc_arcade_rep_talk:
    type: task
    script:
        - narrate "Hello, <player.display_name>, how can I help you today?"
        - clickable save:exports:
            - run cc_npc_arcade_rep_exports
        - narrate <element[<&lb><green>Arcade CC:<reset> Retrieve your Rewards<&rb>].on_click[<entry[exports].command>]>

cc_npc_arcade_rep_exports:
    type: task
    script:
        # check for exports
        - if !<player.has_flag[rewards]>:
            - narrate "Sorry, it doesn't look like you've got any rewards in customs right now."
            - stop
        # get exported items
        - define items <player.flag[rewards]>
        - foreach <[items]> as:item:
            - give <[item]>
        - flag player rewards:!
        - narrate "Great, I found your rewards in our customs. Here you go!"