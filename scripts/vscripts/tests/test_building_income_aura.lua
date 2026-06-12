require("tests.test_framework")
require("abilities.building_income_aura")

TestBuildingIncomeAura = {}

function TestBuildingIncomeAura:test_income_bonus_applied()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:AddBuildingBonus(0, 3, 1)

    local rate = Economy:GetIncomeRate(0)
    assert(rate.gold == SETTINGS.TIER_INCOME_RATES[1].gold + 3, "Income aura should add gold bonus")
    assert(rate.lumber == SETTINGS.TIER_INCOME_RATES[1].lumber + 1, "Income aura should add lumber bonus")
end

function TestBuildingIncomeAura:test_scaling_with_tier()
    Economy:Init()
    Economy:RegisterPlayer(0)

    -- T1 bonus
    Economy:AddBuildingBonus(0, 3, 1)
    local rateT1 = Economy:GetIncomeRate(0)

    -- Upgrade to T2 (remove T1, add T2)
    Economy:RemoveBuildingBonus(0, 3, 1)
    Economy:AddBuildingBonus(0, 6, 2)
    local rateT2 = Economy:GetIncomeRate(0)

    assert(rateT2.gold > rateT1.gold, "T2 should provide more gold than T1")
end

RunTests(TestBuildingIncomeAura, "BuildingIncomeAura")
