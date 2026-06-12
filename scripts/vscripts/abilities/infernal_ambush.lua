infernal_ambush = class({})

function infernal_ambush:OnSpellStart()
    local caster = self:GetCaster()
    local duration = self:GetSpecialValueFor("duration")

    caster:AddNewModifier(caster, self, "modifier_infernal_ambush", { duration = duration })
end

modifier_infernal_ambush = class({})

function modifier_infernal_ambush:IsHidden() return false end

function modifier_infernal_ambush:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_INVISIBILITY_LEVEL,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
        MODIFIER_EVENT_ON_ATTACK_LANDED,
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
    }
end

function modifier_infernal_ambush:GetModifierInvisibilityLevel()
    return 1
end

function modifier_infernal_ambush:GetModifierMoveSpeedBonus_Percentage()
    return self:GetAbility():GetSpecialValueFor("move_speed_bonus")
end

function modifier_infernal_ambush:GetModifierPreAttack_BonusDamage()
    return self:GetAbility():GetSpecialValueFor("bonus_damage")
end

function modifier_infernal_ambush:OnAttackLanded(event)
    if not IsServer() then return end
    if event.attacker ~= self:GetParent() then return end
    self:Destroy()
end

function modifier_infernal_ambush:CheckState()
    return {
        [MODIFIER_STATE_INVISIBLE] = true,
    }
end
