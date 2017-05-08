local fluid = {
  type = "fluid",
  name = "macro-fusion-hydrogen-sulfide",
  default_temperature = 25,
  heat_capacity = "0.1KJ",
  base_color = {r=0.750, g=0.750, b=0.500}, -- #ffb2b1
  flow_color = {r=1.000, g=1.000, b=1.000}, -- #ffe4e4
  max_temperature = 100,
  icon = "__MacroFusion__/graphics/fluids/hydrogen-sulfide.png",
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
  order = "a[fluid]-z[mods]-MacroFusion-a[hydrogen-sulfide]"
}

local recipe = {
  type = "recipe",
  name = "macro-fusion-hydrogen-sulfide",
  category = "chemistry",
  energy_required = 3,
  enabled = false,
  ingredients =
  {
    {type="item", name="sulfur", amount=1},
    {type="fluid", name="water", amount=80}
  },
  results=
  {
    {type="fluid", name="macro-fusion-hydrogen-sulfide", amount=10}
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

table.insert(data.raw.technology["sulfur-processing"].effects, {
  type = "unlock-recipe",
  recipe = "macro-fusion-hydrogen-sulfide"
})

data:extend{fluid, recipe}