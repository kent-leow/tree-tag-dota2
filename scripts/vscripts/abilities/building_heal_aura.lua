building_heal_aura = class({})

function building_heal_aura:GetIntrinsicModifierName()
    return "modifier_building_heal_aura"
end

modifier_building_heal_aura = class({})

function modifier_building_heal_aura:IsHidden() return true end
function modifier_building_heal_aura:IsPassive() return true end
function modifier_building_heal_aura:IsAura() return true end
function modifier_building_heal_aura:GetAuraRadius() return self:GetAbility():GetSpecialValueFor("radius") end
function modifier_building_heal_aura:GetAuraSearchTeam() return DOTA_UNIT_TARGET_TEAM_FRIENDLY end
function modifier_building_heal_aura:GetAuraSearchType() return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end
function modifier_building_heal_aura:GetModifierAura() return "modifier_building_heal_aura_effect" end

modifier_building_heal_aura_effect = class({})

function modifier_building_heal_aura_effect:IsHidden() return false end

function modifier_building_heal_aura_effect:DeclareFunctions()
    return { MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT }
end

function modifier_building_heal_aura_effect:GetModifierConstantHealthRegen()
    return self:GetAbility():GetSpecialValueFor("heal_per_second")
end
