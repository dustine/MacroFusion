local fluid = {
  type = "fluid",
  name = "macro-fusion-deuterium-oxide",
  default_temperature = 25,
  heat_capacity = "0.1KJ",
  base_color = {r=0.000, g=0.800, b=1.000},
  flow_color = {r=1.000, g=1.000, b=1.000},
  -- flow_color = {r=0.365, g=0.780, b=0.937}, -- #D7EDF9
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
  -- icons = {{icon= "__base__/graphics/icons/fluid/water.png", tint={r=0, g=1, b=1, a=1}}}, -- water icon with #00ffffff (cyan) tint
  energy_required = 12,
  enabled = false,
  ingredients =
  {
    {type="fluid", name="water", amount=10000},
    {type="fluid", name="macro-fusion-hydrogen-sulfide", amount=200},
  },
  results=
  {
    {type="fluid", name="macro-fusion-deuterium-oxide", probability=2/69, amount=1},
    {type="fluid", name="macro-fusion-hydrogen-sulfide", amount=199},
    -- based on real world numbers: D/H is 156 ppm, industrial production 340k to get 1 ton heavy so 1.7% efficiency
    -- so for 10000 stuff, you'd expect 1.7 but you'd get 1.70% of that, so 2.89%~=2/69
    -- previous (flawed) math gave me 1/34~=2.94% so i have a soft spot between those two
  },
  subgroup = "fluid-recipes",
  crafting_machine_tint =
  {
    primary = {r=0.000, g=1.000, b=1.000, a=0.000}, -- cyan
    secondary = {r=0.000, g=0.340, b=0.600, a=0.000}, -- water
    tertiary = {r=1.000, g=0.750, b=0.500, a=0.000}, -- white-yellow
  },
  main_product = "macro-fusion-deuterium-oxide"
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