require("settings")
require("economy")
require("tree_manager")

BuildingSystem = BuildingSystem or {}

BuildingSystem.buildings = {}

function BuildingSystem:Init()
    self.buildings = {}
    ListenToGameEvent("entity_killed", Dynamic_Wrap(BuildingSystem, "OnBuildingKilled"), self)
end

function BuildingSystem:ValidatePlacement(position, playerID)
    if not GridNav:IsTraversable(position) then
        return false, "Invalid terrain"
    end

    local nearbyTrees = TreeManager:GetTreesInRadius(position, SETTINGS.TREE_REGROWTH_RADIUS)
    if #nearbyTrees < 2 then
        return false, "Must build near trees"
    end

    for _, building in pairs(self.buildings) do
        if (building.position - position):Length2D() < 200 then
            return false, "Too close to existing building"
        end
    end

    return true, nil
end

function BuildingSystem:Construct(playerID, buildingType, position, tier)
    local valid, err = self:ValidatePlacement(position, playerID)
    if not valid then return nil, err end

    local buildingDef = SETTINGS.BUILDING_DEFS[buildingType]
    if not buildingDef then return nil, "Unknown building type" end

    local cost = buildingDef.costs[tier or 1]
    if not Economy:Spend(playerID, cost.gold, cost.lumber) then
        return nil, "Insufficient resources"
    end

    local unitName = buildingDef.unitName
    local unit = CreateUnitByName(unitName, position, false, nil, nil, SETTINGS.ENT_TEAM_ID)

    local buildingData = {
        unit = unit,
        playerID = playerID,
        buildingType = buildingType,
        tier = tier or 1,
        position = position,
    }

    table.insert(self.buildings, buildingData)

    if buildingType == "economy" then
        local bonus = buildingDef.incomeBonus[buildingData.tier]
        Economy:AddBuildingBonus(playerID, bonus.gold, bonus.lumber)
    end

    return buildingData, nil
end

function BuildingSystem:OnBuildingKilled(event)
    local killedUnit = EntIndexToHScript(event.entindex_killed)
    if not killedUnit then return end

    for i, building in ipairs(self.buildings) do
        if building.unit == killedUnit then
            if building.buildingType == "economy" then
                local bonus = SETTINGS.BUILDING_DEFS.economy.incomeBonus[building.tier]
                Economy:RemoveBuildingBonus(building.playerID, bonus.gold, bonus.lumber)
            end
            table.remove(self.buildings, i)
            break
        end
    end
end

function BuildingSystem:GetPlayerBuildings(playerID)
    local result = {}
    for _, building in pairs(self.buildings) do
        if building.playerID == playerID then
            table.insert(result, building)
        end
    end
    return result
end

return BuildingSystem
