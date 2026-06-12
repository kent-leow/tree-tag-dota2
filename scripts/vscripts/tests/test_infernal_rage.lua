require("tests.test_framework")
require("infernal_rage")

CustomGameEventManager = CustomGameEventManager or {}
function CustomGameEventManager:Send_ServerToAllClients(event, data) end

TestInfernalRage = {}

function TestInfernalRage:test_rage_not_active_above_3_minutes()
    local gameMode = { matchTimer = 300 }
    InfernalRage:Init(gameMode)
    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)

    InfernalRage:RageCheckThink()

    assert(InfernalRage:IsActive() == false, "Rage should not be active above 3 minutes")
end

function TestInfernalRage:test_rage_triggers_at_3_minutes()
    local gameMode = { matchTimer = 180 }
    InfernalRage:Init(gameMode)
    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)

    MockHeroList:SetHeroes({
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    InfernalRage:RageCheckThink()

    assert(InfernalRage:IsActive() == true, "Rage should activate at 3 minutes remaining")
end

function TestInfernalRage:test_all_infernals_receive_speed_bonus()
    local gameMode = { matchTimer = 170 }
    InfernalRage:Init(gameMode)
    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)

    MockHeroList:SetHeroes({
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    InfernalRage:RageCheckThink()

    assert(InfernalRage:GetSpeedBonus() == SETTINGS.RAGE_SPEED_BONUS, "Speed bonus should be active")
end

function TestInfernalRage:test_burn_radius_multiplied()
    local gameMode = { matchTimer = 100 }
    InfernalRage:Init(gameMode)
    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)

    MockHeroList:SetHeroes({
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    InfernalRage:RageCheckThink()

    local mult = InfernalRage:GetBurnRadiusMultiplier()
    assert(mult == SETTINGS.RAGE_BURN_RADIUS_MULTIPLIER, "Burn radius should be multiplied during rage")
end

function TestInfernalRage:test_respawning_infernal_during_rage_gets_buff()
    local gameMode = { matchTimer = 100 }
    InfernalRage:Init(gameMode)
    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)

    MockHeroList:SetHeroes({
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    InfernalRage:RageCheckThink()

    local newHero = MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
    InfernalRage:OnInfernalRespawn(newHero)

    assert(newHero:HasModifier("modifier_infernal_rage") == true, "Respawning Infernal should get rage buff")
end

function TestInfernalRage:test_rage_persists_until_match_end()
    local gameMode = { matchTimer = 180 }
    InfernalRage:Init(gameMode)
    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)

    MockHeroList:SetHeroes({
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    InfernalRage:RageCheckThink()
    assert(InfernalRage:IsActive() == true, "Rage should be active")

    -- Timer continues ticking down
    gameMode.matchTimer = 60
    InfernalRage:RageCheckThink()
    assert(InfernalRage:IsActive() == true, "Rage should persist")
end

RunTests(TestInfernalRage, "InfernalRage")
