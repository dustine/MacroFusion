local fluid = {
  type = "fluid",
  name = "macro-fusion-boric-acid",
  default_temperature = 25,
  heat_capacity = "0.1KJ",
  base_color = {r=1.000, g=0.698, b=0.694}, -- #ffb2b1
  flow_color = {r=1.000, g=0.894, b=0.894}, -- #ffe4e4
  max_temperature = 100,
  icon = "__MacroFusion__/graphics/fluids/boric-acid.png",
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
  order = "a[fluid]-z[mods]-MacroFusion-b[boric-acid]"
}

local recipe = {
  type = "recipe",
  name = "macro-fusion-boric-acid",
  category = "chemistry",
  energy_required = 10,
  enabled = false,
  ingredients =
  {
    {type="item", name="stone", amount=5},
    {type="fluid", name="water", amount=2000}
  },
  results=
  {
    {type="fluid", name="macro-fusion-boric-acid", amount=50}
  },
  subgroup = "fluid-recipes",
  crafting_machine_tint =
  {
    primary = {r=1.000, g=0.698, b=0.694, a=0.000}, -- #ffb2b100
    secondary = {r=1.000, g=1.000, b=1.000, a=0.000}, -- #ffffff00
    tertiary = {r=0.478, g=0.450, b=0.317, a=0.000}, -- #7a735100 (stone)
  }
}

-- TODO: add productivity

local technology = {
  type = "technology",
  name = "macro-fusion-boric-acid",
  icon = "__base__/graphics/technology/combat-robotics.png",
  effects = {{
    type = "unlock-recipe",
    recipe = "macro-fusion-boric-acid"
  }},
  prerequisites = {"oil-processing"},
  unit =
  {
    count = 300,
    ingredients =
    {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
      {"production-science-pack", 1}
    },
    time = 30
  },
  order = "d-d-a"
}

data:extend{fluid, recipe, technology}