local fluid = {
  type = "fluid",
  name = "macro-fusion-deuterium-oxide",
  default_temperature = 25,
  heat_capacity = "0.1KJ",
  base_color = {r=0.000, g=0.650, b=0.800},
  flow_color = {r=0.000, g=1.000, b=1.000},
  max_temperature = 100,
  icons = {{icon= "__base__/graphics/icons/fluid/water.png", tint={r=0, g=1, b=1, a=1}}}, -- water icon with #00ffffff (cyan) tint
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
  order = "a[fluid]-z[mods]MacroFusion-c[deuterium-oxide]"
}

local recipe = {
  type = "recipe",
  name = "macro-fusion-deuterium-oxide",
  category = "chemistry",
  icons = {{icon= "__base__/graphics/icons/fluid/water.png", tint={r=0, g=1, b=1, a=1}}}, -- water icon with #00ffffff (cyan) tint
  energy_required = 12,
  enabled = false,
  ingredients =
  {
    {type="fluid", name="macro-fusion-hydrogen-sulfide", amount=200},
    {type="fluid", name="water", amount=10000}
  },
  results=
  {
    {type="fluid", name="macro-fusion-hydrogen-sulfide", amount=180},
    {type="fluid", name="macro-fusion-deuterium-oxide", probability=0.016, amount=2},
    -- based on real world numbers: 180 ppm (in salt water), with best-case production usually taking 340k to get 1
  },
  subgroup = "fluid-recipes",
  crafting_machine_tint =
  {
    primary = {r=0.000, g=1.000, b=1.000, a=0.000}, -- cyan
    secondary = {r=0.000, g=0.340, b=0.600, a=0.000}, -- water
    tertiary = {r=0.500, g=0.500, b=0.250, a=0.000}, -- white-yellow
  },
  main_ingredient = "macro-fusion-deuterium-oxide"
}

local technology = {
  type = "technology",
  name = "macro-fusion-deuterium-oxide",
  icon = "__base__/graphics/technology/combat-robotics.png",
  effects = {{
    type = "unlock-recipe",
    recipe = "macro-fusion-deuterium-oxide"
  }},
  prerequisites = {"sulfur-processing"},
  unit =
  {
    count = 500,
    ingredients =
    {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
      {"science-pack-3", 1},
      {"production-science-pack", 1},
      {"high-tech-science-pack", 1}
    },
    time = 30
  },
  order = "d-d-a"
}

data:extend{fluid, recipe, technology}