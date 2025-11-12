cc_command_gnc:
    type: command
    name: ngc
    description: Warp to New Garnethold City
    usage: /ngc
    script:
        - execute as_player "warp ngc"

cc_command_kowloon:
    type: command
    name: kowloon
    description: Warp to Kowloon City
    usage: /kowloon
    script:
        - execute as_player "warp kowloon"

cc_command_luxchroma:
    type: command
    name: luxchroma
    description: Warp to Lux Chroma
    usage: /luxchroma
    aliases:
        - lux
    script:
        - execute as_player "warp lux"

cc_command_cloverbloom:
    type: command
    name: cloverbloom
    description: Warp to Clovebloom Isles
    usage: /cloverbloom
    script:
        - execute as_player "warp cloverbloom"