require("tests.test_framework")
require("wisp_harvester")

TestWispHarvester = {}

function TestWispHarvester:test_spawn_costs_gold()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 200, 0)

    WispHarvester:Init()
    local wisp, err = WispHarvester:SpawnWisp(0, Vector(100, 100, 0))

    assert(wisp ~= nil, "Wisp should be spawned")
    assert(err == nil, "No error expected")
    assert(Economy:GetBalance(0).gold == 200 - SETTINGS.WISP_SPAWN_COST, "Gold should be deducted")
end

function TestWispHarvester:test_spawn_fails_insufficient_gold()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 10, 0)

    WispHarvester:Init()
    local wisp, err = WispHarvester:SpawnWisp(0, Vector(100, 100, 0))

    assert(wisp == nil, "Wisp should not spawn")
    assert(err == "Insufficient gold", "Should report insufficient gold")
    assert(Economy:GetBalance(0).gold == 10, "Gold should be unchanged")
end

function TestWispHarvester:test_harvest_tick_awards_lumber()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 200, 0)

    WispHarvester:Init()
    local wisp = WispHarvester:SpawnWisp(0, Vector(100, 100, 0))

    local mockTree = { standing = true, IsStanding = function(self) return self.standing end }
    WispHarvester:AssignToTree(wisp, mockTree)

    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)
    WispHarvester:WispHarvestThink()

    assert(Economy:GetBalance(0).lumber == SETTINGS.WISP_HARVEST_RATE, "Should earn lumber from harvest")
end

function TestWispHarvester:test_wisp_assignment()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 200, 0)

    WispHarvester:Init()
    local wisp = WispHarvester:SpawnWisp(0, Vector(100, 100, 0))

    local mockTree = { standing = true, IsStanding = function(self) return self.standing end }
    local success = WispHarvester:AssignToTree(wisp, mockTree)

    assert(success == true, "Assignment should succeed")
end

function TestWispHarvester:test_wisp_killed_stops_harvest()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 200, 0)

    WispHarvester:Init()
    local wisp = WispHarvester:SpawnWisp(0, Vector(100, 100, 0))

    local mockTree = { standing = true, IsStanding = function(self) return self.standing end }
    WispHarvester:AssignToTree(wisp, mockTree)
    WispHarvester:OnWispKilled(wisp)

    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)
    WispHarvester:WispHarvestThink()

    assert(Economy:GetBalance(0).lumber == 0, "Should not earn lumber after wisp killed")
end

function TestWispHarvester:test_wisp_count_tracking()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 500, 0)

    WispHarvester:Init()
    WispHarvester:SpawnWisp(0, Vector(100, 100, 0))
    WispHarvester:SpawnWisp(0, Vector(200, 200, 0))

    assert(WispHarvester:GetWispCount(0) == 2, "Should track 2 wisps")
end

RunTests(TestWispHarvester, "WispHarvester")
