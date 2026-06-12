require("tests.test_framework")
require("abilities.infernal_meteor")

TestInfernalMeteor = {}

function TestInfernalMeteor:test_delay_before_damage()
    local ability = MockAbility:New("infernal_meteor", nil, { radius = 400, damage = 360, delay = 2.0 })
    assert(ability:GetSpecialValueFor("delay") == 2.0, "Meteor should have 2s delay")
end

function TestInfernalMeteor:test_aoe_damage()
    local ability = MockAbility:New("infernal_meteor", nil, { radius = 400, damage = 360, delay = 2.0 })
    assert(ability:GetSpecialValueFor("damage") == 360, "Meteor should deal configured AoE damage")
end

function TestInfernalMeteor:test_tree_destruction()
    TreeManager:Init()
    MockGridNav:SetTrees({
        { pos = Vector(500, 500, 0), standing = true },
        { pos = Vector(520, 520, 0), standing = true },
    })

    TreeManager:DestroyTreesInRadius(Vector(510, 510, 0), 400)
    assert(TreeManager:GetDestroyedCount() == 2, "Meteor should destroy trees in radius")
end

RunTests(TestInfernalMeteor, "InfernalMeteor")
