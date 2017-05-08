for _, force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  if technologies['sulfur-processing'].researched then
    recipes['macro-fusion-hydrogen-sulfide'].enabled = true
  end
end