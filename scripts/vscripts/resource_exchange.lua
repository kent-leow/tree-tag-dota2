require("settings")
require("economy")

ResourceExchange = ResourceExchange or {}

function ResourceExchange:Init()
end

function ResourceExchange:GetAvailableExchanges(playerID)
    local available = {}
    local balance = Economy:GetBalance(playerID)

    for key, def in pairs(SETTINGS.EXCHANGE_DEFS) do
        local canAfford = true
        if def.lumber and def.lumber > 0 and balance.lumber < def.lumber then
            canAfford = false
        end
        if def.kill and def.kill > 0 and balance.kill < def.kill then
            canAfford = false
        end

        if canAfford then
            table.insert(available, { key = key, def = def })
        end
    end

    return available
end

function ResourceExchange:Purchase(playerID, itemKey)
    local def = SETTINGS.EXCHANGE_DEFS[itemKey]
    if not def then return false, "Unknown item" end

    local balance = Economy:GetBalance(playerID)

    if def.lumber and def.lumber > 0 then
        if balance.lumber < def.lumber then
            return false, "Insufficient lumber"
        end
    end

    if def.kill and def.kill > 0 then
        if balance.kill < def.kill then
            return false, "Insufficient kill resource"
        end
    end

    if def.lumber and def.lumber > 0 then
        Economy:SpendLumber(playerID, def.lumber)
    end

    if def.kill and def.kill > 0 then
        Economy:SpendKill(playerID, def.kill)
    end

    CustomGameEventManager:Send_ServerToAllClients("resource_exchange_purchase", {
        playerID = playerID,
        itemKey = itemKey,
    })

    return true, nil
end

return ResourceExchange
