cc_snowball_w:
    type: world
    events:
        on snowball collides with player flagged:snowball_hits:
            - run cc_snowball_onhit_t

cc_snowball_onhit_t:
    type: task
    script:
        - flag <player> snowball_hits:++
        - if <player.flag[snowball_hits]> >= 3:
            - flag <player> snowball_hits:!
            - narrate "Three strikes, you're out!"
            - wait 2s
            - inventory clear destination:<player.inventory>
            - kill <player>

cc_snowball_join_c:
    type: command
    name: snowball
    usage: /snowball <&lt>join|leave<&gt>
    script:
        - choose <context.args.get[1]>:
            - case "join":
                - flag <player> snowball_hits:0
                - narrate "You have joined the snowball fight. Get ready!"
            - case "leave":
                - flag <player> snowball_hits:!
                - narrate "You are no longer in the snowball fight."