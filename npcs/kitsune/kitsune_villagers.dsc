akari_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run akari_interact


akari_interact:
    type: task
    script:
        - random:
            - narrate "<bold>Akari:<reset> The veil thins when the sun kisses the horizon. Listen closely… they whisper your name."
            - narrate "<bold>Akari:<reset> I prefer the wind through fur over the weight of words."



hikari_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run hikari_interact


hikari_interact:
    type: task
    script:
        - random:
            - narrate "<bold>Hikari:<reset> Hey, want to race the sunrise? Bet I'll win—even with four legs tied!"
            - narrate "<bold>Hikari:<reset> Don't take Yuna too seriously—she likes to sound scary."


suzu_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run suzu_interact


suzu_interact:
    type: task
    script:
        - random:
            - narrate "<bold>Suzu:<reset> Every chime I make sings a blessing. Here, listen—this one hums for luck."
            - narrate "<bold>Suzu:<reset> Dont mention Kuro to Yuna.  She still cries at night about it."


rin_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run rin_interact


rin_interact:
    type: task
    script:
        - narrate "<bold>Rin:<reset> ..."
        - wait 5s
        - narrate "<bold>Rin:<reset> You move like prey. Relax—if I wanted you gone, you'd already be gone."


emi_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run emi_interact


emi_interact:
    type: task
    script:
        - random:
            - narrate "<bold>Emi:<reset> BOO! Haha—gotcha! Relax, I don't bite… much."
            - narrate "<bold>Emi:<reset> You're fun. Stay a while—maybe I'll teach you how to vanish in smoke."


naoko_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run naoko_interact


naoko_interact:
    type: task
    script:
        - random:
            - narrate "<bold>Naoko:<reset> Every lantern flame holds a wish. Want me to light one for you?"
            - narrate "<bold>Naoko:<reset> Foxfire burns bright only when the heart is pure."


takeshi_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run takeshi_interact


takeshi_interact:
    type: task
    script:
        - random:
            - narrate "<bold>Takeshi:<reset> Yuna's safety comes first. Tread carefully, stranger. Espcially after Kuro."
            - narrate "<bold>Takeshi:<reset> Don't mistake kindness here for weakness."


ren_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run ren_interact


ren_interact:
    type: task
    script:
        - random:
            - narrate "<bold>Ren:<reset> Fascinating… your hands are steady. Ever try writing runes?"
            - narrate "<bold>Ren:<reset> Knowledge is the sharpest fang."


aya_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run aya_interact


aya_interact:
    type: task
    script:
        - random:
            - narrate "<bold>Aya:<reset> You smell weird… like stone and rain! Are you from the caves?"
            - narrate "<bold>Aya:<reset> If you see Yuna, tell her I definitely wasn't chasing chickens again!"