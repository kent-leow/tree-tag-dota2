require("tests.test_framework")
require("abilities.infernal_hunt")

TestInfernalHunt = {}

function TestInfernalHunt:test_speed_bonus_toward_enemies()
    local mod = modifier_infernal_hunt()
    mod.GetAbility = function()
        return MockAbility:New("infernal_hunt", nil, { move_speed_bonus = 40, detection_radius = 1400 })
    end
    mod.GetStackCount = function() return 1 end

    local bonus = mod:GetModifierMoveSpeedBonus_Percentage()
    assert(bonus == 40, "Should grant 40% move speed when enemies nearby")
end

function TestInfernalHunt:test_no_bonus_without_enemies()
    local mod = modifier_infernal_hunt()
    mod.GetAbility = function()
        return MockAbility:New("infernal_hunt", nil, { move_speed_bonus = 40, detection_radius = 1400 })
    end
    mod.GetStackCount = function() return 0 end

    local bonus = mod:GetModifierMoveSpeedBonus_Percentage()
    assert(bonus == 0, "Should not grant move speed without enemies")
end

RunTests(TestInfernalHunt, "InfernalHunt")
