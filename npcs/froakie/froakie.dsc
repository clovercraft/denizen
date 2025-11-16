froakie_assign:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run froakie_interact


froakie_interact:
    type: task
    script:
        - narrate "Your princess is in another castle."