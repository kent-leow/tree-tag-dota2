require("settings")

Economy = Economy or {}

Economy.playerData = {}

function Economy:Init()
    self.playerData = {}
    GameRules:GetGameModeEntity():SetThink("EconomyThink", self, "EconomyTick", SETTINGS.INCOME_TICK_INTERVAL)
end

function Economy:RegisterPlayer(playerID)
    self.playerData[playerID] = {
        gold = 0,
        lumber = 0,
        tier = 1,
        buildingBonus = { gold = 0, lumber = 0 },
    }
end

function Economy:EconomyThink()
    if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        return SETTINGS.INCOME_TICK_INTERVAL
    end

    for playerID, data in pairs(self.playerData) do
        local tierRate = SETTINGS.TIER_INCOME_RATES[data.tier]
        local goldIncome = tierRate.gold + data.buildingBonus.gold
        local lumberIncome = tierRate.lumber + data.buildingBonus.lumber

        data.gold = data.gold + goldIncome
        data.lumber = data.lumber + lumberIncome
    end

    return SETTINGS.INCOME_TICK_INTERVAL
end

function Economy:GetBalance(playerID)
    local data = self.playerData[playerID]
    if not data then return { gold = 0, lumber = 0 } end
    return { gold = data.gold, lumber = data.lumber }
end

function Economy:GetIncomeRate(playerID)
    local data = self.playerData[playerID]
    if not data then return { gold = 0, lumber = 0 } end
    local tierRate = SETTINGS.TIER_INCOME_RATES[data.tier]
    return {
        gold = tierRate.gold + data.buildingBonus.gold,
        lumber = tierRate.lumber + data.buildingBonus.lumber,
    }
end

function Economy:Spend(playerID, goldCost, lumberCost)
    local data = self.playerData[playerID]
    if not data then return false end
    if data.gold < goldCost or data.lumber < lumberCost then return false end

    data.gold = data.gold - goldCost
    data.lumber = data.lumber - lumberCost
    return true
end

function Economy:Earn(playerID, gold, lumber)
    local data = self.playerData[playerID]
    if not data then return end
    data.gold = data.gold + (gold or 0)
    data.lumber = data.lumber + (lumber or 0)
end

function Economy:AddBuildingBonus(playerID, goldBonus, lumberBonus)
    local data = self.playerData[playerID]
    if not data then return end
    data.buildingBonus.gold = data.buildingBonus.gold + goldBonus
    data.buildingBonus.lumber = data.buildingBonus.lumber + lumberBonus
end

function Economy:RemoveBuildingBonus(playerID, goldBonus, lumberBonus)
    local data = self.playerData[playerID]
    if not data then return end
    data.buildingBonus.gold = math.max(0, data.buildingBonus.gold - goldBonus)
    data.buildingBonus.lumber = math.max(0, data.buildingBonus.lumber - lumberBonus)
end

function Economy:GetTier(playerID)
    local data = self.playerData[playerID]
    if not data then return 1 end
    return data.tier
end

function Economy:SetTier(playerID, tier)
    local data = self.playerData[playerID]
    if not data then return end
    data.tier = tier
end

return Economy
