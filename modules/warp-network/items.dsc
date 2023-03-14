warp_glyph:
    type: item
    material: iron_nugget
    mechanisms:
        unbreakable: true
        custom_model_data: 22
    display name: <&3>Warp Glyph
    lore:
    - <&7>It hums and glows with a strange aura<&r>
    -
    - <&6>Right click with this item to consume
    - <&6>its energy, allowing you to <&e>/warp<&r>
    - <&6>from anywhere.

cc_anchorstone_glyph_use:
    type: task
    script:
        - if <player.has_flag[warpglyph]>:
            - narrate "<&6>You are already charged for warp!<&r>"
            - stop
        - flag <player> warpglyph:1
        - permission add 'essentials.warps.*'
        - take iteminhand
        - narrate "<&6>You are now charged for warp!<&r>"


cc_anchorstone_glyph_clear:
    type: task
    script:
        - if <player.has_flag[warpglyph]>:
            - flag <player> warpglyph:!
            - narrate "<&6>You feel the energy disipate<&r>"