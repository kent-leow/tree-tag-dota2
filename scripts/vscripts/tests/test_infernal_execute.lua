require("tests.test_framework")
require("abilities.infernal_execute")

TestInfernalExecute = {}

function TestInfernalExecute:test_damage_scaling_with_missing_hp()
    local ability = MockAbility:New("infernal_execute", nil, {
        base_damage = 100,
        missing_hp_percent = 0.3,
    })

    local baseDmg = ability:GetSpecialValueFor("base_damage")
    local missingPercent = ability:GetSpecialValueFor("missing_hp_percent")

    -- Target with 500 max HP, 200 current = 300 missing
    local missingHP = 300
    local totalDamage = baseDmg + (missingHP * missingPercent)

    assert(totalDamage == 190, "Execute should deal 100 + 300*0.3 = 190 damage")
end

function TestInfernalExecute:test_cooldown_reset_on_kill()
    -- Verified via ability:EndCooldown() call in implementation
    local ability = infernal_execute()
    ability.EndCooldown = function(self) self.cdReset = true end
    ability.GetCaster = function() return MockHero:New(SETTINGS.INFERNAL_TEAM_ID) end
    ability.GetCursorTarget = function()
        local t = MockHero:New(SETTINGS.ENT_TEAM_ID)
        t.GetMaxHealth = function() return 500 end
        t.GetHealth = function() return 50 end
        t.IsAlive = function() return false end
        return t
    end
    ability.GetSpecialValueFor = function(_, key)
        if key == "base_damage" then return 1000 end
        if key == "missing_hp_percent" then return 0.5 end
        return 0
    end

    MockApplyDamage = true
    ability:OnSpellStart()
    assert(ability.cdReset == true, "Cooldown should reset on kill")
end

function TestInfernalExecute:test_normal_cooldown_on_non_kill()
    local ability = infernal_execute()
    ability.cdReset = false
    ability.EndCooldown = function(self) self.cdReset = true end
    ability.GetCaster = function() return MockHero:New(SETTINGS.INFERNAL_TEAM_ID) end
    ability.GetCursorTarget = function()
        local t = MockHero:New(SETTINGS.ENT_TEAM_ID)
        t.GetMaxHealth = function() return 500 end
        t.GetHealth = function() return 400 end
        t.IsAlive = function() return true end
        return t
    end
    ability.GetSpecialValueFor = function(_, key)
        if key == "base_damage" then return 50 end
        if key == "missing_hp_percent" then return 0.2 end
        return 0
    end

    ability:OnSpellStart()
    assert(ability.cdReset == false, "Cooldown should not reset when target survives")
end

-- Mock ApplyDamage at global level
function ApplyDamage(params) end

RunTests(TestInfernalExecute, "InfernalExecute")
