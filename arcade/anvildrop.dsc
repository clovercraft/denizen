cc_arcade_anvil_reset:
    type: task
    script:
        - define east_south l@-1152,74,511,onlyspruce
        - define east_north l@-1152,84,504,onlyspruce
        - define east_wall <location[<[east_south]>].to_cuboid[<[east_north]>]>
        - define west_south l@-1163,74,511,onlyspruce
        - define west_north l@-1136,84,504,onlyspruce
        - define west_wall <location[<[west_south]>].to_cuboid[<[west_north]>]>
        # find the air blocks
        - define east_air <[east_wall].blocks[air]>
        - define west_air <[west_wall].blocks[air]>
        # set anvils
        - foreach <[east_air]> as:location:
            - modifyblock <[location]> anvil
        - foreach <[west_air]> as:location:
            - modifyblock <[location]> anvil