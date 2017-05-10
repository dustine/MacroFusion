local fluid = {
  type = "fluid",
  name = "macro-fusion-liquid-nitrogen",
  default_temperature = -210, -- more like minimum
  max_temperature = 1000,
  heat_capacity = "0.2KJ",
  temperature_dependent =
  {
    {
      min = -195,
      localised_name = "fluid-name.macro-fusion-just-nitrogen",
    },
    {
      max = -195,
      localised_name = "fluid-name.macro-fusion-liquid-nitrogen",
      base_color = {r=0.7, g=0.7, b=1.0},
      flow_color = {r=0.7, g=0.7, b=0.7},
      icon = "__MacroFusion__/graphics/fluids/liquid-nitrogen.png",
    }
  },
  icon = "__MacroFusion__/graphics/fluids/just-nitrogen.png",
  base_color = {r=1.0, g=1.0, b=1.0, a=1.0},
  flow_color = {r=1.0, g=1.0, b=1.0},
  order = "a[fluid]-z[mods]MacroFusion-d[liquid-nitrogen]",
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
  gas_temperature = -195
}

local recipe = {
  type = "recipe",
  name = "macro-fusion-liquid-nitrogen",
  category = "chemistry",
  energy_required = 1,
  enabled = true,
  ingredients = {
    {type="fluid", name="macro-fusion-liquid-nitrogen", amount=1}
  },
  results = {
    {type="fluid", name="macro-fusion-liquid-nitrogen", amount=1, temperature=-100}
  },
  subgroup = "fluid-recipes"
}
data:extend{fluid, recipe}