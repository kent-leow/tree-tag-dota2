infernal_hunt = class({})

function infernal_hunt:GetIntrinsicModifierName()
    return "modifier_infernal_hunt"
end

modifier_infernal_hunt = class({})

function modifier_infernal_hunt:IsHidden() return true end
function modifier_infernal_hunt:IsPurgable() return false end
function modifier_infernal_hunt:IsPassive() return true end

function modifier_infernal_hunt:OnCreated()
    if not IsServer() then return end
    self:StartIntervalThink(0.3)
end

function modifier_infernal_hunt:OnIntervalThink()
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local radius = ability:GetSpecialValueFor("detection_radius")

    local enemies = FindUnitsInRadius(parent:GetTeamNumber(), parent:GetAbsOrigin(), nil, radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO,
        DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

    if #enemies > 0 then
        self:SetStackCount(1)
    else
        self:SetStackCount(0)
    end
end

function modifier_infernal_hunt:DeclareFunctions()
    return { MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE }
end

function modifier_infernal_hunt:GetModifierMoveSpeedBonus_Percentage()
    if self:GetStackCount() > 0 then
        return self:GetAbility():GetSpecialValueFor("move_speed_bonus")
    end
    return 0
end
