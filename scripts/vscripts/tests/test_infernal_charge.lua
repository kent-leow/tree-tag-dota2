require("tests.test_framework")
require("abilities.infernal_charge")

TestInfernalCharge = {}

function TestInfernalCharge:test_dash_to_target()
    local ability = MockAbility:New("infernal_charge", MockHero:New(SETTINGS.INFERNAL_TEAM_ID), {
        charge_speed = 1200,
        damage = 120,
        stun_duration = 1.2,
        tree_destroy_width = 200,
    })
    assert(ability:GetSpecialValueFor("charge_speed") == 1200, "Charge speed should be 1200")
end

function TestInfernalCharge:test_stun_duration()
    local ability = MockAbility:New("infernal_charge", nil, {
        charge_speed = 1200,
        damage = 120,
        stun_duration = 1.4,
        tree_destroy_width = 200,
    })
    assert(ability:GetSpecialValueFor("stun_duration") == 1.4, "Stun should last 1.4s")
end

function TestInfernalCharge:test_trees_destroyed_in_path()
    TreeManager:Init()
    MockGridNav:SetTrees({
        { pos = Vector(200, 0, 0), standing = true },
        { pos = Vector(400, 0, 0), standing = true },
    })

    TreeManager:DestroyTreesInRadius(Vector(200, 0, 0), 100)
    TreeManager:DestroyTreesInRadius(Vector(400, 0, 0), 100)

    assert(TreeManager:GetDestroyedCount() == 2, "Charge should destroy trees along path")
end

RunTests(TestInfernalCharge, "InfernalCharge")
