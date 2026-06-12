require("economy")

building_income_aura = class({})

function building_income_aura:GetIntrinsicModifierName()
    return "modifier_building_income_aura"
end

modifier_building_income_aura = class({})

function modifier_building_income_aura:IsHidden() return true end
function modifier_building_income_aura:IsPassive() return true end
function modifier_building_income_aura:IsPurgable() return false end
