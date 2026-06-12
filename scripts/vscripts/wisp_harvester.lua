require("settings")
require("economy")

WispHarvester = WispHarvester or {}

WispHarvester.wisps = {}
WispHarvester.wispCount = {}

function WispHarvester:Init()
    self.wisps = {}
    self.wispCount = {}
    GameRules:GetGameModeEntity():SetThink("WispHarvestThink", self, "WispHarvest", SETTINGS.WISP_HARVEST_INTERVAL)
end

function WispHarvester:SpawnWisp(playerID, position)
    if not Economy:Spend(playerID, SETTINGS.WISP_SPAWN_COST, 0) then
        return nil, "Insufficient gold"
    end

    local wisp = CreateUnitByName("npc_dota_ent_wisp", position, false, nil, nil, SETTINGS.ENT_TEAM_ID)
    wisp:SetControllableByPlayer(playerID, true)

    local wispData = {
        unit = wisp,
        playerID = playerID,
        assignedTree = nil,
        harvesting = false,
    }

    table.insert(self.wisps, wispData)
    self.wispCount[playerID] = (self.wispCount[playerID] or 0) + 1

    return wisp, nil
end

function WispHarvester:AssignToTree(wisp, treeEntity)
    for _, wispData in ipairs(self.wisps) do
        if wispData.unit == wisp then
            wispData.assignedTree = treeEntity
            wispData.harvesting = true
            return true
        end
    end
    return false
end

function WispHarvester:WispHarvestThink()
    if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        return SETTINGS.WISP_HARVEST_INTERVAL
    end

    for _, wispData in ipairs(self.wisps) do
        if wispData.harvesting and wispData.assignedTree then
            if wispData.assignedTree:IsStanding() then
                Economy:Earn(wispData.playerID, 0, SETTINGS.WISP_HARVEST_RATE)
            else
                wispData.harvesting = false
                wispData.assignedTree = nil
            end
        end
    end

    return SETTINGS.WISP_HARVEST_INTERVAL
end

function WispHarvester:OnWispKilled(wisp)
    for i, wispData in ipairs(self.wisps) do
        if wispData.unit == wisp then
            self.wispCount[wispData.playerID] = math.max(0, (self.wispCount[wispData.playerID] or 1) - 1)
            table.remove(self.wisps, i)
            return true
        end
    end
    return false
end

function WispHarvester:GetWispCount(playerID)
    return self.wispCount[playerID] or 0
end

return WispHarvester
