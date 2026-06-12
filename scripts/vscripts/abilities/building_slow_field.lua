building_slow_field = class({})

function building_slow_field:GetIntrinsicModifierName()
    return "modifier_building_slow_field"
end

modifier_building_slow_field = class({})

function modifier_building_slow_field:IsHidden() return true end
function modifier_building_slow_field:IsPassive() return true end
function modifier_building_slow_field:IsAura() return true end
function modifier_building_slow_field:GetAuraRadius() return self:GetAbility():GetSpecialValueFor("radius") end
function modifier_building_slow_field:GetAuraSearchTeam() return DOTA_UNIT_TARGET_TEAM_ENEMY end
function modifier_building_slow_field:GetAuraSearchType() return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC end
function modifier_building_slow_field:GetModifierAura() return "modifier_building_slow_field_effect" end

modifier_building_slow_field_effect = class({})

function modifier_building_slow_field_effect:IsHidden() return false end
function modifier_building_slow_field_effect:IsDebuff() return true end

function modifier_building_slow_field_effect:DeclareFunctions()
    return { MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE }
end

function modifier_building_slow_field_effect:GetModifierMoveSpeedBonus_Percentage()
    return -self:GetAbility():GetSpecialValueFor("slow_percent")
end
