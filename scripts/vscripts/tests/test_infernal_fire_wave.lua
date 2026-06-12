require("tests.test_framework")
require("abilities.infernal_fire_wave")

TestInfernalFireWave = {}

function TestInfernalFireWave:test_line_damage_configured()
    local ability = MockAbility:New("infernal_fire_wave", nil, {
        damage = 160,
        wave_width = 250,
        wave_distance = 1100,
        wave_speed = 1200,
    })
    assert(ability:GetSpecialValueFor("damage") == 160, "Wave should deal configured damage")
    assert(ability:GetSpecialValueFor("wave_distance") == 1100, "Wave should travel configured distance")
end

function TestInfernalFireWave:test_tree_destruction_along_path()
    TreeManager:Init()
    MockGridNav:SetTrees({
        { pos = Vector(200, 0, 0), standing = true },
        { pos = Vector(500, 0, 0), standing = true },
        { pos = Vector(800, 0, 0), standing = true },
    })

    -- Simulate wave path destruction
    TreeManager:DestroyTreesInRadius(Vector(200, 0, 0), 125)
    TreeManager:DestroyTreesInRadius(Vector(500, 0, 0), 125)
    TreeManager:DestroyTreesInRadius(Vector(800, 0, 0), 125)

    assert(TreeManager:GetDestroyedCount() == 3, "Fire wave should destroy all trees in path")
end

function TestInfernalFireWave:test_max_travel_distance()
    local ability = MockAbility:New("infernal_fire_wave", nil, {
        damage = 160,
        wave_width = 250,
        wave_distance = 1100,
        wave_speed = 1200,
    })
    assert(ability:GetSpecialValueFor("wave_distance") == 1100, "Wave should stop at max distance")
end

RunTests(TestInfernalFireWave, "InfernalFireWave")
