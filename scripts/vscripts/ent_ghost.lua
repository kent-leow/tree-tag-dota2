require("settings")

EntGhost = EntGhost or {}

EntGhost.ghosts = {}

function EntGhost:Init()
    self.ghosts = {}
end

function EntGhost:CreateGhost(hero)
    local playerID = hero:GetPlayerID()

    local ghost = {
        playerID = playerID,
        hero = hero,
        position = SETTINGS.MAP_CENTRE_POSITION,
        canAttack = false,
        moveRadius = SETTINGS.ENT_GHOST_MOVE_RADIUS,
    }

    self.ghosts[playerID] = ghost

    return ghost
end

function EntGhost:GetGhost(playerID)
    return self.ghosts[playerID]
end

function EntGhost:IsGhost(playerID)
    return self.ghosts[playerID] ~= nil
end

function EntGhost:RemoveGhost(playerID)
    self.ghosts[playerID] = nil
end

function EntGhost:IsWithinMoveRadius(playerID, position)
    local ghost = self.ghosts[playerID]
    if not ghost then return false end

    local dist = (position - SETTINGS.MAP_CENTRE_POSITION):Length2D()
    return dist <= ghost.moveRadius
end

function EntGhost:GetAllGhostPlayerIDs()
    local ids = {}
    for playerID, _ in pairs(self.ghosts) do
        table.insert(ids, playerID)
    end
    return ids
end

function EntGhost:GetGhostCount()
    local count = 0
    for _ in pairs(self.ghosts) do
        count = count + 1
    end
    return count
end

return EntGhost
