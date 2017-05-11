require "stdlib/event/event"

local cryolimits
local cryotargets

local function initLocals ()
  cryolimits = global.MacroFusion.cryogrenade_limits
  cryotargets = global.MacroFusion.cryogrenade_targets
end

script.on_init(function ()
  global.MacroFusion = global.MacroFusion or {}
  global.MacroFusion.cryogrenade_limits = global.MacroFusion.cryogrenade_limits or {}
  global.MacroFusion.cryogrenade_targets = global.MacroFusion.cryogrenade_targets or {}
  global.MacroFusion.cryogrenades = global.MacroFusion.cryogrenades or 0

  initLocals()
end)

script.on_load(function ()
  initLocals()
end)

-- TODO get cryogrenade's timeout and range (settings?)

local function addCryoTarget(entity, tick)
  cryolimits[entity.unit_number] = tick
  cryotargets[tick] = cryotargets[tick] or {}
  table.insert(cryotargets[tick], {id=entity.unit_number, entity=entity})
  entity.active = false
end

local function unfreezecryolimits(tick)
  for time, targets in pairs(cryotargets) do
    if time > tick then break end
    for i=1, #targets do
      local entity = targets[i].entity
      if not(entity) or not(entity.valid) then
        cryolimits[targets[i].id] = nil
      else
        if cryolimits[entity.unit_number] > tick then
          cryotargets[tick] = cryotargets[tick] or {}
          table.insert(cryotargets[tick], entity)
        else
          entity.active = true
          cryolimits[entity.unit_number] = nil
        end
      end
    end
    cryotargets[time] = nil
  end
end

Event.register(defines.events.on_trigger_created_entity, function(event)
  if event.entity.name == "macro-fusion-cryogrenade-start-script" then
    global.MacroFusion.cryogrenades = global.MacroFusion.cryogrenades + 1
    event.entity.destructible = false
  elseif event.entity.name == "macro-fusion-cryogrenade-flag-script" then
    local entity = event.entity
    local targets = entity.surface.find_entities_filtered {
      position = entity.position
    }
    for _, target in pairs(targets) do
      if target.valid and target.unit_number and target.force and
         not(entity.force.get_cease_fire(target.force)) then
        log(entity.force.name.."-"..target.force.name)
        addCryoTarget(target, event.tick + 60 * 10 )
      end
    end
    event.entity.destroy()
  elseif event.entity.name == "macro-fusion-cryogrenade-end-script" then
    unfreezecryolimits(event.tick)
    global.MacroFusion.cryogrenades = global.MacroFusion.cryogrenades - 1
    if global.MacroFusion.cryogrenades <= 0 then
      cryotargets = {}
      cryolimits = {}
    end
    event.entity.destroy()
  end
end)