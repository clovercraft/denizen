cc_util_make_receipt:
    type: task
    definitions: __player|items
    script:
        - narrate "<dark_gray>[SYS]<reset> Buying items:"
        - foreach <[items]> as:item:
            - define item_name <[item].get[name]>
            - define item_price <[item].get[price]>
            - define item_qty <[item].get[qty]>
            - define line_total <[item_price]>
            - define line_total:*:<[item_qty]>
            - define lore_line "<[item_name]> <gray>(x<[item_qty]>)<reset>: <[line_total]>☺"
            - narrate "  <[lore_line]>"
