require("tests.test_framework")
require("balance")

TestBalance = {}

function TestBalance:test_infernal_power_exceeds_ent_early()
    Balance:Init()

    local infPower = Balance:GetInfernalPower(0)
    local entPower = Balance:GetEntPower(0)

    assert(infPower > entPower, "Infernals should be stronger at minute 0")
end

function TestBalance:test_crossover_point_exists()
    Balance:Init()

    local crossover = Balance:GetCrossoverMinute()
    assert(crossover > 0, "Crossover should happen after minute 0")
    assert(crossover <= SETTINGS.MATCH_DURATION / 60, "Crossover should happen before match end")
end

function TestBalance:test_ent_power_exceeds_late_game()
    Balance:Init()

    local lateMinute = SETTINGS.MATCH_DURATION / 60
    local infPower = Balance:GetInfernalPower(lateMinute)
    local entPower = Balance:GetEntPower(lateMinute)

    assert(entPower > infPower, "Ents should be stronger in late game")
end

function TestBalance:test_infernal_stronger_at_minute_5()
    Balance:Init()

    local infPower = Balance:GetInfernalPower(5)
    local entPower = Balance:GetEntPower(5)

    assert(infPower > entPower, "Infernals should still be stronger at minute 5")
end

RunTests(TestBalance, "Balance")
