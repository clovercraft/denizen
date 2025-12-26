cc_storm_insurance:
    type: world
    events:
        after thunder begins:
            - flag server stormed:true expire:1h
        on delta time hourly:
            - if !<server.has_flag[stormed]> && <server.has_flag[storm_insurance]>:
                - flag server stormed:true expire:1h
                - weather thunder

cc_storm_insurance_toggle:
    type: command
    name: ccstorminsurance
    description: Open the custom items menu
    usage: /ccstorminsurance <&lt>on|off<&gt>
    permission: cc.storminsurance
    tab completions:
        1: off|on
    script:
        - define toggle <context.args.get[1]>
        - if <[toggle]> == on:
            - flag server storm_insurance:true
            - narrate "Enabled storm insurance"
            - stop
        - if <[toggle]> == off:
            - flag server storm_insurance:!
            - narrate "Disabled storm insurance"
            - stop
        - narrate "You must provide either ON or OFF setting"