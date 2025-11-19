nikto_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run nikto_interact

klaatu_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run klaatu_interact

barada_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run barada_interact


szisquh_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run szisquh_interact

szisquh_interact:
    type: task
    script:
            - if <player.location.world.moon_phase> == 1 && <player.location.world.time> >= 13500 && !<player.has_flag[szisquh_cooldown]>:
                - narrate "<bold>Queen Szisquh:<reset> <player.name>, it's my birthday! Thanks for remembering!"
                - wait 2s
                - narrate "<&7>They give you some fireworks."
                - execute as_server "give <player.name> firework_rocket 2 0 [fireworks={flight_duration:2,explosions:[{shape:"large_ball",has_twinkle:0,has_trail:1,colors:[I;8073150]}]}]"
                - execute as_server "give <player.name> firework_rocket 2 0 [fireworks={flight_duration:3,explosions:[{shape:"star",has_twinkle:1,has_trail:0,colors:[I;11743532],fade_colors:[I;15435844]}]}]"
                - execute as_server "give <player.name> firework_rocket 2 0 [fireworks={flight_duration:1,explosions:[{shape:"burst",has_twinkle:1,has_trail:1,colors:[I;2651799]}]}]"
                - flag player szisquh_cooldown:1 expire:7d
                - stop

silverfish_collective_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:proximity state:true
    interact scripts:
    - 10 silverfish_collective_interact

silverfish_collective_interact:
    type: interact
    steps:
        1:
            proximity trigger:
                entry:
                    script:
                        - if <player.has_flag[silverfish_visit_cooldown]> or <player.has_flag[silverfish_familiar]>:
                            - stop
                        - if <player.flag[silverfish_visits]> >= 2:
                            - flag player silverfish_visits:3
                            - flag player silverfish_familiar:1
                            - stop
                        - else:
                            - flag player silverfish_visit_cooldown:1 expire:12h
                            - flag player silverfish_visits:++


szisquh_debug:
    type: command
    description: Szisquh Debug.
    permission: cc.szisquhdebug
    name: szisquhdebug
    usage: /szisquhdebug
    script:
        - narrate "<bold>Queen Szisquh:<reset> <player.name>, it's my birthday! Thanks for remembering!"
        - wait 2s
        - narrate "<&7>They give you some fireworks."
        - execute as_server "give <player.name> firework_rocket 2 0 [fireworks={flight_duration:2,explosions:[{shape:"large_ball",has_twinkle:0,has_trail:1,colors:[I;8073150]}]}]"
        - execute as_server "give <player.name> firework_rocket 2 0 [fireworks={flight_duration:3,explosions:[{shape:"star",has_twinkle:1,has_trail:0,colors:[I;11743532],fade_colors:[I;15435844]}]}]"
        - execute as_server "give <player.name> firework_rocket 2 0 [fireworks={flight_duration:1,explosions:[{shape:"burst",has_twinkle:1,has_trail:1,colors:[I;2651799]}]}]"
        - flag player szisquh_cooldown:1 expire:7d
        - stop