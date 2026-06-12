require("settings")
require("team_assignment")
require("win_conditions")
require("kill_reward")
require("wisp_harvester")
require("resource_exchange")
require("tavern")
require("creep_combat")
require("infernal_respawn")
require("ent_ghost")
require("ent_channel_respawn")
require("infernal_rage")
require("balance")

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
    local infernalCount = SETTINGS.TEAM_INFERNAL_COUNT
    local entCount = SETTINGS.TEAM_ENT_COUNT

    if self.customInfernals and self.customEnts then
        infernalCount = self.customInfernals
        entCount = self.customEnts
        TeamAssignment:Configure(infernalCount, entCount)
    end

    GameRules:SetCustomGameTeamMaxPlayers(SETTINGS.ENT_TEAM_ID, entCount)
    GameRules:SetCustomGameTeamMaxPlayers(SETTINGS.INFERNAL_TEAM_ID, infernalCount)
    GameRules:SetGameTime(0)
    GameRules:SetTimeOfDay(0.25)

    Balance:Init()
    Balance:ScaleForTeamSize(infernalCount, entCount)

    self.matchTimer = math.floor(SETTINGS.MATCH_DURATION * Balance:GetTimerMult())
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
        KillReward:Init()
        WispHarvester:Init()
        ResourceExchange:Init()
        Tavern:Init()
        CreepCombat:Init()
        InfernalRespawn:Init()
        EntGhost:Init()
        EntChannelRespawn:Init()
        InfernalRage:Init(self)
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
