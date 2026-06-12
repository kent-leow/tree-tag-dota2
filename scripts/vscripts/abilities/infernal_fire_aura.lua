require("tree_manager")

infernal_fire_aura = class({})

function infernal_fire_aura:OnToggle()
    local caster = self:GetCaster()
    if self:GetToggleState() then
        caster:AddNewModifier(caster, self, "modifier_infernal_fire_aura", {})
    else
        caster:RemoveModifierByName("modifier_infernal_fire_aura")
    end
end

modifier_infernal_fire_aura = class({})

function modifier_infernal_fire_aura:IsHidden() return false end

function modifier_infernal_fire_aura:OnCreated()
    if not IsServer() then return end
    local tickInterval = self:GetAbility():GetSpecialValueFor("tick_interval")
    self:StartIntervalThink(tickInterval)
end

function modifier_infernal_fire_aura:OnIntervalThink()
    local ability = self:GetAbility()
    local parent = self:GetParent()
    local radius = ability:GetSpecialValueFor("radius")
    local dps = ability:GetSpecialValueFor("damage_per_second")
    local tickInterval = ability:GetSpecialValueFor("tick_interval")
    local manaCost = ability:GetSpecialValueFor("mana_per_second") * tickInterval

    if parent:GetMana() < manaCost then
        ability:ToggleAbility()
        return
    end
    parent:SpendMana(manaCost, ability)

    TreeManager:DestroyTreesInRadius(parent:GetAbsOrigin(), radius)

    local enemies = FindUnitsInRadius(parent:GetTeamNumber(), parent:GetAbsOrigin(), nil, radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

    for _, enemy in pairs(enemies) do
        ApplyDamage({
            victim = enemy,
            attacker = parent,
            damage = dps * tickInterval,
            damage_type = DAMAGE_TYPE_MAGICAL,
            ability = ability,
        })
    end
end
