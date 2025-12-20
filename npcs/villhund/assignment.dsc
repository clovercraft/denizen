villhund_assignment:
    type: assignment
    actions:
        on assignment:
        - trigger name:click state:true
        on click:
        - run villhund_info

villhund_info:
    type: task
    script:
        - narrate "The creature before you emits a series of growls and whines; it's clear to you by the cadence that it's attempting communication, but the message elludes you..."
        - if <player.has_flag[villhund_met].not>:
            - flag player villhund_met:1