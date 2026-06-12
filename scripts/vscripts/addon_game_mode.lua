require("settings")
require("team_assignment")
require("win_conditions")

if CTreeTagGameMode == nil then
    CTreeTagGameMode = class({})
end

function Precache(context)
end

function Activate()
    GameRules.TreeTag = CTreeTagGameMode()
    GameRules.TreeTag:InitGameMode()
end

function CTreeTagGameMode:InitGameMode()
    GameRules:SetCustomGameTeamMaxPlayers(SETTINGS.ENT_TEAM_ID, SETTINGS.TEAM_ENT_COUNT)
    GameRules:SetCustomGameTeamMaxPlayers(SETTINGS.INFERNAL_TEAM_ID, SETTINGS.TEAM_INFERNAL_COUNT)
    GameRules:SetGameTime(0)
    GameRules:SetTimeOfDay(0.25)

    self.matchTimer = SETTINGS.MATCH_DURATION
    self.matchStarted = false

    ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(CTreeTagGameMode, "OnGameStateChange"), self)
    GameRules:GetGameModeEntity():SetThink("OnThink", self, "GlobalThink", 1)
end

function CTreeTagGameMode:OnGameStateChange()
    local state = GameRules:State_Get()

    if state == DOTA_GAMERULES_STATE_HERO_SELECTION then
        TeamAssignment:AssignTeams()
    elseif state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        self.matchStarted = true
        WinConditions:Init(self)
    end
end

function CTreeTagGameMode:OnThink()
    if not self.matchStarted then return 1 end

    if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        self.matchTimer = self.matchTimer - 1
        if self.matchTimer <= 0 then
            WinConditions:OnTimerExpired()
            return nil
        end
    elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
        return nil
    end

    return 1
end
