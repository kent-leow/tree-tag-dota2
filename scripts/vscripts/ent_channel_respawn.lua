require("settings")
require("ent_ghost")

EntChannelRespawn = EntChannelRespawn or {}

EntChannelRespawn.activeChannels = {}

function EntChannelRespawn:Init()
    self.activeChannels = {}
    GameRules:GetGameModeEntity():SetThink("ChannelThink", self, "EntChannel", 1)
end

function EntChannelRespawn:StartChannel(casterPlayerID, ghostPlayerID)
    local ghost = EntGhost:GetGhost(ghostPlayerID)
    if not ghost then return false, "No ghost found" end

    if EntGhost:IsGhost(casterPlayerID) then
        return false, "Ghost cannot channel"
    end

    self.activeChannels[casterPlayerID] = {
        casterPlayerID = casterPlayerID,
        ghostPlayerID = ghostPlayerID,
        elapsed = 0,
        duration = SETTINGS.ENT_CHANNEL_DURATION,
    }

    return true, nil
end

function EntChannelRespawn:InterruptChannel(casterPlayerID)
    self.activeChannels[casterPlayerID] = nil
end

function EntChannelRespawn:IsChanneling(casterPlayerID)
    return self.activeChannels[casterPlayerID] ~= nil
end

function EntChannelRespawn:ChannelThink()
    if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        return 1
    end

    local completed = {}
    for casterID, channel in pairs(self.activeChannels) do
        channel.elapsed = channel.elapsed + 1
        if channel.elapsed >= channel.duration then
            table.insert(completed, { casterID = casterID, ghostPlayerID = channel.ghostPlayerID })
        end
    end

    for _, entry in ipairs(completed) do
        self:CompleteRespawn(entry.casterID, entry.ghostPlayerID)
    end

    return 1
end

function EntChannelRespawn:CompleteRespawn(casterPlayerID, ghostPlayerID)
    local ghost = EntGhost:GetGhost(ghostPlayerID)
    if not ghost then return end

    ghost.hero.alive = true
    ghost.hero.hp = 500

    EntGhost:RemoveGhost(ghostPlayerID)
    self.activeChannels[casterPlayerID] = nil
end

return EntChannelRespawn
