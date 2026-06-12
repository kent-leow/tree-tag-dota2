require("settings")
require("economy")

EconomyTiers = EconomyTiers or {}

EconomyTiers.eventListeners = {}

function EconomyTiers:Init()
    self.eventListeners = {}
end

function EconomyTiers:CheckTierPromotion(playerID)
    local data = Economy.playerData[playerID]
    if not data then return end

    local totalEarned = data.gold
    local currentTier = data.tier
    local newTier = currentTier

    for tier = #SETTINGS.TIER_THRESHOLDS, 1, -1 do
        if totalEarned >= SETTINGS.TIER_THRESHOLDS[tier] then
            newTier = tier
            break
        end
    end

    if newTier > currentTier then
        data.tier = newTier
        self:EmitEvent("tier_up", { playerID = playerID, oldTier = currentTier, newTier = newTier })
    end
end

function EconomyTiers:RegisterListener(eventName, callback)
    if not self.eventListeners[eventName] then
        self.eventListeners[eventName] = {}
    end
    table.insert(self.eventListeners[eventName], callback)
end

function EconomyTiers:EmitEvent(eventName, data)
    if not self.eventListeners[eventName] then return end
    for _, callback in ipairs(self.eventListeners[eventName]) do
        callback(data)
    end
end

return EconomyTiers
