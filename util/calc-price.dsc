cc_util_calc_price:
    type: procedure
    definitions: item|price|limit
    script:
        - define quantity <player.inventory.quantity_item[<[item]>]>
        - if <[quantity]> > <[limit]>:
            - define quantity <[limit]>
        - define value <[price]>
        - define value:*:<[quantity]>
        - determine <[value]>

cc_util_calc_max:
    type: procedure
    definition: item|max
    script:
        - define qty <player.inventory.quantity_item[<[item]>]>
        - if <[qty]> > <[max]>:
            - define qty <[max]>
        - determine <[max]>