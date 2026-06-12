require("tests.test_framework")
require("abilities.infernal_slam")

TestInfernalSlam = {}

function TestInfernalSlam:test_aoe_damage()
    local ability = MockAbility:New("infernal_slam", MockHero:New(SETTINGS.INFERNAL_TEAM_ID), {
        radius = 350,
        damage = 200,
        slow_percent = 40,
        slow_duration = 3.0,
    })
    assert(ability:GetSpecialValueFor("damage") == 200, "Slam should deal configured damage")
    assert(ability:GetSpecialValueFor("radius") == 350, "Slam should have configured radius")
end

function TestInfernalSlam:test_trees_destroyed()
    TreeManager:Init()
    MockGridNav:SetTrees({
        { pos = Vector(400, 400, 0), standing = true },
    })

    local destroyed = TreeManager:DestroyTreesInRadius(Vector(400, 400, 0), 350)
    assert(destroyed == 1, "Slam should destroy trees in AoE")
end

function TestInfernalSlam:test_slow_applied()
    local slow = modifier_infernal_slam_slow()
    slow.GetAbility = function()
        return MockAbility:New("infernal_slam", nil, { slow_percent = 40 })
    end

    local movePenalty = slow:GetModifierMoveSpeedBonus_Percentage()
    assert(movePenalty == -40, "Slow should reduce move speed by configured percent")
end

RunTests(TestInfernalSlam, "InfernalSlam")
