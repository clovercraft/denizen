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
                        - if <player.has_flag[silverfish_visit_cooldown]>:
                            - stop
                        - if <player.flag[silverfish_visits]> >= 2:
                            - flag player silverfish_visits:3
                            - flag player silverfish_familiar:1
                            - stop
                        - else:
                            - flag player silverfish_visit_cooldown:1 expire:12h
                            - flag player silverfish_visits:++


