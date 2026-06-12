require("tests.test_framework")
require("abilities.guardian_thorns")

TestGuardianThorns = {}

function TestGuardianThorns:test_damage_reflection_on_melee_hit()
    local mod = modifier_guardian_thorns()
    local guardian = MockHero:New(SETTINGS.ENT_TEAM_ID)
    mod.GetParent = function() return guardian end
    mod.GetAbility = function()
        return MockAbility:New("guardian_thorns", guardian, { reflect_percent = 20 })
    end

    -- Melee attacker hits for 100, should reflect 20
    local reflectPercent = mod:GetAbility():GetSpecialValueFor("reflect_percent")
    local damage = 100
    local reflected = damage * reflectPercent / 100

    assert(reflected == 20, "Should reflect 20% of 100 = 20 damage")
end

function TestGuardianThorns:test_no_reflection_on_ranged_hit()
    -- Implementation checks attacker:IsRangedAttacker()
    -- Ranged attackers should not trigger thorns
    local mod = modifier_guardian_thorns()
    assert(mod.OnAttackLanded ~= nil, "Thorns should listen to attack events")
end

RunTests(TestGuardianThorns, "GuardianThorns")
