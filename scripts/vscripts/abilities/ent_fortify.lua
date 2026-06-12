ent_fortify = class({})

function ent_fortify:OnSpellStart()
    local caster = self:GetCaster()
    local duration = self:GetSpecialValueFor("duration")

    caster:AddNewModifier(caster, self, "modifier_ent_fortify", { duration = duration })
end

modifier_ent_fortify = class({})

function modifier_ent_fortify:IsHidden() return false end
function modifier_ent_fortify:IsPurgable() return false end

function modifier_ent_fortify:DeclareFunctions()
    return { MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE }
end

function modifier_ent_fortify:GetModifierIncomingDamage_Percentage()
    return -self:GetAbility():GetSpecialValueFor("damage_reduction")
end

function modifier_ent_fortify:CheckState()
    return {
        [MODIFIER_STATE_DISARMED] = true,
    }
end
