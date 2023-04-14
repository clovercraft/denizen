# +--------------------------
# |
# | M a g i c   S i d e b a r
# |
# | Provides a working live-updating per-player sidebar!
# |
# +--------------------------
#
# @author mcmonkey
# @date 2019-03-01
# @updated 2022-09-19
# @denizen-build REL-1777
# @script-version 1.1
#
# Installation:
# 1. Put the script in your scripts folder.
# 2. Edit the config script below to your liking.
# 3. Reload
#
# Usage:
# Type "/sidebar" in-game to toggle the sidebar on or off.
#
# ---------------------------- END HEADER ----------------------------

# ------------------------- Begin configuration -------------------------
magic_sidebar_config:
    type: data
    # How many updates per second (acceptable values: 1, 2, 4, 5, 10)
    per_second: 1
    # Set this to your sidebar title.
    title: <aqua><bold>Hide & Seek
    # Set this to the list of sidebar lines you want to display.
    # Start a line with "[scroll:#/#]" to make it automatically scroll
    # with a specified width and scroll speed (characters shifted per second).
    # Note that width must always be less than the line's actual length.
    # There should also be at least one normal line that's as wide as the width, to prevent the sidebar resizing constantly.
   #  - [scroll:20/5]<&a>Welcome to <&6>my server<&a>, <&b><player.name><&a>!
   #  - <&8>-----------------------
   #  - <light_purple>Hiders<reset>
    lines:
    - Ping: <&b><player.ping>
    - Location: <&b><player.location.xyz.replace_text[,].with[<&f>,<&b>]>
   #  - [player_list:hs_hidden]
    active_title: <yellow>Joined<reset>
    hiders_title: <light_purple>Hiders<reset>
    seekers_title: <gold>Seekers<reset>
   #  - <gold>Seekers<reset>:
# ------------------------- End of configuration -------------------------

magic_sidebar_world:
    type: world
    debug: false
    events:
        on delta time secondly:
        - define per_second <script[magic_sidebar_config].data_key[per_second]>
        - define wait_time <element[1].div[<[per_second]>]>s
        - define players <server.online_players.filter[has_flag[sidebar_disabled].not]>
        - define title <script[magic_sidebar_config].data_key[title]>
        - repeat <[per_second]>:
            - sidebar title:<[title].parsed> values:<proc[magic_sidebar_lines_proc]> players:<[players]> per_player
            - wait <[wait_time]>

magic_sidebar_lines_proc:
    type: procedure
    debug: false
    script:
        - define active_title <script[magic_sidebar_config].data_key[active_title]>
        - define hiders_title <script[magic_sidebar_config].data_key[hiders_title]>
        - define seekers_title <script[magic_sidebar_config].data_key[seekers_title]>
        - define actives <server.online_players_flagged[hs_active]>
        - define hiders <server.online_players_flagged[hs_hidden]>
        - define seekers <server.online_players_flagged[hs_seeker]>
        - define list <[active_title].parsed>
        - foreach <[actives]> as:active:
            - if !<[active].has_flag[hs_hidden]> && !<[active].has_flag[hs_seeker]>:
                - define tmp " <aqua>-<reset> <[active].display_name>"
                - define list:->:<[tmp]>
        - define list:->:<[hiders_title].parsed>
        - foreach <[hiders]> as:hidden:
            - define tmp " <light_purple>-<reset> <[hidden].display_name>"
            - define list:->:<[tmp]>
        - define list:->:<[seekers_title].parsed>
        - foreach <[seekers]> as:seeker:
            - define tmp " <gold>-<reset> <[seeker].display_name>"
            - define list:->:<[tmp]>
        - determine <[list]>


magic_sidebar_command:
    type: command
    debug: false
    name: sidebar
    usage: /sidebar
    description: Toggles your sidebar on or off.
    script:
    - if <player.has_flag[sidebar_disabled]>:
        - flag player sidebar_disabled:!
        - narrate "<&[base]>Sidebar enabled."
    - else:
        - flag player sidebar_disabled
        - narrate "<&[base]>Sidebar disabled."
        - wait 1
        - sidebar remove players:<player>