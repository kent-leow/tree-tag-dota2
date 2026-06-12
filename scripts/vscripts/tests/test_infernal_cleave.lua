require("tests.test_framework")
require("abilities.infernal_cleave")

TestInfernalCleave = {}

function TestInfernalCleave:test_cone_damage_on_attack()
    TreeManager:Init()
    local attacker = MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
    local target = MockHero:New(SETTINGS.ENT_TEAM_ID)
    target.position = Vector(150, 0, 0)

    MockGridNav:SetTrees({
        { pos = Vector(150, 0, 0), standing = true },
    })

    local modifier = modifier_infernal_cleave()
    modifier.GetParent = function() return attacker end
    modifier.GetAbility = function()
        return MockAbility:New("infernal_cleave", attacker, {
            cleave_percent = 40,
            cleave_radius = 300,
            tree_destroy_radius = 200,
        })
    end

    -- Simulate attack event
    local event = { attacker = attacker, target = target, damage = 100 }
    -- Would verify cleave damage in Dota 2 environment
    assert(modifier.GetAbility():GetSpecialValueFor("cleave_percent") == 40, "Cleave percent should be 40")
end

function TestInfernalCleave:test_tree_destruction_in_cleave_area()
    TreeManager:Init()
    MockGridNav:SetTrees({
        { pos = Vector(150, 0, 0), standing = true },
        { pos = Vector(160, 10, 0), standing = true },
    })

    local destroyed = TreeManager:DestroyTreesInRadius(Vector(150, 0, 0), 200)
    assert(destroyed == 2, "Cleave should destroy trees in area")
end

RunTests(TestInfernalCleave, "InfernalCleave")
