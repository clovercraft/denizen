teebeedee_assignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run teebeedee_interact


teebeedee_interact:
    type: task
    script:
        - if <player.has_flag[teebeedee_met].not>:
            - narrate "<bold>TeeBeeDee:<reset> Greetings, traveler, to my humble abode."
            - wait 2s
            - narrate "<bold>TeeBeeDee:<reset> You may call me TeeBeeDee. I am the litch king of this monastery, and that which lies within."
            - wait 2s
            - narrate "<bold>TeeBeeDee:<reset> I've lived here for many, many years now, but I am not naive enough to believe I have uncovered all its secrets."
            - wait 2s
            - narrate "<bold>TeeBeeDee:<reset> Tread lightly, and with respect. The dead act upon my whim."
            - flag player teebeedee_met:1
        - else:
            - narrate "<bold>TeeBeeDee:<reset> Greetings once more, traveler."