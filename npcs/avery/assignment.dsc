avery_assignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run avery_talk

avery_talk:
    type: task
    script:
        - if <player.has_flag[avery_met].not>:
            - clickable save:continue2 until:2m:
                - narrate "<bold>Avery:<reset> If you happen across anything worth knowing, come tell me about it, will you?"
                - flag player avery_met:1
            - clickable save:continue1 until:2m:
                - narrate "<bold>Avery:<reset> I followed along with you brave adventurers to this new realm because I heard rumor of some new magic worth discovering."
                - narrate <&lb><&2><element[Continue].on_click[<entry[continue2].command>]><reset><&rb>
            - narrate "<bold>Avery:<reset> Hello, <player.display_name>! Good to see you!"
            - wait 1s
            - narrate "<bold>Avery:<reset> Forgive me if we've met before, dimensional travel tends to dislodge some memories. My name is Avery Evencrest, a wizard and a traveler, and hopefully your new friend!"
            - narrate <&lb><&2><element[Continue].on_click[<entry[continue1].command>]><reset><&rb>
        - else:
            - define discoveries <proc[cc_discoverable_areas_get_player_discoveries].context[<player>]>
            - if <[discoveries].size.is_more_than_or_equal_to[2]> and <player.has_flag[avery_wellknown].not>:
                - narrate "<bold>Avery:<reset> <player.display_name>! I see you've been out exploring. You've found some wonderous things! We're going to send some more folks out to look into it. We might have some special requests for you soon, so make sure to check back in!"
                - flag player avery_wellknown:1
                - stop
            - random:
                - narrate "<bold>Avery:<reset> Ah hello there <player.display_name>! How are you this fine day?"
                - narrate "<bold>Avery:<reset> <player.display_name>! I hope you're well today"
                - narrate "<bold>Avery:<reset> Well if it isn't <player.display_name>! Been on any good adventures lately?"
