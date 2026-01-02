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
        - define player_state <proc[avery_player_state_machine]>
        - choose <[player_state]>:
            - case unknown:
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
                - stop
            - case sick:
                - narrate "<bold>Avery:<reset> Say, <player.display_name>, are you feeling alright? You look like you've seen a ghost! Or maybe you ate something a bit off?"
                - flag player avery_last_sick_level:<player.flag[isolation_sickness]>
                - stop
            - case cursed:
                - clickable save:told until:2m:
                    - narrate "<bold>Avery:<reset> Oh my. That's very troubling...I would recommend staying far away from that place. We'll try to learn more."
                    - wait 2s
                    - narrate "<bold>Avery:<reset> I'll send word when we have more information."
                    - flag player avery_isolation_informant:1
                    - flag player avery_curse_mentioned:1
                - clickable save:lied until:2m:
                    - narrate "<bold>Avery:<reset> ..."
                    - wait 1s
                    - narrate "<bold>Avery:<reset> Well, if you're certain. Stay safe out there adventurer."
                    - flag player avery_curse_mentioned:1 expire:3d
                - narrate "<bold>Avery:<reset> Oh dear. <player.display_name>, I think something might be terribly wrong. I...Can you tell me if you've seen anything odd lately?"
                - wait 1s
                - narrate "<&lb><&2><element[Tell Avery about the strange darkness].on_click[<entry[told].command>]><reset><&rb>"
                - narrate "<&lb><dark_red><element[Tell Avery you haven't seen anything].on_click[<entry[lied].command>]><reset><&rb>"
            - case met:
                - random:
                    - narrate "<bold>Avery:<reset> Ah hello there <player.display_name>! How are you this fine day?"
                    - narrate "<bold>Avery:<reset> <player.display_name>! I hope you're well today"
                    - narrate "<bold>Avery:<reset> Well if it isn't <player.display_name>! Been on any good adventures lately?"
                - stop
            - case discovery:
                - narrate "<bold>Avery:<reset> <player.display_name>! I see you've been out exploring. You've found some wonderous things! We're going to send some more folks out to look into it. We might have some special requests for you soon, so make sure to check back in!"
                - flag player avery_wellknown:1
                - stop
            - case well_known:
                - narrate "<bold>Avery:<reset> It's good to see you again, <player.display_name>"

avery_player_state_machine:
    type: procedure
    script:
        - define discoveries <proc[cc_discoverable_areas_get_player_discoveries].context[<player>]>
        - define met <player.has_flag[avery_met]>
        - define well_known <player.has_flag[avery_wellknown]>
        - define sick <player.has_flag[isolation_sickness]>
        - define cursed <player.has_flag[isolation_cursed]>
        # First thing, check for significant increase in isolation sickness. Avery will behave differently in this case.
        - if <[cursed]> && <player.has_flag[avery_curse_mentioned].not>:
            - determine cursed
        - if <[sick]> and <[cursed].not>:
            - define last_sickness 0
            - if <player.has_flag[avery_last_sick_level]>:
                - define last_sickness <player.flag[avery_last_sick_level]>
            - define sick_level <player.flag[isolation_sickness]>
            - if <[sick_level].sub[<[last_sickness]>].is_more_than_or_equal_to[3]>:
                - determine sick
        - if <[met].not>:
            - determine unknown
        - if <[met]> and <[well_known].not> and <[discoveries].size.is_less_than[2]>:
            - determine met
        - if <[met]> and <[well_known].not> and <[discoveries].size.is_more_than_or_equal_to[2]>:
            - determine discovery
        - if <[met]> and <[well_known]>:
            - determine well_known