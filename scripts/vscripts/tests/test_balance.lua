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

function TestBalance:test_scaling_3v9_default_no_change()
    Balance:Init()
    local result = Balance:ScaleForTeamSize(3, 9)

    assert(result.incomeMult == 1.0, "3v9 income mult should be 1.0, got " .. result.incomeMult)
    assert(result.snowballMult == 1.0, "3v9 snowball mult should be 1.0, got " .. result.snowballMult)
    assert(result.timerMult == 1.0, "3v9 timer mult should be 1.0, got " .. result.timerMult)
end

function TestBalance:test_scaling_1v9_infernal_bonuses()
    Balance:Init()
    local result = Balance:ScaleForTeamSize(1, 9)

    assert(result.incomeMult > 1.0, "1v9 should have income bonus, got " .. result.incomeMult)
    assert(result.snowballMult < 1.0, "1v9 should have reduced snowball, got " .. result.snowballMult)
    assert(result.timerMult < 1.0, "1v9 should have reduced timer, got " .. result.timerMult)
end

function TestBalance:test_scaling_3v3_reduced_timer()
    Balance:Init()
    local result = Balance:ScaleForTeamSize(3, 3)

    assert(result.timerMult < 1.0, "3v3 should have reduced timer, got " .. result.timerMult)
end

function TestBalance:test_scaling_2v2()
    Balance:Init()
    local result = Balance:ScaleForTeamSize(2, 2)

    assert(result.timerMult < 1.0, "2v2 should have reduced timer, got " .. result.timerMult)
    assert(result.incomeMult <= 1.0, "2v2 should not have inflated income")
end

RunTests(TestBalance, "Balance")
