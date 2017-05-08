-- detect if we have angel's hydrogen sulfide
if angelsmods and data.raw.fluid["hydrogen-sulfide"] then
  local function replaceIngredient(recipe, type, old, new)
    for _, ingredient in pairs(recipe.ingredients) do
      if ingredient.type == type and ingredient.name == old then
        ingredient.name = new
      end
    end
    if recipe.results then
      for _, result in pairs(recipe.results) do
        if result.type == type and result.name == old then result.name = new end
      end
    elseif recipe.result and recipe.result == old and recipe.type == "item" then
      recipe.result = new
    end
  end

  replaceIngredient(data.raw.recipe["macro-fusion-hydrogen-sulfide"], "fluid", "macro-fusion-hydrogen-sulfide", "hydrogen-sulfide")
  replaceIngredient(data.raw.recipe["macro-fusion-deuterium-oxide"], "fluid", "macro-fusion-hydrogen-sulfide", "hydrogen-sulfide")
end