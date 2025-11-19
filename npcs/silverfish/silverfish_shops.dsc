#cc_npc_capitolsmith_a:
#    type: assignment
#    actions:
#        on assignment:
#         trigger name:click state:true
#    interact scripts:
#     cc_npc_capitolsmith_i

nikto_shop:
    type: task
    script:
        - random:
            - narrate "<bold>Nikto:<reset> <player.name> returns!"
            - narrate "<bold>Nikto:<reset> I's thank you again for finding Barada."
            - narrate "<bold>Nikto:<reset> Klaatu grumpy always, friend <player.name> no worry."
            - narrate "<bold>Nikto:<reset> Greeting, <player.name>!"
            - narrate "<bold>Nikto:<reset> Welcome back, <player.name>!"
            - narrate "<bold>Nikto:<reset> See what I's has gathered, friend!"
            - narrate "<bold>Nikto:<reset> I's always joyous when <player.name> stop by!"
        - wait 1s
        - if <player.has_flag[nikto_cooldown]>:
            - narrate "<bold>Nikto:<reset> Sorry friend, I can only trade with you every other day."
            - wait 1s
            - narrate "<&7>You may trade with Nikto again in <player.flag_expiration[nikto_cooldown].from_now.formatted>"
            - stop
        - else:
            - narrate "Sherds? Or.. Buds?"
            - clickable silverfish_sherds save:sherds
            - clickable silverfish_buds save:buds
            - narrate "<&7><element[<&lb><green>Sherds<&7><&rb>].on_click[<entry[sherds].command>]> <&7>or <element[<&lb><green>Buds<&7><&rb>].on_click[<entry[buds].command>]>"

silverfish_sherds:
    type: task
    script:
        - opentrades <script[nikto_voucher_trades].data_key[trades]> title:Nikto

silverfish_buds:
    type: task
    script:
        - flag player nikto_cooldown:1 expire:2d
        - opentrades <script[nikto_shop_trades].data_key[trades]> title:Nikto

nikto_shop_trades:
    type: data
    trades:
        - trade[max_uses=1000;inputs=sherd_voucher[quantity=2];result=budding_amethyst[quantity=2];has_xp=false]
        - trade[max_uses=1000;inputs=sherd_voucher[quantity=16];result=budding_amethyst[quantity=4];has_xp=false]
        - trade[max_uses=1000;inputs=sherd_voucher[quantity=32];result=budding_amethyst[quantity=8];has_xp=false]
        - trade[max_uses=1;inputs=dragon_egg[quantity=1];result=budding_amethyst[quantity=32];has_xp=false]

nikto_voucher_trades:
    type: data
    trades:
        - trade[max_uses=1000;inputs=angler_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=archer_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=arms_up_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=blade_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=brewer_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=burn_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=danger_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=explorer_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=flow_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=friend_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=guster_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=heart_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=heartbreak_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=howl_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=miner_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=mourner_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=plenty_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=prize_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=scrape_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=sheaf_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=shelter_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=skull_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]
        - trade[max_uses=1000;inputs=snort_pottery_sherd[quantity=1];result=sherd_voucher[quantity=1];has_xp=false]

klaatu_shop:
    type: task
    script:
        - random:
            - narrate "<bold>Klaatu:<reset> I's no like <player.name>, hurry then go."
            - narrate "<bold>Klaatu:<reset> What <player.name> want?"
            - narrate "<bold>Klaatu:<reset> Sks'tc cksh kskchk!"
            - narrate "<bold>Klaatu:<reset> Hmm?"
            - narrate "<bold>Klaatu:<reset> Hurry now."
            - narrate "<bold>Klaatu:<reset> ...more?"
            - narrate "<bold>Klaatu:<reset> What <player.name> want now?"
        - wait 1s
        - if <player.has_flag[klaatu_cooldown]>:
            - narrate "<bold>Klaatu:<reset> Sorry <player.name>, I will only trade with you every other day."
            - wait 1s
            - narrate "<&7>You may trade with Klaatu again in <player.flag_expiration[klaatu_cooldown].from_now.formatted>"
            - stop
        - else:
            - flag player klaatu_cooldown:1 expire:2d
            - opentrades <script[klaatu_shop_trades].data_key[trades]> title:Klaatu

klaatu_shop_trades:
    type: data
    trades:
        - trade[max_uses=1000;inputs=nether_gold_ore[quantity=32];result=brown_mushroom[quantity=32];has_xp=false]
        - trade[max_uses=1000;inputs=calcite[quantity=32];result=red_mushroom[quantity=32];has_xp=false]
        - trade[max_uses=1000;inputs=redstone_ore[quantity=16];result=warped_fungus[quantity=32];has_xp=false]
        - trade[max_uses=1000;inputs=spore_blossom[quantity=8];result=crimson_fungus[quantity=32];has_xp=false]

sherd_voucher:
    type: item
    material: paper
    mechanisms:
        custom_model_data: 6001
    display name: <&6>Sherd Voucher<&r>
    allow in material recipes: false


nikto_shop_debug:
    type: command
    description: Nikto Shop Debug.
    permission: cc.nikotoshop
    name: niktoshop
    usage: /niktoshop
    script:
        - flag player nikto_cooldown:!
        - narrate "<&7>Nikto Shop Flags Cleared"
        - run nikto_shop

klaatu_shop_debug:
    type: command
    description: Klaatu Shop Debug.
    permission: cc.klaatushop
    name: klaatushop
    usage: /klaatushop
    script:
        - flag player klaatu_cooldown:!
        - narrate "<&7>Klaatu Shop Flags Cleared"
        - run klaatu_shop