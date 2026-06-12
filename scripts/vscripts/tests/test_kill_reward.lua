require("tests.test_framework")
require("kill_reward")

TestKillReward = {}

function TestKillReward:test_kill_ent_awards_kill_resource()
    Economy:Init()
    Economy:RegisterPlayer(0)

    local killedUnit = MockHero:New(SETTINGS.ENT_TEAM_ID)
    killedUnit.GetUnitName = function() return "npc_dota_hero_ent" end

    local killerUnit = MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
    killerUnit.playerID = 0
    killerUnit.GetPlayerID = function() return 0 end

    -- Mock EntIndexToHScript to return our units
    local callCount = 0
    local origFn = EntIndexToHScript
    EntIndexToHScript = function(index)
        callCount = callCount + 1
        if callCount == 1 then return killedUnit end
        return killerUnit
    end

    KillReward:OnEntityKilled({ entindex_killed = 1, entindex_attacker = 2 })

    assert(Economy:GetKillBalance(0) == SETTINGS.KILL_VALUE_PER_ENT, "Should award KILL_VALUE_PER_ENT for killing Ent")

    EntIndexToHScript = origFn
end

function TestKillReward:test_kill_guardian_awards_kill_resource()
    Economy:Init()
    Economy:RegisterPlayer(0)

    local killedUnit = {
        GetTeamNumber = function() return SETTINGS.ENT_TEAM_ID end,
        GetUnitName = function() return "npc_dota_guardian_t1" end,
        IsRealHero = function() return false end,
        GetPlayerID = function() return -1 end,
    }

    local killerUnit = MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
    killerUnit.playerID = 0
    killerUnit.GetPlayerID = function() return 0 end

    local callCount = 0
    local origFn = EntIndexToHScript
    EntIndexToHScript = function(index)
        callCount = callCount + 1
        if callCount == 1 then return killedUnit end
        return killerUnit
    end

    KillReward:OnEntityKilled({ entindex_killed = 1, entindex_attacker = 2 })

    assert(Economy:GetKillBalance(0) == SETTINGS.KILL_VALUE_PER_GUARDIAN, "Should award KILL_VALUE_PER_GUARDIAN for killing guardian")

    EntIndexToHScript = origFn
end

function TestKillReward:test_no_reward_for_friendly_kill()
    Economy:Init()
    Economy:RegisterPlayer(0)

    local killedUnit = MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
    killedUnit.GetUnitName = function() return "npc_dota_hero_infernal" end

    local killerUnit = MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
    killerUnit.playerID = 0
    killerUnit.GetPlayerID = function() return 0 end

    local callCount = 0
    local origFn = EntIndexToHScript
    EntIndexToHScript = function(index)
        callCount = callCount + 1
        if callCount == 1 then return killedUnit end
        return killerUnit
    end

    KillReward:OnEntityKilled({ entindex_killed = 1, entindex_attacker = 2 })

    assert(Economy:GetKillBalance(0) == 0, "Should not award kill resource for friendly kill")

    EntIndexToHScript = origFn
end

function TestKillReward:test_no_reward_when_killer_is_nil()
    Economy:Init()
    Economy:RegisterPlayer(0)

    KillReward:OnEntityKilled({ entindex_killed = 1, entindex_attacker = nil })

    assert(Economy:GetKillBalance(0) == 0, "Should not award kill resource when killer is nil")
end

RunTests(TestKillReward, "KillReward")
