cc_trades_convert_c:
    type: command
    name: convert-coins
    dscription: Converts all Smiley Bucks in your inventory to virtual currency
    usage: /convert-coins
    aliases:
    - coin-convert
    - convertcoins
    - ccoins
    script:
        - define count <player.inventory.quantity_item[cc_trades_dubloons]>
        - if <[count]> > 0:
            - money give players:<player> quantity:<[count]>
            - take item:cc_trades_dubloons quantity:<[count]>