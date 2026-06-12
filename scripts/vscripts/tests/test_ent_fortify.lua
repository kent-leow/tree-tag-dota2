require("tests.test_framework")
require("abilities.ent_fortify")

TestEntFortify = {}

function TestEntFortify:test_damage_reduction_applied()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    local ability = MockAbility:New("ent_fortify", caster, { damage_reduction = 70, duration = 5.0 })
    ability:OnSpellStart()

    assert(caster:HasModifier("modifier_ent_fortify"), "Fortify modifier should be applied")
end

function TestEntFortify:test_duration_expiry()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    local ability = MockAbility:New("ent_fortify", caster, { damage_reduction = 70, duration = 5.0 })
    ability:OnSpellStart()

    local modifier = caster:FindModifier("modifier_ent_fortify")
    assert(modifier.duration == 5.0, "Fortify should last for configured duration")
end

function TestEntFortify:test_attack_disabled_during_buff()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    local ability = MockAbility:New("ent_fortify", caster, { damage_reduction = 70, duration = 5.0 })
    ability:OnSpellStart()

    local modifier = caster:FindModifier("modifier_ent_fortify")
    local states = modifier:CheckState()
    assert(states[MODIFIER_STATE_DISARMED] == true, "Caster should be disarmed during fortify")
end

RunTests(TestEntFortify, "EntFortify")
