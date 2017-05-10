local entity = {
  type = "furnace",
  name = "macro-fusion-cryoliquefier",
  icon = "__MacroFusion__/graphics/entities/cryoliquefier-icon.png",
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {mining_time = 1, result = "macro-fusion-cryoliquefier"},
  max_health = 100,
  fast_replaceable_group = "macro-fusion-cryoliquefier",
  corpse = "medium-remnants",
  collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
  selection_box = {{-2, -2}, {2, 2}},
  crafting_categories = {"macro-fusion-cryogenics"},
  -- mode = "output-to-separate-pipe",
  module_specification = {
    module_slots = 3,
    -- module_info_icon_shift = {0, 0.8}
  },
  allowed_effects = {"consumption", "speed", "pollution"},
  source_inventory_size = 0,
  result_inventory_size = 1,
  crafting_speed = 1,
  resistances ={{
    type = "fire",
    percent = 80
  },{
    type = "explosion",
    percent = 30
  }},
  fluid_boxes = {{
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    base_area = 4,
    base_level = -1,
    pipe_connections = {{
      type="input", position = {-1.5, -2.5}
    },{
      type="input", position = {2.5, -1.5}
    }}
  },{
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    base_area = 4,
    base_level = 1,
    pipe_connections = {{position = {0.5, 2.5}}}
  }},
  energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 10
  },
  energy_usage = "30kW",
  animation = make_4way_animation_from_spritesheet({
    filename = "__MacroFusion__/graphics/entities/cryoliquefier.png",
      width = 32*4,
      height = 32*4,
      frame_count = 1,
      line_length = 1,
      -- shift = util.by_pixel(0, -8)
      -- animation_speed = 0.5
  }),
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
  open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
  close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
}

local coolant = {
  type = "fluid",
  name = "macro-fusion-liquid-nitrogen",
  default_temperature = -210, -- more like minimum
  max_temperature = -195,
  heat_capacity = "0.2KJ",
  base_color = {r=0.7, g=0.7, b=1.0},
  flow_color = {r=1.0, g=1.0, b=1.0},
  icon = "__MacroFusion__/graphics/fluids/liquid-nitrogen.png",
  order = "a[fluid]-z[mods]MacroFusion-d[liquid-nitrogen]",
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
}

local precursor = {
  type = "fluid",
  name = "macro-fusion-just-nitrogen",
  default_temperature = 15, -- more like minimum
  max_temperature = 1000,
  heat_capacity = "0.2KJ",
  icon = "__MacroFusion__/graphics/fluids/just-nitrogen.png",
  order = "a[fluid]-z[mods]MacroFusion-d[liquid-nitrogen]",
  base_color = {r=1.0, g=1.0, b=1.0, a=1.0},
  flow_color = {r=1.0, g=1.0, b=1.0},
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
  gas_temperature = 15
}

local item = {
  type = "item",
  name = "macro-fusion-cryoliquefier",
  icons = {{
    icon = "__base__/graphics/icons/assembling-machine-2.png"
  },{
    icon = "__MacroFusion__/graphics/entities/cryoliquefier-icon.png",
    shift = {0, -4},
    scale = 0.75
  }},
  flags = {"goes-to-quickbar"},
  subgroup = "production-machine",
  order = "zMacroFusion",
  place_result = "macro-fusion-cryoliquefier",
  stack_size = 50,
}

local recipe = {
  type = "recipe",
  name = "macro-fusion-cryoliquefier",
  category = "crafting",
  energy_required = "20",
  enabled = false,
  ingredients = {{
    type = "item", name = "steel-plate", amount = 200
  }},
  result = "macro-fusion-cryoliquefier"
}

local precursor_recipe = {
  type = "recipe",
  name = "macro-fusion-just-nitrogen",
  -- icon = "__MacroFusion__/graphics/fluids/just-nitrogen.png",
  -- localised_name = "recipe-name.macro-fusion-nitrogen",
  category = "crafting-with-fluid",
  sub_category = "chemistry",
  energy_required = "3",
  enabled = false,
  ingredients = {},
  results = {{type = "fluid", name = "macro-fusion-just-nitrogen", amount = 20}}
}

local coolant_recipe = {
  type = "recipe",
  name = "macro-fusion-liquid-nitrogen",
  category = "macro-fusion-cryogenics",
  energy_required = "20",
  enabled = true,
  hidden = true,
  ingredients = {{type = "fluid", name = "macro-fusion-just-nitrogen", amount = 50}},
  results = {{type = "fluid", name = "macro-fusion-liquid-nitrogen", amount = 50}}
}

local technology = {
  type = "technology",
  name = "macro-fusion-cryoliquefier",
  icon = "__base__/graphics/technology/combat-robotics.png",
  effects = {{
    type = "unlock-recipe",
    recipe = "macro-fusion-cryoliquefier"
  },{
    type = "unlock-recipe",
    recipe = "macro-fusion-just-nitrogen"
  }},
  prerequisites = {"rocket-silo"},
  unit =
  {
    count = 1000,
    ingredients =
    {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
      {"production-science-pack", 1},
      {"high-tech-science-pack", 1},
      {"space-science-pack", 1}
    },
    time = 30
  },
  order = "zMacroFusion-a-a"
}

local recipe_category = {
  type = "recipe-category",
  name = "macro-fusion-cryogenics"
}

data:extend {entity, precursor, coolant, item, recipe, precursor_recipe, coolant_recipe, technology, recipe_category}