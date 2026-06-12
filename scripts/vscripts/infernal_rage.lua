require("settings")

InfernalRage = InfernalRage or {}

InfernalRage.active = false
InfernalRage.gameMode = nil

function InfernalRage:Init(gameMode)
    self.active = false
    self.gameMode = gameMode
    GameRules:GetGameModeEntity():SetThink("RageCheckThink", self, "RageCheck", 1)
end

function InfernalRage:RageCheckThink()
    if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        return 1
    end

    if self.active then return 1 end

    if self.gameMode and self.gameMode.matchTimer <= SETTINGS.RAGE_TRIGGER_TIME then
        self:ActivateRage()
    end

    return 1
end

function InfernalRage:ActivateRage()
    self.active = true

    self:ApplyRageToAllInfernals()

    CustomGameEventManager:Send_ServerToAllClients("infernal_rage_activated", {
        burn_multiplier = SETTINGS.RAGE_BURN_RADIUS_MULTIPLIER,
        speed_bonus = SETTINGS.RAGE_SPEED_BONUS,
    })
end

function InfernalRage:ApplyRageToAllInfernals()
    local heroes = HeroList:GetAllHeroes()
    for _, hero in pairs(heroes) do
        if hero:GetTeamNumber() == SETTINGS.INFERNAL_TEAM_ID and hero:IsAlive() then
            self:ApplyRageBuff(hero)
        end
    end
end

function InfernalRage:ApplyRageBuff(hero)
    hero:AddNewModifier(hero, nil, "modifier_infernal_rage", { duration = -1 })
end

function InfernalRage:OnInfernalRespawn(hero)
    if self.active then
        self:ApplyRageBuff(hero)
    end
end

function InfernalRage:IsActive()
    return self.active
end

function InfernalRage:GetBurnRadiusMultiplier()
    if self.active then
        return SETTINGS.RAGE_BURN_RADIUS_MULTIPLIER
    end
    return 1.0
end

function InfernalRage:GetSpeedBonus()
    if self.active then
        return SETTINGS.RAGE_SPEED_BONUS
    end
    return 0
end

return InfernalRage
