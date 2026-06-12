require("tests.test_framework")
require("abilities.ent_regrowth")

TestEntRegrowth = {}

function TestEntRegrowth:test_trees_regrown_at_target()
    TreeManager:Init()
    TreeManager.destroyedTrees = {
        { position = Vector(500, 500, 0), destroyedAt = 0 },
        { position = Vector(520, 520, 0), destroyedAt = 0 },
    }

    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    local ability = MockAbility:New("ent_regrowth", caster, { radius = 400 })
    ability.cursorPosition = Vector(510, 510, 0)
    ability:OnSpellStart()

    assert(#TreeManager.destroyedTrees == 0, "All trees in radius should be regrown")
end

function TestEntRegrowth:test_cooldown_respected()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    local ability = MockAbility:New("ent_regrowth", caster, { radius = 400 })
    ability:OnSpellStart()

    assert(ability.cooldownStarted, "Cooldown should start after cast")
end

function TestEntRegrowth:test_mana_cost_deducted()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    caster.mana = 100
    local ability = MockAbility:New("ent_regrowth", caster, { radius = 400 })
    ability.manaCost = 60
    ability:OnSpellStart()

    assert(caster.mana == 40, "Mana should be deducted on cast")
end

RunTests(TestEntRegrowth, "EntRegrowth")
