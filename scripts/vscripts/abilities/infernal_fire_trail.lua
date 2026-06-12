require("tree_manager")

infernal_fire_trail = class({})

function infernal_fire_trail:GetIntrinsicModifierName()
    return "modifier_infernal_fire_trail"
end

modifier_infernal_fire_trail = class({})

function modifier_infernal_fire_trail:IsHidden() return true end
function modifier_infernal_fire_trail:IsPurgable() return false end
function modifier_infernal_fire_trail:IsPassive() return true end

function modifier_infernal_fire_trail:OnCreated()
    if not IsServer() then return end
    self.lastPosition = self:GetParent():GetAbsOrigin()
    self:StartIntervalThink(self:GetAbility():GetSpecialValueFor("trail_interval"))
end

function modifier_infernal_fire_trail:OnIntervalThink()
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local currentPos = parent:GetAbsOrigin()

    if (currentPos - self.lastPosition):Length2D() < 50 then
        self.lastPosition = currentPos
        return
    end

    local trailRadius = ability:GetSpecialValueFor("trail_radius")
    local trailDuration = ability:GetSpecialValueFor("trail_duration")
    local trailDPS = ability:GetSpecialValueFor("trail_damage_per_second")

    TreeManager:DestroyTreesInRadius(self.lastPosition, trailRadius)

    CreateModifierThinker(parent, ability, "modifier_infernal_fire_trail_zone", {
        duration = trailDuration,
    }, self.lastPosition, parent:GetTeamNumber(), false)

    self.lastPosition = currentPos
end

modifier_infernal_fire_trail_zone = class({})

function modifier_infernal_fire_trail_zone:OnCreated()
    if not IsServer() then return end
    self:StartIntervalThink(0.5)
end

function modifier_infernal_fire_trail_zone:OnIntervalThink()
    local ability = self:GetAbility()
    local trailRadius = ability:GetSpecialValueFor("trail_radius")
    local trailDPS = ability:GetSpecialValueFor("trail_damage_per_second")
    local origin = self:GetParent():GetAbsOrigin()

    local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), origin, nil, trailRadius,
        DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

    for _, enemy in pairs(enemies) do
        ApplyDamage({
            victim = enemy,
            attacker = self:GetCaster(),
            damage = trailDPS * 0.5,
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = ability,
        })
    end
end
