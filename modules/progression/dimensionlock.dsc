cc_progression_netherlock_w:
    type: world
    debug: false
    events:
        on player enters portal:
            - if !<player.has_flag[nether_enabled]>:
                - narrate "<gray><italic>As you touch the portal, you become confused. Perhaps Avery can explain what's going on here."
                - teleport <player> <player.location.sub[1,0,0]>
        on portal created:
            - if <context.reason.equals[END_PLATFORM]>:
                - determine cancelled
            - else:
                - if !<player.has_flag[nether_enabled]>:
                    - foreach <context.blocks> as:block:
                        - modifyblock <[block]> air naturally:netherite_pickaxe
                    - narrate "<gray><italic>You try to open a window to another world, but it fails. Perhaps Avery can help you sort out this mystery."
                    - determine cancelled
        on player right clicks end_portal_frame:
            - determine cancelled