require("tests.test_framework")
require("abilities.ent_blink")

TestEntBlink = {}

function TestEntBlink:test_teleport_to_target()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    caster.position = Vector(0, 0, 0)

    local ability = MockAbility:New("ent_blink", caster, { max_range = 900 })
    ability.cursorPosition = Vector(300, 0, 0)
    ability:OnSpellStart()

    assert(caster.position.x == 300, "Caster should teleport to target")
end

function TestEntBlink:test_range_cap_enforced()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    caster.position = Vector(0, 0, 0)

    local ability = MockAbility:New("ent_blink", caster, { max_range = 600 })
    ability.cursorPosition = Vector(1000, 0, 0)
    ability:OnSpellStart()

    assert(caster.blinkDistance <= 600, "Blink distance should not exceed max range")
end

function TestEntBlink:test_impassable_terrain_rejection()
    local caster = MockHero:New(SETTINGS.ENT_TEAM_ID)
    caster.position = Vector(0, 0, 0)
    MockGridNav.impassablePoints = { Vector(500, 0, 0) }

    local ability = MockAbility:New("ent_blink", caster, { max_range = 900 })
    ability.cursorPosition = Vector(500, 0, 0)
    ability:OnSpellStart()

    assert(ability.refunded or caster.position.x ~= 500, "Should not blink to impassable terrain")
end

RunTests(TestEntBlink, "EntBlink")
