cc_dimension_lock:
    type: world
    events:
        on player right clicks end_portal_frame:
            - if <server.has_flag[end_open]>:
                - stop
            - if !<player.has_flag[end_warning]>:
                - flag player end_warning:true expire:5m
                - narrate "<red>Hold on!<reset> We're not quite ready to open up access to The End yet. Kuddos on getting here quick!"
            - determine cancelled

cc_dimension_lock_toggle:
    type: command
    name: ccdimlock
    description: Open the custom items menu
    usage: /ccdimlock <&lt>on|off<&gt>
    permission: cc.dimlock
    tab completions:
        1: off|on
    script:
        - define toggle <context.args.get[1]>
        - if <[toggle]> == off:
            - flag server end_open:true
            - stop
        - if <[toggle]> == on:
            - flag server end_open:!
            - stop
        - narrate "You must provide either ON or OFF setting"