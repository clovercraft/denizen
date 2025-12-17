fytari_setup_script:
    type: world
    events:
        after script reload:
            - run fytari_apply_models

fytari_apply_models:
    type: task
    script:
        - execute as_server "meg npc model citizens:55:[Liliago] remove nocsy_toom_professor"
        - execute as_server "meg npc model citizens:55:[Liliago] add nocsy_toom_professor"
        - execute as_server "meg npc model citizens:54:[Haldis] remove nocsy_toom_zen_priest"
        - execute as_server "meg npc model citizens:54:[Haldis] add nocsy_toom_zen_priest"