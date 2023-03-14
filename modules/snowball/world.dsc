cc_snowball_w:
    type: world
    events:
        on snowball hits player flagged:snowball_hits:
            - define current_hits <context.hit_entity.flag[snowball_hits]>
            - if <context.shooter.flag[snowball_team]> == "orange" && <context.hit_entity.flag[snowball_team]> == "blue":
                - flag <context.hit_entity> snowball_hits:++
            - if <context.shooter.flag[snowball_team]> == "blue" && <context.hit_entity.flag[snowball_team]> == "orange":
                - flag <context.hit_entity> snowball_hits:++
            - if <context.hit_entity.flag[snowball_hits]> >= 3:
                - flag <context.hit_entity> snowball_hits:!
                - flag <context.hit_entity> snowball_team:!
                - narrate "Three strikes, you're out!"
                - wait 2s
                - inventory clear destination:<context.hit_entity.inventory>
                - kill <context.hit_entity>
            - else if <context.hit_entity.flag[snowball_hits]> > <[current_hits]>:
                - narrate "You've been hit! <context.hit_entity.flag[snowball_hits]> of 3"
        

cc_snowball_join_c:
    type: command
    name: joinmatch
    usage: /joinmatch <&lt>orange|blue<&gt>
    script:
        - flag <player> snowball_hits:0
        - choose <context.args.get[1]>:
            - case "orange":
                - flag <player> snowball_team:orange
                - narrate "You have joined the snowball fight on the <player.flag[snowball_team]> team. Get ready!"
            - case "blue":
                - flag <player> snowball_team:blue
                - narrate "You have joined the snowball fight on the <player.flag[snowball_team]> team. Get ready!"