cc_util_check_enchantment:
    type: procedure
    definitions: __player|slot|enchantment
    script:
        
        - determine <[enchantments]>
        - if <[enchantments].contains[<[enchantment]>]>:
            - determine true
        - determine false