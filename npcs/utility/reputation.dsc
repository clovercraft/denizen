# +----------------------
# |
# | Clovercraft NPC Reputation Utility Scripts
# |
# +----------------------
#
# @author zenfrii
# @date 2023/03/21
# @script-version 1.0
#
# These scripts provide useful functionality to get and set the reputation of a given
# player with various NPCs.
#
# The various `known` scripts below work off of the player tag `npcs_known`. This flag
# contains a list tag of all NPCs the player has previously interacted with.
#
# Similarly, the `soldto` scripts work off the player tag `npcs_soldto` which contains
# a map tag of which NPCs the player has made sales with, and how many times they have
# sold to that NPC.
#
# Each of these flags should be controlled entirely through these utility scripts, and
# ideally should not be accessed or edited directly anywhere else in our script library.
#
# Finally, this file provides scripts for managing player reputation, which is
# calculated from both the number of NPCs the player knows, and the number of sales
# the player has made.
#
# ---------------------------- END HEADER ----------------------------

# +--------------------+
# | NPCS_KNOWN SCRIPTS |
# +--------------------+

cc_npc_get_knownlist:
    type: procedure
    definitions: __player
    script:
        - define known <list[]>
        - if <player.has_flag[npcs_known]>:
            - define known <player.flag[npcs_known]>
        - determine <[known]>

cc_npc_set_known:
    type: task
    definitions: __player|npc_name
    script:
        - define known <proc[cc_npc_get_knownlist].context[<player>]>
        - if <[known].contains[<[npc_name]>]> == false:
            - define known:->:<[npc_name]>
            - flag <player> npcs_known:<[known]>

cc_npc_check_known:
    type: procedure
    definitions: __player|npc_name
    script:
        - define known <proc[cc_npc_get_knownlist].context[<player>]>
        - define is_known <[known].contains[<[npc_name]>]>
        - determine <[is_known]>

# +---------------------+
# | NPCS_SOLDTO SCRIPTS |
# +---------------------+

cc_npc_get_soldtolist:
    type: procedure
    definitions: __player
    script:
        - define soldto <map[]>
        - if <player.has_flag[npcs_soldto]>:
            - define soldto <player.flag[npcs_soldto]>
        - determine <[soldto]>

cc_npc_set_soldto:
    type: task
    definitions: __player|npc_name
    script:
        - define soldto <proc[cc_npc_get_soldtolist].context[<player>]>
        - if <[soldto].contains[<[npc_name]>]> == false:
            - define soldto <[soldto].include[<[npc_name]>=1;]>
        - else:
            - define numSales <[soldto].get[<[npc_name]>]>
            - define numSales:++
            - define soldto <[soldto].with[<[npc_name]>].as[<[numSales]>]>
        - flag <player> npcs_soldto:<[soldto]>

cc_npc_get_soldto:
    type: procedure
    definitions: __player|npc_name
    script:
        - define soldto <proc[cc_npc_get_soldtolist].context[<player>]>
        - if <[soldto].contains[<[npc_name]>]>:
            - determine <[soldto].get[<[npc_name]>]>
        - else:
            - determine 0

cc_npc_update_soldto:
    type: task
    definitions: __player|npc_name
    script:
        - define soldto <proc[cc_npc_get_soldtolist].context[<player>]>
        - define numSales <proc[cc_npc_get_soldto].context[<player>|<[npc_name]>]>
        - define numSales:++
        - define soldto <[soldto].with[<[npc_name]>].as[<[numSales]>]>
        - flag <player> npcs_soldto:<[soldto]>

# +--------------------+
# | REPUTATION SCRIPTS |
# +--------------------+

cc_npc_reputation_check_single:
    type: procedure
    definitions: __player|npc_name
    script:
        - define reputation 0
        - define known <proc[cc_npc_check_known].context[<player>|<[npc_name]>]>
        - if <[known]>:
            - define reputation:++
            - define soldto <proc[cc_npc_get_soldto].context[<player>|<[npc_name]>]>
            - define reputation:+:soldto
        - determine <[reputation]>

cc_npc_reputation_check_global:
    type: procedure
    definitions: __player
    script:
        - define reputation 0
        - define known <proc[cc_npc_get_knownlist].context[<player>]>
        - if <[known].size> < 0:
            - foreach <[known]> as:npc_name:
                - define reputation:++
                - define soldto <proc[cc_npc_get_soldto].context[<player>|<[npc_name]>]>
                - define reputation:+:soldto
        - determine <[reputation]>