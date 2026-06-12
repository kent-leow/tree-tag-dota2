require("tests.test_framework")
require("infernal_respawn")

TestInfernalRespawn = {}

function TestInfernalRespawn:test_base_respawn_time_with_zero_kills()
    InfernalRespawn:Init()

    local respawnTime = InfernalRespawn:GetRespawnTime()
    assert(respawnTime == SETTINGS.INFERNAL_RESPAWN_BASE, "Base respawn should be " .. SETTINGS.INFERNAL_RESPAWN_BASE .. "s")
end

function TestInfernalRespawn:test_respawn_time_after_one_ent_kill()
    InfernalRespawn:Init()
    InfernalRespawn:OnEntKilled()

    local respawnTime = InfernalRespawn:GetRespawnTime()
    local expected = SETTINGS.INFERNAL_RESPAWN_BASE + SETTINGS.INFERNAL_RESPAWN_PER_KILL
    assert(respawnTime == expected, "Respawn after 1 kill should be " .. expected .. "s, got " .. respawnTime)
end

function TestInfernalRespawn:test_respawn_time_after_two_ent_kills()
    InfernalRespawn:Init()
    InfernalRespawn:OnEntKilled()
    InfernalRespawn:OnEntKilled()

    local respawnTime = InfernalRespawn:GetRespawnTime()
    local expected = SETTINGS.INFERNAL_RESPAWN_BASE + (SETTINGS.INFERNAL_RESPAWN_PER_KILL * 2)
    assert(respawnTime == expected, "Respawn after 2 kills should be " .. expected .. "s, got " .. respawnTime)
end

function TestInfernalRespawn:test_infernal_respawns_after_timer()
    InfernalRespawn:Init()
    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)

    local hero = MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
    hero.alive = false
    hero.playerID = 0
    hero.GetPlayerID = function() return 0 end

    InfernalRespawn:OnInfernalDeath(hero)

    -- Simulate ticking down the timer
    for i = 1, SETTINGS.INFERNAL_RESPAWN_BASE do
        InfernalRespawn:RespawnThink()
    end

    assert(hero.alive == true, "Infernal should respawn after timer expires")
end

RunTests(TestInfernalRespawn, "InfernalRespawn")
