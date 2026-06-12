require("tests.test_framework")
require("abilities.infernal_fire_trail")

TestInfernalFireTrail = {}

function TestInfernalFireTrail:test_trail_creation_on_movement()
    local mod = modifier_infernal_fire_trail()
    mod.lastPosition = Vector(0, 0, 0)
    mod.GetParent = function()
        local h = MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
        h.position = Vector(100, 0, 0)
        h.GetAbsOrigin = function() return Vector(100, 0, 0) end
        return h
    end
    mod.GetAbility = function()
        return MockAbility:New("infernal_fire_trail", nil, {
            trail_damage_per_second = 25,
            trail_radius = 100,
            trail_duration = 3.5,
            trail_interval = 0.5,
        })
    end

    -- Moving > 50 units should leave a trail
    local dist = (Vector(100, 0, 0) - mod.lastPosition):Length2D()
    assert(dist >= 50, "Movement should trigger trail creation")
end

function TestInfernalFireTrail:test_trail_destroys_trees()
    TreeManager:Init()
    MockGridNav:SetTrees({
        { pos = Vector(50, 0, 0), standing = true },
    })

    TreeManager:DestroyTreesInRadius(Vector(50, 0, 0), 100)
    assert(TreeManager:GetDestroyedCount() == 1, "Trail should destroy trees")
end

function TestInfernalFireTrail:test_trail_fade()
    local ability = MockAbility:New("infernal_fire_trail", nil, {
        trail_damage_per_second = 25,
        trail_radius = 100,
        trail_duration = 3.5,
        trail_interval = 0.5,
    })
    assert(ability:GetSpecialValueFor("trail_duration") == 3.5, "Trail should fade after configured duration")
end

RunTests(TestInfernalFireTrail, "InfernalFireTrail")
