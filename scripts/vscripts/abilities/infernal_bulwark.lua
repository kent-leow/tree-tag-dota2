infernal_bulwark = class({})

function infernal_bulwark:GetIntrinsicModifierName()
    return "modifier_infernal_bulwark"
end

modifier_infernal_bulwark = class({})

function modifier_infernal_bulwark:IsHidden() return true end
function modifier_infernal_bulwark:IsPurgable() return false end
function modifier_infernal_bulwark:IsPassive() return true end

function modifier_infernal_bulwark:DeclareFunctions()
    return {
        MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE,
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
    }
end

function modifier_infernal_bulwark:GetModifierIncomingDamage_Percentage()
    return -self:GetAbility():GetSpecialValueFor("damage_reduction")
end

function modifier_infernal_bulwark:GetModifierConstantHealthRegen()
    return self:GetAbility():GetSpecialValueFor("bonus_hp_regen")
end
