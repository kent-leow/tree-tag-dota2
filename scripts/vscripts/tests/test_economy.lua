require("tests.test_framework")
require("economy")

TestEconomy = {}

function TestEconomy:test_passive_income_accrual()
    Economy:Init()
    Economy:RegisterPlayer(0)

    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)
    Economy:EconomyThink()

    local balance = Economy:GetBalance(0)
    assert(balance.gold == SETTINGS.TIER_INCOME_RATES[1].gold, "Should earn tier 1 gold income")
    assert(balance.lumber == SETTINGS.TIER_INCOME_RATES[1].lumber, "Should earn tier 1 lumber income")
end

function TestEconomy:test_building_multiplier_increases_rate()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:AddBuildingBonus(0, 5, 3)

    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)
    Economy:EconomyThink()

    local balance = Economy:GetBalance(0)
    local expectedGold = SETTINGS.TIER_INCOME_RATES[1].gold + 5
    assert(balance.gold == expectedGold, "Gold should include building bonus")
end

function TestEconomy:test_spend_deducts_correctly()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 100, 50)

    local success = Economy:Spend(0, 30, 20)
    assert(success == true, "Spend should succeed with sufficient funds")

    local balance = Economy:GetBalance(0)
    assert(balance.gold == 70, "Gold should be 70 after spending 30")
    assert(balance.lumber == 30, "Lumber should be 30 after spending 20")
end

function TestEconomy:test_insufficient_funds_rejected()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 10, 5)

    local success = Economy:Spend(0, 100, 0)
    assert(success == false, "Spend should fail with insufficient funds")

    local balance = Economy:GetBalance(0)
    assert(balance.gold == 10, "Gold should not change on failed spend")
end

function TestEconomy:test_income_rate_query()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:AddBuildingBonus(0, 3, 1)

    local rate = Economy:GetIncomeRate(0)
    assert(rate.gold == SETTINGS.TIER_INCOME_RATES[1].gold + 3, "Income rate should include building bonus")
end

RunTests(TestEconomy, "Economy")
