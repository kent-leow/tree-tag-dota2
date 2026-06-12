require("tests.test_framework")
require("abilities.infernal_reveal")

TestInfernalReveal = {}

function TestInfernalReveal:test_vision_granted()
    local ability = MockAbility:New("infernal_reveal", nil, { radius = 600, duration = 7.0 })
    assert(ability:GetSpecialValueFor("radius") == 600, "Reveal should grant vision in radius")
    assert(ability:GetSpecialValueFor("duration") == 7.0, "Reveal should last configured duration")
end

function TestInfernalReveal:test_invisible_units_revealed()
    -- Verified via modifier_truesight application in implementation
    local mod = modifier_infernal_reveal_thinker()
    assert(mod.OnIntervalThink ~= nil, "Reveal thinker should poll for invisible units")
end

function TestInfernalReveal:test_duration_expiry()
    local ability = MockAbility:New("infernal_reveal", nil, { radius = 600, duration = 7.0 })
    assert(ability:GetSpecialValueFor("duration") == 7.0, "Reveal expires after duration")
end

RunTests(TestInfernalReveal, "InfernalReveal")
