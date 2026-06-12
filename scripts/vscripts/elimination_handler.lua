require("settings")
require("snowball")
require("win_conditions")
require("ent_ghost")
require("infernal_respawn")

EliminationHandler = EliminationHandler or {}

EliminationHandler.eliminatedPlayers = {}

function EliminationHandler:Init()
    self.eliminatedPlayers = {}
    ListenToGameEvent("entity_killed", Dynamic_Wrap(EliminationHandler, "OnHeroKilled"), self)
end

function EliminationHandler:OnHeroKilled(event)
    local killedUnit = EntIndexToHScript(event.entindex_killed)
    if not killedUnit or not killedUnit:IsRealHero() then return end

    local team = killedUnit:GetTeamNumber()

    if team == SETTINGS.ENT_TEAM_ID then
        self:OnEntEliminated(killedUnit)
    elseif team == SETTINGS.INFERNAL_TEAM_ID then
        self:OnInfernalKilled(killedUnit)
    end
end

function EliminationHandler:OnEntEliminated(hero)
    local playerID = hero:GetPlayerID()

    EntGhost:CreateGhost(hero)

    Snowball:OnEntEliminated()
    InfernalRespawn:OnEntKilled()

    self:AnnounceElimination(hero)

    WinConditions:CheckEliminationVictory()
end

function EliminationHandler:OnInfernalKilled(hero)
    InfernalRespawn:OnInfernalDeath(hero)
end

function EliminationHandler:IsEliminated(playerID)
    return EntGhost:IsGhost(playerID)
end

function EliminationHandler:AnnounceElimination(hero)
    local heroName = hero:GetUnitName()
    CustomGameEventManager:Send_ServerToAllClients("ent_eliminated", {
        hero_name = heroName,
        remaining = self:CountRemainingEnts(),
    })
end

function EliminationHandler:CountRemainingEnts()
    local count = 0
    local heroes = HeroList:GetAllHeroes()
    for _, hero in pairs(heroes) do
        if hero:GetTeamNumber() == SETTINGS.ENT_TEAM_ID and hero:IsAlive() then
            local playerID = hero:GetPlayerID()
            if not EntGhost:IsGhost(playerID) then
                count = count + 1
            end
        end
    end
    return count
end

return EliminationHandler
