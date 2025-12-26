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
            - narrate "<bold><npc.name><reset>: <gold><magic>Are you friend? You bring trades?"
            - narrate "<bold><npc.name><reset>: <green><magic>Are you travels good?"
            - narrate "<bold><npc.name><reset>: <green><magic>Is a good day in the tree!"
            - narrate "<bold><npc.name><reset>: <dark_purple><magic>The druids magic bless you"

liliago_skin_fix:
    type: assignment
    actions:
        on assignment:
            - trigger name:proximity state:true radius:30
    interact scripts:
        - liliago_apply_skin

liliago_apply_skin:
    type: interact
    steps:
        1:
            proximity trigger:
                entry:
                    script:
                        - execute as_server "meg npc model citizens:55:[Liliago] remove nocsy_toom_professor"
                        - execute as_server "meg npc model citizens:55:[Liliago] add nocsy_toom_professor"

haldis_skin_fix:
    type: assignment
    actions:
        on assignment:
            - trigger name:proximity state:true radius:30
    interact scripts:
        - haldis_apply_skin

haldis_apply_skin:
    type: interact
    steps:
        1:
            proximity trigger:
                entry:
                    script:
                        - execute as_server "meg npc model citizens:54:[Haldis] remove nocsy_toom_zen_priest"
                        - execute as_server "meg npc model citizens:54:[Haldis] add nocsy_toom_zen_priest"
