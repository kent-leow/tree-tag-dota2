require("settings")
require("economy")

Tavern = Tavern or {}

Tavern.creepCount = {}

function Tavern:Init()
    self.creepCount = {}
    ListenToGameEvent("entity_killed", Dynamic_Wrap(Tavern, "OnEntityKilled"), self)
end

function Tavern:HireCreep(playerID, creepType)
    local count = self:GetCreepCount(playerID)
    if count >= SETTINGS.TAVERN_CREEP_CAP then
        return nil, "Creep cap reached"
    end

    local cost
    local unitName
    if creepType == "melee" then
        cost = SETTINGS.TAVERN_MELEE_COST
        unitName = "npc_dota_hired_melee"
    elseif creepType == "ranged" then
        cost = SETTINGS.TAVERN_RANGED_COST
        unitName = "npc_dota_hired_ranged"
    else
        return nil, "Invalid creep type"
    end

    if not Economy:Spend(playerID, cost, 0) then
        return nil, "Insufficient gold"
    end

    local position = Vector(0, 0, 0)
    local creep = CreateUnitByName(unitName, position, false, nil, nil, SETTINGS.INFERNAL_TEAM_ID)
    creep:SetControllableByPlayer(playerID, true)
    creep.ownerPlayerID = playerID

    self.creepCount[playerID] = count + 1

    return creep, nil
end

function Tavern:OnEntityKilled(event)
    local killedUnit = EntIndexToHScript(event.entindex_killed)
    if not killedUnit then return end

    local unitName = killedUnit:GetUnitName and killedUnit:GetUnitName() or nil
    if unitName == "npc_dota_hired_melee" or unitName == "npc_dota_hired_ranged" then
        self:OnCreepKilled(killedUnit)
    end
end

function Tavern:OnCreepKilled(creep)
    local playerID = creep.ownerPlayerID
    if playerID == nil then return end

    local count = self.creepCount[playerID] or 0
    self.creepCount[playerID] = math.max(0, count - 1)
end

function Tavern:GetCreepCount(playerID)
    return self.creepCount[playerID] or 0
end

return Tavern
