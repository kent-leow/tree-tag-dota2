require("settings")
require("economy")
require("economy_tiers")
require("building_system")

BuildingUpgrades = BuildingUpgrades or {}

function BuildingUpgrades:Upgrade(playerID, buildingData)
    local buildingDef = SETTINGS.BUILDING_DEFS[buildingData.buildingType]
    if not buildingDef then return false, "Unknown building type" end

    local currentTier = buildingData.tier
    local maxTier = #buildingDef.costs
    if currentTier >= maxTier then return false, "Already max tier" end

    local nextTier = currentTier + 1

    local requiredEconTier = buildingDef.tierGates[nextTier] or 1
    if Economy:GetTier(playerID) < requiredEconTier then
        return false, "Economy tier too low"
    end

    local cost = buildingDef.costs[nextTier]
    if not Economy:Spend(playerID, cost.gold, cost.lumber) then
        return false, "Insufficient resources"
    end

    if buildingData.buildingType == "economy" then
        local oldBonus = buildingDef.incomeBonus[currentTier]
        local newBonus = buildingDef.incomeBonus[nextTier]
        Economy:RemoveBuildingBonus(playerID, oldBonus.gold, oldBonus.lumber)
        Economy:AddBuildingBonus(playerID, newBonus.gold, newBonus.lumber)
    end

    buildingData.tier = nextTier
    return true, nil
end

return BuildingUpgrades
