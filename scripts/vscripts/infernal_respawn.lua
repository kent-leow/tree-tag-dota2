require("settings")

InfernalRespawn = InfernalRespawn or {}

InfernalRespawn.entKillCount = 0
InfernalRespawn.pendingRespawns = {}

function InfernalRespawn:Init()
    self.entKillCount = 0
    self.pendingRespawns = {}
    GameRules:GetGameModeEntity():SetThink("RespawnThink", self, "InfernalRespawn", 1)
end

function InfernalRespawn:OnInfernalDeath(hero)
    local respawnTime = self:GetRespawnTime()
    table.insert(self.pendingRespawns, {
        hero = hero,
        playerID = hero:GetPlayerID(),
        timeRemaining = respawnTime,
    })
end

function InfernalRespawn:OnEntKilled()
    self.entKillCount = self.entKillCount + 1
end

function InfernalRespawn:GetRespawnTime()
    return SETTINGS.INFERNAL_RESPAWN_BASE + (SETTINGS.INFERNAL_RESPAWN_PER_KILL * self.entKillCount)
end

function InfernalRespawn:RespawnThink()
    if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        return 1
    end

    local remaining = {}
    for _, entry in ipairs(self.pendingRespawns) do
        entry.timeRemaining = entry.timeRemaining - 1
        if entry.timeRemaining <= 0 then
            self:RespawnHero(entry.hero)
        else
            table.insert(remaining, entry)
        end
    end
    self.pendingRespawns = remaining

    return 1
end

function InfernalRespawn:RespawnHero(hero)
    hero.alive = true
    hero.hp = 500
end

function InfernalRespawn:GetEntKillCount()
    return self.entKillCount
end

return InfernalRespawn
