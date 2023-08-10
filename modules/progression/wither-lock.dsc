cc_progression_wither_lock:
    type: world
    events:
        on player right clicks soul_sand with:wither_skeleton_skull:
            - if !<player.has_flag[msq6_state]> || <player.flag[msq6_state]> != completed:
                - narrate "<gray>Something dark and forboding in the depths of your mind cries out, telling you of great danger if you combine these elements."
                - determine cancelled