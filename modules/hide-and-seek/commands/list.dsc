cc_hide_seek_list:
    type: task
    debug: false
    script:
         - define player_count <server.online_players_flagged[hs_active].size>
         - if <[player_count]> <= 0:
            - narrate "No players are currently playing Hide & Seek!"
            - stop
         - define players "Current Hide & Seek players (<aqua><[player_count]><reset>): "
         - foreach <server.online_players_flagged[hs_active]> as:p:
            - define players "<[players]> <[p].display_name>"
         - narrate <[players]>
