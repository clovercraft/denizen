cc_quest_harold_w:
    type: world
    events:
        on player enters harold_quest_bandit_camp:
            - if <player.has_flag[harold_state]> && <player.flag[harold_state]> == accepted:
                - run cc_quest_harold_bandits_spawn
        on player right clicks mule in:harold_quest_bandit_camp:
            - if <player.has_flag[harold_state]> && <player.flag[harold_state]> == combat:
                - run cc_quest_harold_mule_interact
        on player right clicks barrel in:harold_quest_bandit_camp:
            - if <player.has_flag[harold_state]> && <player.flag[harold_state]> == combat:
                - run cc_quest_harold_supplies_interact
        on player consumes cc_quest_harold_sugarbread:
            - run cc_quest_harold_sugarbread_effect

cc_quest_harold_intro:
    type: task
    definitions: __player
    script:
        - narrate "I was on my way home to Nifton after getting supplies in Silanah, but was ambushed. They took my goods, but more importantly, my beloved Penelopy. If you could rescue her and bring back my trade goods, I would be forever grateful!"
        - clickable save:click_yes:
            - narrate "Thank you so much! I saw them going into that camp to the east."
            - narrate "The gates seem to open with some sort of mechanism to do with the training dummy, but I didn't dare go close enough to see how exactly."
            - flag player harold_state:accepted
        - narrate "[<green><element[Accept Quest].on_click[<entry[click_yes].command>]><reset>]"

cc_quest_harold_check:
    type: task
    definitions: __player
    script:
        - if <player.has_flag[harold_mule]> && <player.has_flag[harold_supplies]>:
            - narrate "You're truely a hero! Thank you so much! Here take this sugarbread as a token of my gratidute, it's my grandmothers recipe"
            - give cc_quest_harold_sugarbread quantity:16
            - flag <player> harold_state:complete
            - stop
        - if <player.has_flag[harold_mule]> && not <player.has_flag[harold_supplies]>:
            - narrate "You have my thanks! I couldn't live without her! But all my life-savings are put into those trade goods, I would appreciate it if I could get those back as well."
            - stop
        - if <player.has_flag[harold_supplies]> && not <player.has_flag[harold_mule]>:
            - narrate "Thank you, but I don't know what I'd do without my Penelopy, could you rescue her?"
            - stop

cc_quest_harold_bandits_spawn:
    type: task
    definitions: __player
    script:
        - flag player harold_state:combat
        - spawn pillager 'l@-775,72,1645,world' persistent
        - spawn pillager 'l@-779,72,1635,world' persistent
        - spawn pillager 'l@-781,72,1632,world' persistent
        - spawn vindicator 'l@-773,72,1646,world' persistent
        - spawn vindicator 'l@-775,72,1632,world' persistent

cc_quest_harold_mule_interact:
    type: task
    definitions: __player
    script:
        - if not <player.has_flag[harold_mule]>:
            - narrate "The mule seems thankful, and with the bandits defeated will now make her way back to Harold."
            - flag player harold_mule:1
            - determine cancelled

cc_quest_harold_supplies_interact:
    type: task
    definitions: __player
    script:
        - if not <player.has_flag[harold_supplies]>:
            - narrate "You find a pack of travel supplies and trade goods in the barrel, these must be Harold's"
            - flag player harold_supplies:1
            - determine cancelled

cc_quest_harold_sugarbread:
    type: item
    material: bread
    display name: Sugarbread
    lore:
        - just like harolds
        - grandmother made it

cc_quest_harold_sugarbread_effect:
    type: task
    definitions: __player
    script:
        - cast glowing duration:2m
        - cast speed duration:2m amplifier:1 hide_particles

cc_quest_harold_trade:
    type: task
    definitions: __player
    script:
        - narrate "Thank you so much for your help! Did you want to purchase more sugarbread?"
        - opentrades <script[cc_quest_harold_trades].data_key[trades]> title:Harold players:<player>

cc_quest_harold_trades:
    type: data
    trades:
        - trade[max_uses=2;inputs=emerald[quantity=8];result=cc_quest_harold_sugarbread[quantity=2];has_xp=false]