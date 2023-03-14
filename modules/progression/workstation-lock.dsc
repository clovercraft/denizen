cc_progression_workstation_lock_w:
    type: world
    debug: false
    events:
        on player opens inventory:
            - define type <context.inventory.inventory_type>
            - choose <[type]>:
                - case "ENCHANTING":
                    - if <player.has_flag[enchanting_enabled]>:
                        - stop
                    - else:
                        - narrate "You don't know how to use that yet"
                        - determine cancelled
                - case "BREWING":
                    - if <player.has_flag[msq_brewing_status]> && <player.flag[msq_brewing_status]> == "Complete":
                        - stop
                    - else:
                        - narrate "You don't know how to use that yet"
                        - determine cancelled
                - case "SMITHING":
                    - if <player.has_flag[msq_smithing_status]> && <player.flag[msq_smithing_status]> == "Complete":
                        - stop
                    - else:
                        - narrate "You don't know how to use that yet"
                        - determine cancelled