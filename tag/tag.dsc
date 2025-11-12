cc_tag_clock:
    type: world
    events:
        on player tries to attack player flagged:it:
            - run cc_tag_ontag def:<context.entity>
        on player joins flagged:it:
            - run cc_tag_it_insurance

cc_tag_ontag:
    type: task
    definitions: target
    script:
        - if <[target].has_flag[tag_optout]>:
            - narrate "<&7>This person isn't playing tag. Find a new target."
            - stop
        - define last_tagger <server.flag[last_tagger]>
        - if <[last_tagger]> == <[target].uuid>:
            - narrate "<&7>You cannot tag the player who tagged you."
            - stop
        - flag server last_tagger:<player.uuid>
        - flag <[target]> it:true
        - flag player it:!
        - flag server it:<[target].uuid>
        - narrate "<green>Congrats!<reset> You are no longer it." targets:<player>
        - narrate "<red>You're IT!<reset> You have been tagged. You must tag another player to clear your name. Tag any player other than the one who tagged you by punching them once." targets:<[target]>

cc_tag_it_insurance:
    type: task
    script:
        - define it <server.flag[it]>
        - if <[it]> != <player.uuid>:
            - flag player it:!
            - narrate "<&7> You were it, but you were offline too long. so you're not it anymore."

cc_tag_set_it:
    type: command
    name: setit
    description: Set which player is it
    usage: /setit
    permission: cc.setit
    script:
        - define newit <player.uuid>
        - flag server it:<[newit]>
        - flag player it:true
        - flag server last_tagger:<player.uuid>
        - narrate "<&7>You are now it and the last tagged player flag is reset. The game is restarted."