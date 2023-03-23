cc_towns_showobjective_c:
    type: command
    description: Shows the settlement objectives. Read this to learn about how to unlock bonuses for the members of your settlement.
    name: objectives
    usage: /objectives
    script:
        - inventory open destination:cc_towns_objectives_i

cc_towns_settlements_c:
    type: command
    description: Lists the settlements on the server.
    name: list-settlements
    usage: /list-settlements
    script:
        - ~webget https://clovercraft.gg/api/settlements/list?denizenkey=mydenizensecret save:settlements
        - ~yaml loadtext:<entry[settlements].result> id:settlements
        - define town_list <yaml[settlements].read[data]>
        - narrate "<green>Available Settlements<reset>"
        - foreach <[town_list]> as:town:
            - narrate "  <[town].get[name]> <gray>(ID: <[town].get[slug]>)"

cc_towns_create_c:
    type: command
    description: Creates a new named settlement.
    name: create-settlement
    usage: /create-settlement <&lt>name<&gt>
    script:
        - ~webget https://clovercraft.gg/api/settlements/create?denizenkey=mydenizensecret&uuid=<player.uuid>&name=<context.args.get[1]> save:created
        - if <entry[created].status> == 200:
            - ~yaml loadtext:<entry[created].result> id:created
            - define slug <yaml[created].read[slug]>
            - define name <yaml[created].read[name]>
            - narrate "Congrats! You have created a new settlement named <yellow><[name]><reset>. Other players can join this settlement using the <yellow>/join-settlement <[slug]><reset> command."
        - else:
            - narrate "<red>Sorry, something went wrong."
            - narrate "Settlement names must be unique. Check existing settlements using <yellow>/list-settlements<reset> to make sure the name isn't in use."

cc_towns_join_c:
    type: command
    description: Join an existing settlement by name.
    name: join-settlement
    usage: /join-settlement <&lt>id<&gt>
    script:
        - define settlement <context.args.get[1]>
        - ~webget https://clovercraft.gg/api/settlements/join?denizenkey=mydenizensecret&uuid=<player.uuid>&name=<context.args.get[1]> save:joined
        - if <entry[joined].status> == 200:
            - ~yaml loadtext:<entry[joined].result> id:joined
            - define name <yaml[joined].read[name]>
            - narrate "Congrats! You have joined the <yellow><[name]><reset> settlement!"
        - else:
            - narrate "<red>Sorry, something went wrong."
            - narrate "Are you sure you've got the Settlement ID right? You can check using <yellow>/list-settlements<reset>"

cc_towns_settlement_members_c:
    type: command
    description: Lists the members in a settlement.
    name: settlement-members
    usage: /settlement-members <&lt>id<&gt>
    script:
        - ~webget https://clovercraft.gg/api/settlements/citizens?denizenkey=mydenizensecret&settlement=<context.args.get[1]> save:members
        - if <entry[members].status> == 200:
            - ~yaml loadtext:<entry[members].result> id:members
            - define citizens <yaml[members].read[citizens]>
            - narrate "Members of Settlement <&lt><context.args.get[1]><&gt>"
            - foreach <[citizens]> as:name:
                - narrate "  <[name]>"
        - else:
            - narrate "<red>Sorry, something went wrong."
            - narrate "Are you sure you've got the Settlement ID right? You can check using <yellow>/list-settlements<reset>"

cc_towns_glyphs_c:
    type: command
    description: Gives the player 16 warp glyphs once every 24 hours.
    name: warp-glyphs
    usage: /warp-glyphs
    permission: clovercraft.settlement.township
    script:
        - if <player.has_flag[give_glyph_cooldown]>:
            - define cooldown <player.flag_expiration[give_glyph_cooldown].duration_since[<util.time_now>].formatted>
            - narrate "<&6>Cooldown: <&7>(<[cooldown]>)<&r>"
            - stop
        - give warp_glyph quantity:16
        - flag <player> give_glyph_cooldown:true expire:24h