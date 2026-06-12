require("tests.test_framework")
require("addon_game_mode")

TestGameMode = {}

function TestGameMode:test_game_mode_initializes()
    local gameMode = CTreeTagGameMode()
    gameMode:InitGameMode()

    assert(gameMode.matchTimer == SETTINGS.MATCH_DURATION, "Match timer should be set to MATCH_DURATION")
    assert(gameMode.matchStarted == false, "Match should not be started on init")
end

function TestGameMode:test_team_limits_configured()
    local gameMode = CTreeTagGameMode()
    gameMode:InitGameMode()

    local entMax = GameRules:GetCustomGameTeamMaxPlayers(SETTINGS.ENT_TEAM_ID)
    local infernalMax = GameRules:GetCustomGameTeamMaxPlayers(SETTINGS.INFERNAL_TEAM_ID)

    assert(entMax == SETTINGS.TEAM_ENT_COUNT, "Ent team max should be " .. SETTINGS.TEAM_ENT_COUNT)
    assert(infernalMax == SETTINGS.TEAM_INFERNAL_COUNT, "Infernal team max should be " .. SETTINGS.TEAM_INFERNAL_COUNT)
end

function TestGameMode:test_timer_decrements()
    local gameMode = CTreeTagGameMode()
    gameMode:InitGameMode()
    gameMode.matchStarted = true

    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)
    local initialTimer = gameMode.matchTimer
    gameMode:OnThink()

    assert(gameMode.matchTimer == initialTimer - 1, "Timer should decrement by 1 each tick")
end

function TestGameMode:test_timer_expiry_triggers_win_condition()
    local gameMode = CTreeTagGameMode()
    gameMode:InitGameMode()
    gameMode.matchStarted = true
    gameMode.matchTimer = 1

    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)
    WinConditions:Init(gameMode)

    gameMode:OnThink()

    assert(WinConditions.matchEnded == true, "Match should end when timer expires")
end

RunTests(TestGameMode, "GameMode")
