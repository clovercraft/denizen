fytari_assignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run fytari_talk

fytari_talk:
    type: task
    script:
        - random:
            - narrate "<bold><npc.name><reset>: <green><magic>Hello friend!"
            - narrate "<bold><npc.name><reset>: <gold><magic>are you friend? You bring trades?"
            - narrate "<bold><npc.name><reset>: <green><magic>Are you travels good?"
            - narrate "<bold><npc.name><reset>: <green><magic>Is a good day in the tree!"
            - narrate "<bold><npc.name><reset>: <dark_purple><magic>The druids magic bless you"
