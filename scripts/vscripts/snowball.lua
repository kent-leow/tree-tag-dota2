require("settings")

Snowball = Snowball or {}

Snowball.killCount = 0

function Snowball:Init()
    self.killCount = 0
end

function Snowball:OnEntEliminated()
    self.killCount = self.killCount + 1
    self:ApplySnowballBuff()
    self:EmitSnowballEvent()
end

function Snowball:ApplySnowballBuff()
    local heroes = HeroList:GetAllHeroes()
    for _, hero in pairs(heroes) do
        if hero:GetTeamNumber() == SETTINGS.INFERNAL_TEAM_ID and hero:IsAlive() then
            local modifier = hero:FindModifierByName("modifier_snowball_buff")
            if modifier then
                modifier:SetStackCount(self.killCount)
            else
                hero:AddNewModifier(hero, nil, "modifier_snowball_buff", {})
                local newMod = hero:FindModifierByName("modifier_snowball_buff")
                if newMod then
                    newMod:SetStackCount(self.killCount)
                end
            end
        end
    end
end

function Snowball:EmitSnowballEvent()
    CustomGameEventManager:Send_ServerToAllClients("snowball_power_up", {
        kill_count = self.killCount,
        bonus_damage = self.killCount * SETTINGS.SNOWBALL_DAMAGE_PER_KILL,
        bonus_hp = self.killCount * SETTINGS.SNOWBALL_HP_PER_KILL,
        bonus_speed = self.killCount * SETTINGS.SNOWBALL_SPEED_PER_KILL,
    })
end

function Snowball:GetCurrentBonus()
    return {
        damage = self.killCount * SETTINGS.SNOWBALL_DAMAGE_PER_KILL,
        hp = self.killCount * SETTINGS.SNOWBALL_HP_PER_KILL,
        speed = self.killCount * SETTINGS.SNOWBALL_SPEED_PER_KILL,
    }
end

modifier_snowball_buff = class({})

function modifier_snowball_buff:IsHidden() return false end
function modifier_snowball_buff:IsPurgable() return false end
function modifier_snowball_buff:IsPermanent() return true end

function modifier_snowball_buff:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
        MODIFIER_PROPERTY_HEALTH_BONUS,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
    }
end

function modifier_snowball_buff:GetModifierPreAttack_BonusDamage()
    return self:GetStackCount() * SETTINGS.SNOWBALL_DAMAGE_PER_KILL
end

function modifier_snowball_buff:GetModifierHealthBonus()
    return self:GetStackCount() * SETTINGS.SNOWBALL_HP_PER_KILL
end

function modifier_snowball_buff:GetModifierMoveSpeedBonus_Constant()
    return self:GetStackCount() * SETTINGS.SNOWBALL_SPEED_PER_KILL
end

return Snowball
