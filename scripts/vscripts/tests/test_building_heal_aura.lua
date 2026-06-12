require("tests.test_framework")
require("abilities.building_heal_aura")

TestBuildingHealAura = {}

function TestBuildingHealAura:test_heal_tick()
    local mod = modifier_building_heal_aura_effect()
    mod.GetAbility = function()
        return MockAbility:New("building_heal_aura", nil, { heal_per_second = 10, radius = 400 })
    end

    local regen = mod:GetModifierConstantHealthRegen()
    assert(regen == 10, "Heal aura should provide 10 HP/s")
end

function TestBuildingHealAura:test_radius_boundary()
    local mod = modifier_building_heal_aura()
    mod.GetAbility = function()
        return MockAbility:New("building_heal_aura", nil, { heal_per_second = 10, radius = 450 })
    end

    local radius = mod:GetAuraRadius()
    assert(radius == 450, "Aura radius should match configured value")
end

RunTests(TestBuildingHealAura, "BuildingHealAura")
