cc_dragon_drops_clock:
    type: world
    events:
        after ender_dragon dies:
            - foreach <server.online_players> as:target:
                - if <[target].location.world.name> == world_the_end:
                    - run cc_dragon_drops def:<[target]>

cc_dragon_drops:
    type: task
    definitions: __player
    script:
        - if <player.has_flag[dragon_drops]>:
            - stop
        - give cc_wings
        - give shulker_box
        - flag player dragon_drops:true

cc_wings:
    type: item
    material: elytra
    display name: <&b>Dragon Wings
    lore:
        - <dark_purple>Free The End!
    enchantments:
        - unbreaking:3
        - mending:1
