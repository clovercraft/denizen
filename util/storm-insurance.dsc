cc_storm_insurance:
    type: world
    events:
        after thunder begins:
            - flag server stormed:true expire:1h
        on delta time hourly:
            - if !<server.has_flag[stormed]>:
                - flag server stormed:true expire:1h
                - weather thunder