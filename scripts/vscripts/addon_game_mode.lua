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
    GameRules:SetTimeOfDay(0.25)
    GameRules:SetHeroSelectionTime(SETTINGS.INFERNAL_PICK_TIME)
    GameRules:SetPreGameTime(SETTINGS.ENT_HEAD_START_DURATION)
    GameRules:SetCustomGameAllowHeroPickMusic(false)
    GameRules:SetCustomGameAllowMusicAtGameStart(false)

    local gm = GameRules:GetGameModeEntity()
    gm:SetAnnouncerDisabled(true)
    gm:SetHeroSelectionFilter(Dynamic_Wrap(CTreeTagGameMode, "HeroPickFilter"), self)

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
        self:AutoAssignEntHeroes()
    elseif state == DOTA_GAMERULES_STATE_PRE_GAME then
        self:StartHeadStart()
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

function CTreeTagGameMode:AutoAssignEntHeroes()
    for playerID = 0, PlayerResource:GetPlayerCount() - 1 do
        if PlayerResource:IsValidPlayerID(playerID) then
            if PlayerResource:GetTeam(playerID) == SETTINGS.ENT_TEAM_ID then
                PlayerResource:SetSelectedHero(playerID, "npc_dota_hero_treant")
            end
        end
    end
end

function CTreeTagGameMode:HeroPickFilter(event)
    local playerID = event.playerID
    local heroName = event.hero
    local team = PlayerResource:GetTeam(playerID)

    if team == SETTINGS.ENT_TEAM_ID then
        return heroName == "npc_dota_hero_treant"
    elseif team == SETTINGS.INFERNAL_TEAM_ID then
        local allowed = {
            npc_dota_hero_doom_bringer = true,
            npc_dota_hero_night_stalker = true,
            npc_dota_hero_warlock = true,
        }
        return allowed[heroName] == true
    end
    return false
end

function CTreeTagGameMode:StartHeadStart()
    local heroes = HeroList:GetAllHeroes()
    for _, hero in pairs(heroes) do
        if hero:GetTeamNumber() == SETTINGS.INFERNAL_TEAM_ID then
            hero:AddNewModifier(hero, nil, "modifier_stunned", {duration = SETTINGS.ENT_HEAD_START_DURATION})
        end
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
