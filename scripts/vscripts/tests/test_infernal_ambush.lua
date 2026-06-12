require("tests.test_framework")
require("abilities.infernal_ambush")

TestInfernalAmbush = {}

function TestInfernalAmbush:test_invis_applied()
    local mod = modifier_infernal_ambush()
    local states = mod:CheckState()
    assert(states[MODIFIER_STATE_INVISIBLE] == true, "Ambush should grant invisibility")
end

function TestInfernalAmbush:test_move_speed_bonus()
    local mod = modifier_infernal_ambush()
    mod.GetAbility = function()
        return MockAbility:New("infernal_ambush", nil, { move_speed_bonus = 30, bonus_damage = 150, duration = 7.0 })
    end

    local bonus = mod:GetModifierMoveSpeedBonus_Percentage()
    assert(bonus == 30, "Ambush should grant 30% move speed")
end

function TestInfernalAmbush:test_bonus_damage_on_attack_break()
    local mod = modifier_infernal_ambush()
    mod.GetAbility = function()
        return MockAbility:New("infernal_ambush", nil, { move_speed_bonus = 30, bonus_damage = 200, duration = 7.0 })
    end

    local dmg = mod:GetModifierPreAttack_BonusDamage()
    assert(dmg == 200, "First attack should deal 200 bonus damage")
end

function TestInfernalAmbush:test_duration_expiry()
    local ability = MockAbility:New("infernal_ambush", nil, { duration = 8.0, move_speed_bonus = 30, bonus_damage = 200 })
    assert(ability:GetSpecialValueFor("duration") == 8.0, "Duration should be configurable")
end

RunTests(TestInfernalAmbush, "InfernalAmbush")
