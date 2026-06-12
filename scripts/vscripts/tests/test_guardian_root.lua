require("tests.test_framework")
require("abilities.guardian_root")

TestGuardianRoot = {}

function TestGuardianRoot:test_root_proc_chance()
    local ability = MockAbility:New("guardian_root", nil, { proc_chance = 20, root_duration = 1.5 })
    assert(ability:GetSpecialValueFor("proc_chance") == 20, "Root should have 20% proc chance")
end

function TestGuardianRoot:test_root_duration()
    local ability = MockAbility:New("guardian_root", nil, { proc_chance = 20, root_duration = 1.5 })
    assert(ability:GetSpecialValueFor("root_duration") == 1.5, "Root should last 1.5 seconds")
end

function TestGuardianRoot:test_root_prevents_movement()
    local mod = modifier_guardian_root_debuff()
    local states = mod:CheckState()
    assert(states[MODIFIER_STATE_ROOTED] == true, "Root debuff should prevent movement")
end

RunTests(TestGuardianRoot, "GuardianRoot")
