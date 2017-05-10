-- detect if we have either angel's or bob's nitrogen
if (angelsmods and data.raw.fluid["gas-nitrogen"]) or (bobsmods and data.raw.fluid["nitrogen"]) then
  data.raw.recipe["macro-fusion-just-nitrogen"].hidden = true
  -- TODO Remove recipe from research

  if(data.raw.fluid["nitrogen"]) then
    data:extend {{
      type = "recipe",
      name = "macro-fusion-bob-nitrogen",
      category = "macro-fusion-cryogenics",
      energy_required = "20",
      enabled = true,
      hidden = true,
      ingredients = {{type = "fluid", name = "nitrogen", amount = 50}},
      results = {{type = "fluid", name = "macro-fusion-liquid-nitrogen", amount = 50}}
    }}
  end
  if(data.raw.fluid["gas-nitrogen"]) then
    data:extend {{
      type = "recipe",
      name = "macro-fusion-angel-nitrogen",
      category = "macro-fusion-cryogenics",
      energy_required = "20",
      enabled = true,
      hidden = true,
      ingredients = {{type = "fluid", name = "gas-nitrogen", amount = 50}},
      results = {{type = "fluid", name = "macro-fusion-liquid-nitrogen", amount = 50}}
    }}
  end

  -- TODO Create angel converter for just-nitrogen ?
end