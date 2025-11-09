akari_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - akari_interact


akari_interact:
    type: interact
    steps:
        default*:
            click trigger:
                script:
                    - random:
                        - narrate "The veil thins when the sun kisses the horizon. Listen closely… they whisper your name."
                        - narrate "I prefer the wind through fur over the weight of words."



hikari_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - hikari_interact


hikari_interact:
    type: interact
    steps:
        default*:
            click trigger:
                script:
                    - random:
                        - narrate "Hey, want to race the sunrise? Bet I’ll win—even with four legs tied!"
                        - narrate "Don’t take Yuna too seriously—she likes to sound scary."


suzu_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - suzu_interact


suzu_interact:
    type: interact
    steps:
        default*:
            click trigger:
                script:
                    - random:
                        - narrate "Every chime I make sings a blessing. Here, listen—this one hums for luck."
                        - narrate "Careful near the grove pond, the koi there are… opinionated."


rin_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - rin_interact


rin_interact:
    type: interact
    steps:
        default*:
            click trigger:
                script:
                    - narrate "..."
                    - wait 5s
                    - narrate "You move like prey. Relax—if I wanted you gone, you’d already be gone."


emi_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - emi_interact


emi_interact:
    type: interact
    steps:
        default*:
            click trigger:
                script:
                    - random:
                        - narrate "BOO! Haha—gotcha! Relax, I don’t bite… much."
                        - narrate "You’re fun. Stay a while—maybe I’ll teach you how to vanish in smoke."


naoko_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - naoko_interact


naoko_interact:
    type: interact
    steps:
        default*:
            click trigger:
                script:
                    - random:
                        - narrate "Every lantern flame holds a wish. Want me to light one for you?"
                        - narrate "Foxfire burns bright only when the heart is pure."


takeshi_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - takeshi_interact


takeshi_interact:
    type: interact
    steps:
        default*:
            click trigger:
                script:
                    - random:
                        - narrate "Yuna’s safety comes first. Tread carefully, stranger."
                        - narrate "Don’t mistake kindness here for weakness."


ren_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - ren_interact


ren_interact:
    type: interact
    steps:
        default*:
            click trigger:
                script:
                    - random:
                        - narrate "Fascinating… your hands are steady. Ever try writing runes?"
                        - narrate "Knowledge is the sharpest fang."


aya_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
    interact scripts:
    - aya_interact


aya_interact:
    type: interact
    steps:
        default*:
            click trigger:
                script:
                    - random:
                        - narrate "You smell weird… like stone and rain! Are you from the caves?"
                        - narrate "If you see Yuna, tell her I definitely wasn’t chasing chickens again!"