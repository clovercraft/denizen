cc_util_get_cuboid_p:
    type: procedure
    definitions: start|size
    script:
        - define sub_amount <[size].div[2]>
        - define add_amount <[size].mul[2]>
        - define start_x <[start].x.sub[<[sub_amount]>]>
        - define start_z <[start].z.sub[<[sub_amount]>]>
        - define start_y <[start].y.sub[<[sub_amount]>]>
        - define end_x <[start_x].add[<[add_amount]>]>
        - define end_z <[start_z].add[<[add_amount]>]>
        - define end_y <[start_y].add[<[add_amount]>]>
        - define cube "cu@world,<[start_x]>,<[start_y]>,<[start_z]>,<[end_x]>,<[end_y]>,<[end_z]>"
        - determine <[cube]>