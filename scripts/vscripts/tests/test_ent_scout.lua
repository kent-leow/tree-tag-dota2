require("tests.test_framework")
require("abilities.ent_scout")

TestEntScout = {}

function TestEntScout:test_wisp_spawns()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    local ability = MockAbility:New("ent_scout", caster, { wisp_duration = 10, wisp_move_speed = 350, wisp_vision = 600 })
    ability:OnSpellStart()

    assert(MockCreateUnit.lastCreated ~= nil, "Wisp should be spawned")
    assert(MockCreateUnit.lastCreated.unitName == "npc_dota_ent_wisp", "Should spawn wisp unit")
end

function TestEntScout:test_wisp_provides_vision()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    local ability = MockAbility:New("ent_scout", caster, { wisp_duration = 10, wisp_move_speed = 350, wisp_vision = 600 })
    ability:OnSpellStart()

    local wisp = MockCreateUnit.lastCreated
    assert(wisp.team == caster:GetTeamNumber(), "Wisp should be on caster's team")
end

function TestEntScout:test_wisp_expires_after_duration()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    local ability = MockAbility:New("ent_scout", caster, { wisp_duration = 10, wisp_move_speed = 350, wisp_vision = 600 })
    ability:OnSpellStart()

    local wisp = MockCreateUnit.lastCreated
    assert(wisp.killModifierDuration == 10, "Wisp should have timed life of configured duration")
end

function TestEntScout:test_wisp_dies_when_hp_depleted()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    local ability = MockAbility:New("ent_scout", caster, { wisp_duration = 10, wisp_move_speed = 350, wisp_vision = 600 })
    ability:OnSpellStart()

    local wisp = MockCreateUnit.lastCreated
    assert(wisp.hp == 1, "Wisp should have 1 HP (fragile)")
end

RunTests(TestEntScout, "EntScout")
