local timeout = 60 * 10
local range = 6.5

local scorchmark = {
  type = "corpse",
  name = "macro-fusion-cryogrenade-scorchmark",
  icon = "__base__/graphics/icons/small-scorchmark.png",
  flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
  collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
  collision_mask = {"doodad-layer", "not-colliding-with-itself"},
  selection_box = {{-1, -1}, {1, 1}},
  selectable_in_game = false,
  -- time_before_removed = 60 * 60 * 2, -- 2 minutes (effect time)
  time_before_removed = timeout,
  final_render_layer = "ground_patch_higher2",
  subgroup = "remnants",
  order="d[remnants]-b[scorchmark]-zMacroFusion-a[freeze]",
  animation =
  {
    width = 208,
    height = 208,
    frame_count = 1,
    direction_count = 1,
    filename = "__MacroFusion__/graphics/entities/cryogrenade/scorchmark.png",
    variation_count = 1
  },
  -- ground_patch =
  -- {
  --   sheet =
  --   {
  --     width = 110,
  --     height = 90,
  --     frame_count = 1,
  --     direction_count = 1,
  --     x = 110 * 2,
  --     filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png",
  --     variation_count = 3
  --   }
  -- },
  -- ground_patch_higher =
  -- {
  --   sheet =
  --   {
  --     width = 110,
  --     height = 90,
  --     frame_count = 1,
  --     direction_count = 1,
  --     x = 110,
  --     filename = "__base__/graphics/entity/scorchmark/small-scorchmark.png",
  --     variation_count = 3
  --   }
  -- }
}

local start_script = {
  type = "combat-robot",
  name = "macro-fusion-cryogrenade-start-script",
  render_layer = "smoke",
  icon = "__base__/graphics/icons/steel-chest.png",
  flags = {"placeable-player", "player-creation", "not-on-map", "placeable-off-grid"},
  selectable_in_game = false,
  follows_player = false,
  order = "s-e-w-f",
  collision_box = {{0,0},{0,0}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  speed = 0,
  time_to_live = timeout,
  destroy_action = {
    type = "direct",
    action_delivery = {
      type = "instant",
      source_effects = {
        type = "create-entity",
        entity_name = "macro-fusion-cryogrenade-end-script",
        trigger_created_entity = true
      }
    }
  },
  attack_parameters = {
    type = "projectile",
    ammo_category = "combat-robot-laser",
    cooldown = 1,
    -- damage_modifier = 1.5,
    projectile_center = {0, 0},
    -- projectile_creation_distance = 0.6,
    range = range/2,
    -- sound = make_laser_sounds(),
    ammo_type = {
      category = "combat-robot-laser",
      action = {
        type = "direct",
        force = "all",
        action_delivery = {
          type = "instant",
          target_effects = {{
            type = "create-sticker",
            sticker = "slowdown-sticker"
          }}
        }
      }
    }
  },
  idle = {
    layers = {{
      filename = "__base__/graphics/entity/distractor-robot/distractor-robot.png",
      priority = "high",
      line_length = 16,
      width = 38,
      height = 33,
      frame_count = 1,
      direction_count = 16,
      shift = {0, -0.078125}
    },{
      filename = "__base__/graphics/entity/distractor-robot/distractor-robot-mask.png",
      priority = "high",
      line_length = 16,
      width = 24,
      height = 21,
      frame_count = 1,
      direction_count = 16,
      shift = {0, -0.203125},
      apply_runtime_tint = true
    }}
  },
  shadow_idle = {
    filename = "__base__/graphics/entity/distractor-robot/distractor-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 40,
    height = 25,
    frame_count = 1,
    direction_count = 16,
    shift = {0.9375, 0.609375}
  },
  in_motion = {
    layers = {{
      filename = "__base__/graphics/entity/distractor-robot/distractor-robot.png",
      priority = "high",
      line_length = 16,
      width = 38,
      height = 33,
      frame_count = 1,
      direction_count = 16,
      shift = {0, -0.078125},
      y = 33
    },{
      filename = "__base__/graphics/entity/distractor-robot/distractor-robot-mask.png",
      priority = "high",
      line_length = 16,
      width = 24,
      height = 21,
      frame_count = 1,
      direction_count = 16,
      shift = {0, -0.203125},
      apply_runtime_tint = true,
      y = 21
    }}
  },
  shadow_in_motion = {
    filename = "__base__/graphics/entity/distractor-robot/distractor-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 40,
    height = 25,
    frame_count = 1,
    direction_count = 16,
    shift = {0.9375, 0.609375}
  }
}

local flag_script = {
  type = "simple-entity-with-force",
  name = "macro-fusion-cryogrenade-flag-script",
  render_layer = "smoke",
  icon = "__base__/graphics/icons/steel-chest.png",
  flags = {},
  order = "s-e-w-f",
  collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  collision_mask = {},
  picture =
  {
    filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
    priority = "extra-high",
    width = 46,
    height = 33,
    shift = {0.25, 0.015625},
    tint = {r=0, g=1, b=0, a=1}
  }
}

local end_script = {
  type = "simple-entity-with-force",
  name = "macro-fusion-cryogrenade-end-script",
  render_layer = "smoke",
  icon = "__base__/graphics/icons/steel-chest.png",
  flags = {},
  order = "s-e-w-f",
  collision_box = {{0,0}, {0,0}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  picture =
  {
    filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
    priority = "extra-high",
    width = 46,
    height = 33,
    shift = {0.25, 0.015625},
    tint = {r=1, g=0, b=0, a=1}
  }
}

local entity = {
  type = "projectile",
  name = "macro-fusion-cryogrenade",
  flags = {"not-on-map"},
  acceleration = 0.005,
  action = {{
    type = "direct",
    action_delivery = {
      type = "instant",
      target_effects = {{
        type = "create-entity",
        entity_name = "macro-fusion-cryogrenade-start-script",
        trigger_created_entity = true
      },{
        type = "create-entity",
        entity_name = "macro-fusion-cryogrenade-scorchmark"
      }}
    }
  },{
    type = "area",
    perimeter = range/2,
    force = "all",
    action_delivery = {
      type = "instant",
      target_effects = {{
        type = "create-entity",
        entity_name = "macro-fusion-cryogrenade-flag-script",
        trigger_created_entity = true
      }}
    }
  }},
  light = {intensity = 0.5, size = 4},
  animation = {
    filename = "__base__/graphics/entity/grenade/grenade.png",
    frame_count = 1,
    width = 24,
    height = 24,
    priority = "high",
    tint = {r= 0, g=1, b=1, a=1}
  },
  shadow = {
    filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
    frame_count = 1,
    width = 24,
    height = 24,
    priority = "high"
  }
}

local item = {
  type = "capsule",
  name = "macro-fusion-cryogrenade",
  icons = {{icon="__base__/graphics/icons/grenade.png", tint={r= 0, g=1, b=1, a=1}}},
  flags = {"goes-to-quickbar"},
  capsule_action =
  {
    type = "throw",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "grenade",
      cooldown = 30,
      projectile_creation_distance = 0.6,
      range = 15,
      ammo_type =
      {
        category = "grenade",
        target_type = "position",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "macro-fusion-cryogrenade",
            starting_speed = 0.3
          }
        }
      }
    }
  },
  subgroup = "capsule",
  order = "a[grenade]-zMacroFusion-a[cryogrenade]",
  stack_size = 100
}

local recipe = {
  type = "recipe",
  name = "macro-fusion-cryogrenade",
  enabled = true,
  energy_required = 8,
  ingredients ={},
  result = "macro-fusion-cryogrenade"
}

data:extend {scorchmark, start_script, flag_script, end_script, entity, item, recipe}