require("settings")
require("tree_manager")

TreeRegrowth = TreeRegrowth or {}

TreeRegrowth.regrowthQueue = {}

function TreeRegrowth:Init()
    self.regrowthQueue = {}
    GameRules:GetGameModeEntity():SetThink("RegrowthThink", self, "TreeRegrowthThink", 1)
end

function TreeRegrowth:RegrowthThink()
    if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        return 1
    end

    local currentTime = GameRules:GetGameTime()
    local remaining = {}

    for _, entry in ipairs(TreeManager.destroyedTrees) do
        if currentTime - entry.destroyedAt >= SETTINGS.TREE_REGROWTH_DELAY then
            GridNav:RegrowAllTreesInRadius(entry.position, 1)
            TreeManager:EmitEvent("trees_regrown", { center = entry.position, count = 1 })
        else
            table.insert(remaining, entry)
        end
    end

    TreeManager.destroyedTrees = remaining

    return 1
end

function TreeRegrowth:InstantRegrow(center, radius)
    return TreeManager:RegrowTreesInRadius(center, radius)
end

return TreeRegrowth
