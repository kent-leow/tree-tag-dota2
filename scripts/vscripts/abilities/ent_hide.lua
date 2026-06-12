require("tree_manager")

ent_hide = class({})

function ent_hide:OnSpellStart()
    local caster = self:GetCaster()
    local treeRadius = self:GetSpecialValueFor("tree_radius")
    local minTrees = self:GetSpecialValueFor("min_trees")
    local duration = self:GetSpecialValueFor("max_duration")

    local trees = TreeManager:GetTreesInRadius(caster:GetAbsOrigin(), treeRadius)
    if #trees < minTrees then
        self:RefundManaCost()
        return
    end

    caster:AddNewModifier(caster, self, "modifier_ent_hide", { duration = duration })
end

modifier_ent_hide = class({})

function modifier_ent_hide:IsHidden() return false end
function modifier_ent_hide:IsPurgable() return false end

function modifier_ent_hide:GetEffectName()
    return "particles/units/heroes/hero_treant/treant_livingarmor.vpcf"
end

function modifier_ent_hide:OnCreated()
    if not IsServer() then return end
    self:StartIntervalThink(0.5)
    self:GetParent():SetMoveCapability(DOTA_UNIT_CAP_MOVE_NONE)
end

function modifier_ent_hide:OnIntervalThink()
    local parent = self:GetParent()
    local ability = self:GetAbility()
    local treeRadius = ability:GetSpecialValueFor("tree_radius")
    local minTrees = ability:GetSpecialValueFor("min_trees")

    local trees = TreeManager:GetTreesInRadius(parent:GetAbsOrigin(), treeRadius)
    if #trees < minTrees then
        self:Destroy()
    end
end

function modifier_ent_hide:OnDestroy()
    if not IsServer() then return end
    self:GetParent():SetMoveCapability(DOTA_UNIT_CAP_MOVE_GROUND)
end

function modifier_ent_hide:DeclareFunctions()
    return { MODIFIER_PROPERTY_INVISIBILITY_LEVEL }
end

function modifier_ent_hide:GetModifierInvisibilityLevel()
    return 1
end

function modifier_ent_hide:CheckState()
    return {
        [MODIFIER_STATE_INVISIBLE] = true,
        [MODIFIER_STATE_ROOTED] = true,
    }
end

TreeManager:RegisterListener("trees_destroyed", function(data)
    local heroes = HeroList:GetAllHeroes()
    for _, hero in pairs(heroes) do
        if hero:HasModifier("modifier_ent_hide") then
            local modifier = hero:FindModifierByName("modifier_ent_hide")
            if modifier then
                modifier:OnIntervalThink()
            end
        end
    end
end)
