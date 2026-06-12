require("tests.test_framework")
require("abilities.building_slow_field")

TestBuildingSlowField = {}

function TestBuildingSlowField:test_slow_applied_to_enemies()
    local mod = modifier_building_slow_field_effect()
    mod.GetAbility = function()
        return MockAbility:New("building_slow_field", nil, { slow_percent = 30, radius = 400 })
    end

    local slow = mod:GetModifierMoveSpeedBonus_Percentage()
    assert(slow == -30, "Slow field should reduce enemy speed by 30%")
end

function TestBuildingSlowField:test_no_effect_on_friendlies()
    local mod = modifier_building_slow_field()
    mod.GetAbility = function()
        return MockAbility:New("building_slow_field", nil, { slow_percent = 30, radius = 400 })
    end

    local searchTeam = mod:GetAuraSearchTeam()
    assert(searchTeam == DOTA_UNIT_TARGET_TEAM_ENEMY, "Slow should only target enemies")
end

function TestBuildingSlowField:test_radius()
    local mod = modifier_building_slow_field()
    mod.GetAbility = function()
        return MockAbility:New("building_slow_field", nil, { slow_percent = 30, radius = 400 })
    end

    local radius = mod:GetAuraRadius()
    assert(radius == 400, "Slow field radius should match configured value")
end

RunTests(TestBuildingSlowField, "BuildingSlowField")
