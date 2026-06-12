require("tree_manager")

infernal_slam = class({})

function infernal_slam:OnSpellStart()
    local caster = self:GetCaster()
    local targetPoint = self:GetCursorPosition()
    local radius = self:GetSpecialValueFor("radius")
    local damage = self:GetSpecialValueFor("damage")
    local slowPercent = self:GetSpecialValueFor("slow_percent")
    local slowDuration = self:GetSpecialValueFor("slow_duration")

    TreeManager:DestroyTreesInRadius(targetPoint, radius)

    local enemies = FindUnitsInRadius(caster:GetTeamNumber(), targetPoint, nil, radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

    for _, enemy in pairs(enemies) do
        ApplyDamage({
            victim = enemy,
            attacker = caster,
            damage = damage,
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = self,
        })
        enemy:AddNewModifier(caster, self, "modifier_infernal_slam_slow", { duration = slowDuration })
    end
end

modifier_infernal_slam_slow = class({})

function modifier_infernal_slam_slow:DeclareFunctions()
    return { MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE }
end

function modifier_infernal_slam_slow:GetModifierMoveSpeedBonus_Percentage()
    return -self:GetAbility():GetSpecialValueFor("slow_percent")
end
