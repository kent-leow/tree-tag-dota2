require("tests.test_framework")
require("ent_channel_respawn")

TestEntChannelRespawn = {}

function TestEntChannelRespawn:test_channel_completes_and_respawns_ent()
    EntGhost:Init()
    EntChannelRespawn:Init()
    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)

    local deadHero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    deadHero.alive = false
    deadHero.playerID = 1
    deadHero.GetPlayerID = function() return 1 end

    EntGhost:CreateGhost(deadHero)

    local success, err = EntChannelRespawn:StartChannel(0, 1)
    assert(success == true, "Channel should start: " .. (err or ""))

    for i = 1, SETTINGS.ENT_CHANNEL_DURATION do
        EntChannelRespawn:ChannelThink()
    end

    assert(deadHero.alive == true, "Dead Ent should be respawned after channel completes")
    assert(EntGhost:IsGhost(1) == false, "Ghost should be removed after respawn")
end

function TestEntChannelRespawn:test_channel_interrupted_resets_progress()
    EntGhost:Init()
    EntChannelRespawn:Init()
    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)

    local deadHero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    deadHero.alive = false
    deadHero.playerID = 1
    deadHero.GetPlayerID = function() return 1 end

    EntGhost:CreateGhost(deadHero)

    EntChannelRespawn:StartChannel(0, 1)

    -- Tick 2 seconds
    EntChannelRespawn:ChannelThink()
    EntChannelRespawn:ChannelThink()

    -- Interrupt
    EntChannelRespawn:InterruptChannel(0)

    assert(EntChannelRespawn:IsChanneling(0) == false, "Channel should be interrupted")
    assert(deadHero.alive == false, "Ent should not respawn after interrupt")
    assert(EntGhost:IsGhost(1) == true, "Ghost should still exist after interrupt")
end

function TestEntChannelRespawn:test_respawned_ent_has_full_health()
    EntGhost:Init()
    EntChannelRespawn:Init()
    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)

    local deadHero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    deadHero.alive = false
    deadHero.hp = 0
    deadHero.playerID = 1
    deadHero.GetPlayerID = function() return 1 end

    EntGhost:CreateGhost(deadHero)
    EntChannelRespawn:StartChannel(0, 1)

    for i = 1, SETTINGS.ENT_CHANNEL_DURATION do
        EntChannelRespawn:ChannelThink()
    end

    assert(deadHero.hp == 500, "Respawned Ent should have full health")
end

function TestEntChannelRespawn:test_only_living_ent_can_channel()
    EntGhost:Init()
    EntChannelRespawn:Init()

    local deadHero1 = MockHero:New(SETTINGS.ENT_TEAM_ID)
    deadHero1.alive = false
    deadHero1.playerID = 1
    deadHero1.GetPlayerID = function() return 1 end

    local deadHero2 = MockHero:New(SETTINGS.ENT_TEAM_ID)
    deadHero2.alive = false
    deadHero2.playerID = 2
    deadHero2.GetPlayerID = function() return 2 end

    EntGhost:CreateGhost(deadHero1)
    EntGhost:CreateGhost(deadHero2)

    local success, err = EntChannelRespawn:StartChannel(2, 1)
    assert(success == false, "Ghost should not be able to channel")
    assert(err == "Ghost cannot channel", "Should report ghost cannot channel")
end

RunTests(TestEntChannelRespawn, "EntChannelRespawn")
