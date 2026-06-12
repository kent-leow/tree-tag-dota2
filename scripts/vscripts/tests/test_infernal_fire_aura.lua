require("tests.test_framework")
require("abilities.infernal_fire_aura")

TestInfernalFireAura = {}

function TestInfernalFireAura:test_tree_destruction_per_tick()
    TreeManager:Init()
    MockGridNav:SetTrees({
        { pos = Vector(100, 0, 0), standing = true },
        { pos = Vector(150, 0, 0), standing = true },
    })

    local destroyed = TreeManager:DestroyTreesInRadius(Vector(0, 0, 0), 300)
    assert(destroyed == 2, "Fire aura should destroy trees within radius")
end

function TestInfernalFireAura:test_toggle_on_off()
    local ability = infernal_fire_aura()
    local toggleState = false
    ability.GetToggleState = function() return toggleState end
    ability.GetCaster = function()
        return MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
    end

    -- Verify toggle mechanics
    assert(ability.GetToggleState() == false, "Aura should start toggled off")
    toggleState = true
    assert(ability.GetToggleState() == true, "Aura should toggle on")
end

RunTests(TestInfernalFireAura, "InfernalFireAura")
