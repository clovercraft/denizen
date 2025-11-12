cc_command_lobby:
    type: command
    name: lobby
    description: Teleport to the server lobby
    usage: /lobby
    script:
        - execute as_player "warp lobby"

cc_command_resources:
    type: command
    name: resources
    description: Teleport to the server lobby
    usage: /resources
    script:
        - execute as_op "mvtp <player.name> resources"

cc_command_skilltoggle:
    type: command
    name: toggleskills
    description: Toggle your AuraSkills abilities
    usage: /toggleskills
    script:
        - if <player.has_flag[skillsoff]>:
            - flag player skillsoff:!
            - permission remove "group.skillsoff"
        - else:
            - flag player skillsoff:1
            - permission add "group.skillsoff"
        - narrate "toggled AuraSkills"


cc_command_wiki:
    type: command
    name: wiki
    description: Get a link to a given wiki page
    usage: /wiki <&lb>page<&rb>
    tab completions:
        1: getting-started|cheat-sheet|lands|economy|mods
    script:
        - define page home
        - if !<context.args.is_empty>:
            - define page <context.args.first>
        - choose <[page]>:
            - case getting-started:
                - narrate <element[<&lb>CC Wiki: Getting Started<&rb>].custom_color[emphasis].on_hover[Click to Open].click_url[https://wiki.clovercraft.gg/en/player-guide/getting-started]>
            - case cheat-sheet:
                - narrate <element[<&lb>CC Wiki: Command Cheat-Sheet<&rb>].custom_color[emphasis].on_hover[Click to Open].click_url[https://wiki.clovercraft.gg/en/player-guide/cheat-sheet]>
            - case lands:
                - narrate <element[<&lb>CC Wiki: Land Claim Management<&rb>].custom_color[emphasis].on_hover[Click to Open].click_url[https://wiki.clovercraft.gg/en/player-guide/land-claims]>
            - case economy:
                - narrate <element[<&lb>CC Wiki: In-Game Economy<&rb>].custom_color[emphasis].on_hover[Click to Open].click_url[https://wiki.clovercraft.gg/en/player-guide/in-game-economy]>
            - case mods:
                - narrate <element[<&lb>CC Wiki: Official Modpacks<&rb>].custom_color[emphasis].on_hover[Click to Open].click_url[https://wiki.clovercraft.gg/en/player-guide/game-mod-support]>
            - default:
                - narrate <element[<&lb>CC Wiki: Overview<&rb>].custom_color[emphasis].on_hover[Click to Open].click_url[https://wiki.clovercraft.gg/en/player-guide/introduction]>