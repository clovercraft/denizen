cc_npc_capitolfarmer_quest_t:
    type: task
    script:
        - if <player.has_flag[capitolfarmer_quest_cull]> && <player.flag[capitolfarmer_quest_cull]> == 1:
            - run cc_npc_capitolfarmer_quest_handin_t
        - else if <player.has_flag[capitolfarmer_quest_cull]> && <player.flag[capitolfarmer_quest_cull]> == 2:
            - narrate "I appreciate the help! I can't give the farm away though, sorry."
            - stop
        - else:
            - clickable save:click_yes:
                - narrate "<dark_green>Collect 5 bones, 5 rotten flesh, and 5 spider eyes for Duncan."
                - flag <player> capitolfarmer_quest_cull:1
                - stop
            - clickable save:click_no:
                - stop
            - narrate "Hey! Pleasure doing business with you lately. If you happen to have the time, could you consider doing me a favor? The monsters at night have been trampling my crop a ton and I just don't have the time or energy. Cull 'em for me!"
            - narrate "<green><element[Got it!].on_click[<entry[click_yes].command>]><reset> | <gray><element[Not now].on_click[<entry[click_no].command>]><reset>"

cc_npc_capitolfarmer_quest_handin_t:
    type: task
    script:
        - define bone_count <player.inventory.quantity_item[bone]>
        - define flesh_count <player.inventory.quantity_item[rotten_flesh]>
        - define eye_count <player.inventory.quantity_item[spider_eye]>
        - if <[bone_count]> >= 5 && <[flesh_count]> >= 5 && <[eye_count]> >= 5:
            - narrate "Yeah, that'll show 'em. Thanks a lot. Here, take some crop on the house. Maybe you can start your own garden."
            - give carrot quantity:5
            - give potato quantity:5
            - give beetroot_seeds quantity:5
            - give wheat_seeds quantity:5
            - run cc_quests_rankup
            - flag <player> capitolfarmer_quest_cull:2
            - stop
        - else:
            - narrate "Hm, doesn't look like you've got quite enough yet. As a reminder, here's what I need from you."
            - narrate "<dark_green>Collect 5 bones, 5 rotten flesh, and 5 spider eyes for Duncan."