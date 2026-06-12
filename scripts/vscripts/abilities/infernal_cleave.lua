require("tree_manager")

infernal_cleave = class({})

modifier_infernal_cleave = class({})

function modifier_infernal_cleave:IsHidden() return true end
function modifier_infernal_cleave:IsPurgable() return false end
function modifier_infernal_cleave:IsPassive() return true end

function modifier_infernal_cleave:DeclareFunctions()
    return { MODIFIER_EVENT_ON_ATTACK_LANDED }
end

function modifier_infernal_cleave:OnAttackLanded(event)
    if not IsServer() then return end
    if event.attacker ~= self:GetParent() then return end

    local ability = self:GetAbility()
    local cleavePercent = ability:GetSpecialValueFor("cleave_percent")
    local cleaveRadius = ability:GetSpecialValueFor("cleave_radius")
    local treeDestroyRadius = ability:GetSpecialValueFor("tree_destroy_radius")

    local damage = event.damage * cleavePercent / 100
    local origin = self:GetParent():GetAbsOrigin()

    DoCleaveAttack(self:GetParent(), event.target, ability, damage, cleaveRadius, cleaveRadius, cleaveRadius, "")

    TreeManager:DestroyTreesInRadius(event.target:GetAbsOrigin(), treeDestroyRadius)
end

function infernal_cleave:GetIntrinsicModifierName()
    return "modifier_infernal_cleave"
end
