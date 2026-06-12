require("settings")

WinConditions = WinConditions or {}

function WinConditions:Init(gameMode)
    self.gameMode = gameMode
    self.matchEnded = false
    ListenToGameEvent("entity_killed", Dynamic_Wrap(WinConditions, "OnUnitKilled"), self)
end

function WinConditions:OnUnitKilled(event)
    if self.matchEnded then return end

    local killedUnit = EntIndexToHScript(event.entindex_killed)
    if not killedUnit or not killedUnit:IsRealHero() then return end

    self:CheckEliminationVictory()
end

function WinConditions:CheckEliminationVictory()
    if self.matchEnded then return end

    local entsAlive = self:CountAliveEnts()

    if entsAlive == 0 then
        self:EndMatch(SETTINGS.INFERNAL_TEAM_ID)
    end
end

function WinConditions:OnTimerExpired()
    if self.matchEnded then return end

    local entsAlive = self:CountAliveEnts()
    if entsAlive > 0 then
        self:EndMatch(SETTINGS.ENT_TEAM_ID)
    else
        self:EndMatch(SETTINGS.INFERNAL_TEAM_ID)
    end
end

function WinConditions:EndMatch(winningTeam)
    self.matchEnded = true
    GameRules:SetGameWinner(winningTeam)
end

function WinConditions:CountAliveEnts()
    local count = 0
    local heroes = HeroList:GetAllHeroes()
    for _, hero in pairs(heroes) do
        if hero:GetTeamNumber() == SETTINGS.ENT_TEAM_ID and hero:IsAlive() then
            count = count + 1
        end
    end
    return count
end

function WinConditions:CountAliveHeroes(teamID)
    local count = 0
    local heroes = HeroList:GetAllHeroes()
    for _, hero in pairs(heroes) do
        if hero:GetTeamNumber() == teamID and hero:IsAlive() then
            count = count + 1
        end
    end
    return count
end

return WinConditions
