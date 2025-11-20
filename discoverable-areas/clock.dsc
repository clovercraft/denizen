cc_discoverable_areas:
    type: world
    events:
        after player enters meagles_nest:
            - run cc_discoverable_areas_on_discover def:<player>|<element[The Magpie Eagle Nests]>|meagles_nest|egg
        after player enters hidden_grove:
            - run cc_discoverable_areas_on_discover def:<player>|<element[The Hidden Grove]>|hidden_grove|fox_spawn_egg
        after player enters silverfish_caves:
            - run cc_discoverable_areas_on_discover def:<player>|<element[The Silverfish Caves]>|silverfish_caves|amethyst_cluster
        after player enters abandoned_village:
            - run cc_discoverable_areas_on_discover def:<player>|<element[The Abandoned Village]>|abandoned_village|cobweb