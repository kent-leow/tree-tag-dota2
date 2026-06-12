require("tests.test_framework")
require("abilities.ent_hide")

TestEntHide = {}

function TestEntHide:test_invisibility_applied_when_trees_sufficient()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
        { pos = Vector(110, 110, 0), standing = true },
        { pos = Vector(120, 120, 0), standing = true },
    })

    local ability = MockAbility:New("ent_hide", caster, { tree_radius = 200, min_trees = 3, max_duration = 30 })
    ability:OnSpellStart()

    assert(caster:HasModifier("modifier_ent_hide"), "Ent should have hide modifier")
end

function TestEntHide:test_invisibility_not_applied_insufficient_trees()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
    })

    local ability = MockAbility:New("ent_hide", caster, { tree_radius = 200, min_trees = 3, max_duration = 30 })
    ability:OnSpellStart()

    assert(not caster:HasModifier("modifier_ent_hide"), "Ent should not hide with insufficient trees")
end

function TestEntHide:test_invisibility_broken_when_trees_destroyed()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    caster:AddModifier("modifier_ent_hide")

    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
    })

    local modifier = caster:FindModifier("modifier_ent_hide")
    modifier.ability = MockAbility:New("ent_hide", caster, { tree_radius = 200, min_trees = 3 })
    modifier:OnIntervalThink()

    assert(modifier.destroyed, "Hide modifier should be destroyed when trees insufficient")
end

RunTests(TestEntHide, "EntHide")
