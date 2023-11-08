cc_hide_seek:
    type: command
    debug: false
    name: hide-seek
    description: Hide & Seek game command. See help for sub-commands.
    usage: /hide-seek <&lt>action<&gt>
    aliases:
        - hs
    tab completions:
        1: join|leave|start|end|help|list
    script:
        - if <context.args.size> == 0:
            - run cc_hide_seek_help
            - stop
        - choose <context.args.first>:
            - case join:
                - run cc_hide_seek_join
            - case leave:
                - run cc_hide_seek_leave
            - case start:
                - run cc_hide_seek_start
            - case end:
                - run cc_hide_seek_end
            - case list:
                - run cc_hide_seek_list
            # - case help:
            - default:
                - run cc_hide_seek_help

cc_hide_seek_help:
    type: procedure
    debug: false
    script:
        - narrate "<yellow>Hide & Seek Help"
        - narrate "<yellow>/hide-seek join  - Join the Hide & Seek match."
        - narrate "<yellow>/hide-seek leave - Leave the Hide & Seek match."
        - narrate "<yellow>/hide-seek start - Start the Hide & Seek match."
        - narrate "<yellow>/hide-seek end   - End the Hide & Seek match."
        - narrate "<yellow>/hide-seek help  - Show this help message."
        - narrate "<yellow>/hide-seek list  - List all players in the match."

