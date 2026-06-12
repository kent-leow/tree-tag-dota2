require("settings")

TreeManager = TreeManager or {}

TreeManager.destroyedTrees = {}
TreeManager.eventListeners = {}

function TreeManager:Init()
    self.destroyedTrees = {}
    self.eventListeners = {}
end

function TreeManager:GetTreesInRadius(center, radius)
    local trees = GridNav:GetAllTreesAroundPoint(center, radius, true)
    return trees
end

function TreeManager:DestroyTreesInRadius(center, radius)
    local trees = GridNav:GetAllTreesAroundPoint(center, radius, true)
    local destroyed = {}

    for _, tree in pairs(trees) do
        if tree:IsStanding() then
            tree:CutDown(SETTINGS.INFERNAL_TEAM_ID)
            table.insert(destroyed, {
                position = tree:GetAbsOrigin(),
                time = GameRules:GetGameTime(),
            })
            table.insert(self.destroyedTrees, {
                position = tree:GetAbsOrigin(),
                destroyedAt = GameRules:GetGameTime(),
            })
        end
    end

    if #destroyed > 0 then
        self:EmitEvent("trees_destroyed", { center = center, count = #destroyed, trees = destroyed })
    end

    return #destroyed
end

function TreeManager:RegrowTreesInRadius(center, radius)
    local regrown = 0
    local remaining = {}

    for _, entry in ipairs(self.destroyedTrees) do
        local dist = (entry.position - center):Length2D()
        if dist <= radius then
            GridNav:RegrowAllTreesInRadius(entry.position, 1)
            regrown = regrown + 1
        else
            table.insert(remaining, entry)
        end
    end

    self.destroyedTrees = remaining

    if regrown > 0 then
        self:EmitEvent("trees_regrown", { center = center, count = regrown })
    end

    return regrown
end

function TreeManager:RegisterListener(eventName, callback)
    if not self.eventListeners[eventName] then
        self.eventListeners[eventName] = {}
    end
    table.insert(self.eventListeners[eventName], callback)
end

function TreeManager:EmitEvent(eventName, data)
    if not self.eventListeners[eventName] then return end
    for _, callback in ipairs(self.eventListeners[eventName]) do
        callback(data)
    end
end

function TreeManager:GetDestroyedCount()
    return #self.destroyedTrees
end

return TreeManager
