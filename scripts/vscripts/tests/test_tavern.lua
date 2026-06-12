require("tests.test_framework")
require("tavern")

TestTavern = {}

function TestTavern:test_hire_succeeds_under_cap()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 500, 0)

    Tavern:Init()

    local creep, err = Tavern:HireCreep(0, "melee")
    assert(creep ~= nil, "Should hire creep: " .. (err or ""))
    assert(Tavern:GetCreepCount(0) == 1, "Count should be 1")
end

function TestTavern:test_hire_fails_at_cap()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 2000, 0)

    Tavern:Init()

    Tavern:HireCreep(0, "melee")
    Tavern:HireCreep(0, "melee")
    Tavern:HireCreep(0, "melee")

    local creep, err = Tavern:HireCreep(0, "melee")
    assert(creep == nil, "Should not hire creep at cap")
    assert(err == "Creep cap reached", "Should report cap reached")
    assert(Tavern:GetCreepCount(0) == 3, "Count should remain 3")
end

function TestTavern:test_hire_fails_insufficient_gold()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 10, 0)

    Tavern:Init()

    local creep, err = Tavern:HireCreep(0, "melee")
    assert(creep == nil, "Should not hire creep without gold")
    assert(err == "Insufficient gold", "Should report insufficient gold")
end

function TestTavern:test_creep_death_decrements_count()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 500, 0)

    Tavern:Init()

    local creep = Tavern:HireCreep(0, "melee")
    assert(Tavern:GetCreepCount(0) == 1, "Count should be 1")

    Tavern:OnCreepKilled(creep)
    assert(Tavern:GetCreepCount(0) == 0, "Count should be 0 after death")
end

function TestTavern:test_melee_vs_ranged_spawn_correct_unit()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 1000, 0)

    Tavern:Init()

    local melee = Tavern:HireCreep(0, "melee")
    assert(melee.unitName == "npc_dota_hired_melee", "Should spawn melee unit")

    local ranged = Tavern:HireCreep(0, "ranged")
    assert(ranged.unitName == "npc_dota_hired_ranged", "Should spawn ranged unit")
end

RunTests(TestTavern, "Tavern")
