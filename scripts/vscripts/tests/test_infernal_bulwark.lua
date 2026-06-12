require("tests.test_framework")
require("abilities.infernal_bulwark")

TestInfernalBulwark = {}

function TestInfernalBulwark:test_damage_reduction()
    local mod = modifier_infernal_bulwark()
    mod.GetAbility = function()
        return MockAbility:New("infernal_bulwark", nil, { damage_reduction = 20, bonus_hp_regen = 10 })
    end

    local reduction = mod:GetModifierIncomingDamage_Percentage()
    assert(reduction == -20, "Bulwark should reduce incoming damage by 20%")
end

function TestInfernalBulwark:test_hp_regen_bonus()
    local mod = modifier_infernal_bulwark()
    mod.GetAbility = function()
        return MockAbility:New("infernal_bulwark", nil, { damage_reduction = 20, bonus_hp_regen = 10 })
    end

    local regen = mod:GetModifierConstantHealthRegen()
    assert(regen == 10, "Bulwark should provide 10 HP regen")
end

RunTests(TestInfernalBulwark, "InfernalBulwark")
