cc_tag_gamemaster_a:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run cc_tag_gamemaster_talk

cc_tag_gamemaster_talk:
    type: task
    script:
        - define it <proc[cc_tag_get_it]>
        - if <[it]> == <player.name>:
            - narrate "<&7>Hello <player.display_name>. You are currently it. You must tag someone to continue the game. Unfortunately, I can't opt you out while you're it either. But staff can, if you really don't want to play."
            - stop
        - clickable save:findout:
            - if <player.has_flag[findout_cooldown]>:
                - narrate "Oh oh oh! I can't tell you yet! Sneaky trying to find out too soon."
                - stop
            - else:
                - flag player findout_cooldown:true expire:1h
                - narrate "<red><[it]><reset> is currently it!"
                - stop
        - clickable save:optout:
            - flag player tag_optout:true
            - narrate "Got it! You're no longer playing tag. Come see me again if you want to re-join the game!"
            - stop
        - clickable save:optin:
            - flag player tag_optout:!
            - narrate "Hey hey hey! Welcome back to the game! Don't get tagged!"
            - stop
        - if <player.has_flag[tag_optout]>:
            - narrate "Howdy hey, <player.display_name>. Did you want to <element[<green><underline>Rejoin (click me)].on_click[<entry[optin].command>]> the game?"
            - stop
        - narrate "Well hello there, <player.display_name>. Would you like to <element[<green><underline>Find Out (click me)<reset>].on_click[<entry[findout].command>]> who is it right now? You can only ask once every hour, so use this wisely."
        - narrate "You can also <element[<red><underline>Opt Out (click me)<reset>].on_click[<entry[optout].command>]> of the game of tag, if you would no longer like to play. If you opt out, other players will not be able to tag you."

cc_tag_get_it:
    type: procedure
    script:
        - define it <server.flag[it]>
        - define player <player[<[it]>]>
        - determine <[player].name>

cc_tag_get_it_online:
    type: procedure
    script:
        - determine <server.online_players_flagged[it].size.is_more_than[0]>