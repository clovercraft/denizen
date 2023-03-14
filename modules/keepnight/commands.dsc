c_keepnight_toggle:
    type: command
    name: keepnight
    description: Request or cancel a request to keep night after the current day
    usage: /keepnight <&lt>on|off<&gt>
    aliases:
        - keepn
    tab completions:
        1: on|off
    script:
        - choose <context.args.first>:
            - case on:
                - flag player nosleep:true
                - flag server nosleep:true
                - announce "<player.name><&r> would like to keep night. Please don't sleep!"
            - case off:
                - flag player nosleep:!
                - if <server.online_players_flagged[nosleep].size> == 0:
                    - flag server nosleep:!
                    - announce "Keep night has been canceled."
                - else:
                    - narrate "Your keep night request has been canceled. Someone else has also requested night, please don't sleep."

c_keepnight_toggle_force:
    type: command
    name: forceallowsleep
    description: Force a toggle of the current keep night settings. Admin only.
    usage: /forceallowsleep
    permission: cc.admin
    aliases:
        - clearkeepnight
    script:
        - run t_keepnight_clear