roll:
    type: command
    debug: false
    description: roll a die in ndX[+y] format
    name: roll
    usage: /roll ndX[+y]
    aliases:
    - dice
    - rolldice
    - diceroll
    tab completions:
        1: 1d20|1d6|1d4|1d8|1d10|1d12|1d100
    script:
    - if <context.args.size> < 1:
        - narrate "<red>Sorry, you need to specify a die roll."
        - narrate "Usage: <yellow>/roll ndX[+y]<reset>"
        - stop

    - define roll <context.args.get[1]>
    - define dice <[roll].before[d]>
    - define sides <[roll].after[d]>
    - define modifier 0
    - if <[sides].contains[+]>:
        - define sides <[sides].before[+]>
        - define modifier <[roll].after[+]>

    - if !<[dice].is_integer> || !<[sides].is_integer> || !<[modifier].is_integer>:
        - narrate "<red>Sorry, but you need to specify a whole number."
        - narrate "Usage: <yellow>/roll ndX[+y]<reset>"
        - stop

    - define total 0
    - repeat <[dice]>:
        - define total <[total].add[<util.random.int[1].to[<[sides]>]>]>
    - define total <[total].add[<[modifier]>]>
    - narrate "<yellow><[roll]> = <[total]><reset>"
    - debug log "<player> rolled: <[roll]> = <[total]>"
    - stop
