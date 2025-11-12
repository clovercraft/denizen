cc_city_host_assignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run cc_city_host_talk

cc_city_host_talk:
    type: task
    script:
        - define warp <npc.flag[warp]>
        - if !<player.has_flag[<[warp]>]>:
            - flag player <[warp]>:1
            - narrate "Oh, hello there <player.display_name>. Seems this is the first time you've been here. I'll unlock the city warp for you."
            - run cc_city_unlock_warp def:<[warp]>
        - else:
            - narrate "Welcome back, <player.display_name>, how are you today?"

cc_city_unlock_warp:
    type: task
    definitions: warp
    script:
        - permission add "essentials.warps.<[warp]>"
        - narrate "<&7>[Granted <&a>/<[warp]><&7> warp permission]"
        - run cc_city_welltraveled_check


cc_city_welltraveled_check:
    type: task
    script:
        - if <player.has_flag[welltravelled]>:
            - stop
        - if <player.has_flag[lux]> && <player.has_flag[kowloon]> && <player.has_flag[ngc]>:
            - flag player welltravelled:1
            - permission add "group.welltraveled"
            - wait 2s
            - narrate "<&7>Congratulations! You are now <&d>well travelled<&7>! That means you've unlocked player to player teleportation."
            - narrate "<&7>You can now use the <&a>/tpa <&lt>player<&gt><&7> command to send teleport requests to your friends!"