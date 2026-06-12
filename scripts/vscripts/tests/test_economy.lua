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

function TestEconomy:test_kill_resource_initialized_to_zero()
    Economy:Init()
    Economy:RegisterPlayer(0)

    local balance = Economy:GetBalance(0)
    assert(balance.kill == 0, "Kill resource should start at 0")
end

function TestEconomy:test_earn_kill_accumulates()
    Economy:Init()
    Economy:RegisterPlayer(0)

    Economy:EarnKill(0, 3)
    Economy:EarnKill(0, 2)

    assert(Economy:GetKillBalance(0) == 5, "Kill balance should accumulate")
end

function TestEconomy:test_get_balance_returns_all_three_resources()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 100, 50)
    Economy:EarnKill(0, 7)

    local balance = Economy:GetBalance(0)
    assert(balance.gold == 100, "Gold should be 100")
    assert(balance.lumber == 50, "Lumber should be 50")
    assert(balance.kill == 7, "Kill should be 7")
end

function TestEconomy:test_spend_still_works_for_gold_lumber()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 100, 50)
    Economy:EarnKill(0, 5)

    local success = Economy:Spend(0, 50, 25)
    assert(success == true, "Spend gold/lumber should succeed")

    local balance = Economy:GetBalance(0)
    assert(balance.gold == 50, "Gold should be 50 after spend")
    assert(balance.lumber == 25, "Lumber should be 25 after spend")
    assert(balance.kill == 5, "Kill should be unchanged after gold/lumber spend")
end

function TestEconomy:test_spend_kill_succeeds()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:EarnKill(0, 10)

    local success = Economy:SpendKill(0, 5)
    assert(success == true, "SpendKill should succeed with sufficient kill resource")
    assert(Economy:GetKillBalance(0) == 5, "Kill balance should be 5 after spending 5")
end

function TestEconomy:test_spend_kill_fails_insufficient()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:EarnKill(0, 2)

    local success = Economy:SpendKill(0, 5)
    assert(success == false, "SpendKill should fail with insufficient kill resource")
    assert(Economy:GetKillBalance(0) == 2, "Kill balance should be unchanged on failed spend")
end

function TestEconomy:test_spend_lumber_succeeds()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 0, 100)

    local success = Economy:SpendLumber(0, 50)
    assert(success == true, "SpendLumber should succeed with sufficient lumber")
    assert(Economy:GetBalance(0).lumber == 50, "Lumber should be 50 after spending 50")
end

function TestEconomy:test_spend_lumber_fails_insufficient()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 0, 20)

    local success = Economy:SpendLumber(0, 50)
    assert(success == false, "SpendLumber should fail with insufficient lumber")
    assert(Economy:GetBalance(0).lumber == 20, "Lumber should be unchanged on failed spend")
end

RunTests(TestEconomy, "Economy")
