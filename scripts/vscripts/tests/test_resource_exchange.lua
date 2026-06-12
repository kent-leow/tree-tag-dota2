require("tests.test_framework")
require("resource_exchange")

CustomGameEventManager = CustomGameEventManager or {}
function CustomGameEventManager:Send_ServerToAllClients(event, data) end

TestResourceExchange = {}

function TestResourceExchange:test_purchase_succeeds_with_sufficient_resources()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 0, 100)
    Economy:EarnKill(0, 10)

    ResourceExchange:Init()

    local success, err = ResourceExchange:Purchase(0, "advanced_guardian")
    assert(success == true, "Purchase should succeed: " .. (err or ""))
end

function TestResourceExchange:test_purchase_fails_insufficient_lumber()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 0, 10)

    ResourceExchange:Init()

    local success, err = ResourceExchange:Purchase(0, "advanced_guardian")
    assert(success == false, "Purchase should fail with insufficient lumber")
    assert(err == "Insufficient lumber", "Error message should indicate insufficient lumber")
end

function TestResourceExchange:test_purchase_fails_insufficient_kill()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 0, 200)
    Economy:EarnKill(0, 1)

    ResourceExchange:Init()

    local success, err = ResourceExchange:Purchase(0, "elite_guardian")
    assert(success == false, "Purchase should fail with insufficient kill resource")
    assert(err == "Insufficient kill resource", "Error message should indicate insufficient kill resource")
end

function TestResourceExchange:test_correct_resource_deducted()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 0, 100)
    Economy:EarnKill(0, 10)

    ResourceExchange:Init()

    ResourceExchange:Purchase(0, "advanced_guardian")

    local balance = Economy:GetBalance(0)
    local expectedLumber = 100 - SETTINGS.EXCHANGE_DEFS.advanced_guardian.lumber
    assert(balance.lumber == expectedLumber, "Lumber should be deducted by exchange cost")
end

function TestResourceExchange:test_kill_resource_deducted()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 0, 200)
    Economy:EarnKill(0, 10)

    ResourceExchange:Init()

    ResourceExchange:Purchase(0, "elite_guardian")

    local killBalance = Economy:GetKillBalance(0)
    local expectedKill = 10 - SETTINGS.EXCHANGE_DEFS.elite_guardian.kill
    assert(killBalance == expectedKill, "Kill resource should be deducted by exchange cost")
end

function TestResourceExchange:test_available_list_filters_by_affordability()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 0, 100)
    Economy:EarnKill(0, 0)

    ResourceExchange:Init()

    local available = ResourceExchange:GetAvailableExchanges(0)

    local hasAdvancedGuardian = false
    local hasEliteGuardian = false
    for _, item in ipairs(available) do
        if item.key == "advanced_guardian" then hasAdvancedGuardian = true end
        if item.key == "elite_guardian" then hasEliteGuardian = true end
    end

    assert(hasAdvancedGuardian == true, "Should include advanced_guardian (can afford lumber)")
    assert(hasEliteGuardian == false, "Should exclude elite_guardian (cannot afford kill)")
end

RunTests(TestResourceExchange, "ResourceExchange")
