# This script handles the purchase logic for NPC traders
#
# @var __player - the current player
# @var items - a list of map tags representing items to buy, formatted as follows
#   [
#       id=minecraft_item_id;
#       name=display_name;
#       price=per_unit_price;
#       max=maximum_qty;
#   ]
#
# The script will collect the necessary information, take the items from the player
# and pay them, then provide a receipt for the sale via narration.
cc_npc_shopkeeper_buy:
    type: task
    definitions: __player|items
    script:
        - narrate "<dark_gray>[SYS]<reset> Buying items:"
        - foreach <[items]> as:item:
            - define item_qty <player.inventory.quantity_item[<[item].get[id]>]>
            - if <[item_qty].is[more].than[<[item].get[max]>]>:
                - define item_qty <[item].get[max]>
            - if <[item_qty].is[more].than[0]>:
                - define item_value <[item].get[price]>
                - define item_value:*:<[item_qty]>
                - take item:<[item].get[id]> quantity:<[item_qty]>
                - money give quantity:<[item_value]> players:<player>
                - narrate "  <[item].get[name]> <gray>(x<[item_qty]>)<reset>: <[item_value]>☺"

cc_npc_shopkeeper_get_total:
    type: procedure
    definitions: __player|items
    script:
        - define total 0
        - foreach <[items]> as:item:
            - define item_qty <player.inventory.quantity_item[<[item].get[id]>]>
            - if <[item_qty].is[more].than[<[item].get[max]>]>:
                - define item_qty <[item].get[max]>
            - define item_value <[item].get[price]>
            - define item_value:*:<[item_qty]>
            - define total:+:<[item_value]>
        - determine <[total]>