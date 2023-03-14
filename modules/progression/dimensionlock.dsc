cc_progression_netherlock_w:
    type: world
    debug: false
    events:
        on portal created:
            - if <context.reason.equals[END_PLATFORM]>:
                - determine cancelled
            - else:
                - foreach <context.blocks> as:block:
                    - modifyblock <[block]> air naturally:netherite_pickaxe
                - determine cancelled
        on player right clicks end_portal_frame:
            - determine cancelled