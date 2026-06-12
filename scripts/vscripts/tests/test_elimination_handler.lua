require("tests.test_framework")
require("elimination_handler")

-- Mock CustomGameEventManager
CustomGameEventManager = {}
function CustomGameEventManager:Send_ServerToAllClients(event, data) end

TestEliminationHandler = {}

function TestEliminationHandler:test_permanent_elimination_state()
    EliminationHandler:Init()
    Snowball:Init()

    local hero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    hero.playerID = 3
    hero.GetPlayerID = function() return 3 end
    hero.GetUnitName = function() return "npc_dota_hero_ent" end

    EliminationHandler:OnEntEliminated(hero)

    assert(EliminationHandler:IsEliminated(3) == true, "Player should be permanently eliminated")
end

function TestEliminationHandler:test_snowball_trigger()
    EliminationHandler:Init()
    Snowball:Init()

    local hero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    hero.playerID = 0
    hero.GetPlayerID = function() return 0 end
    hero.GetUnitName = function() return "npc_dota_hero_ent" end

    MockHeroList:SetHeroes({
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    EliminationHandler:OnEntEliminated(hero)

    assert(Snowball.killCount == 1, "Snowball should trigger on Ent elimination")
end

function TestEliminationHandler:test_win_condition_check_on_death()
    EliminationHandler:Init()
    Snowball:Init()
    WinConditions.matchEnded = false

    MockHeroList:SetHeroes({
        { team = SETTINGS.ENT_TEAM_ID, alive = false },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    local hero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    hero.playerID = 0
    hero.GetPlayerID = function() return 0 end
    hero.GetUnitName = function() return "npc_dota_hero_ent" end

    EliminationHandler:OnEntEliminated(hero)

    assert(WinConditions.matchEnded == true, "Win condition should be checked after elimination")
end

function TestEliminationHandler:test_announcement_fires()
    -- Verified via CustomGameEventManager:Send_ServerToAllClients call
    EliminationHandler:Init()
    Snowball:Init()

    local announced = false
    CustomGameEventManager.Send_ServerToAllClients = function(self, event, data)
        if event == "ent_eliminated" then announced = true end
    end

    local hero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    hero.playerID = 0
    hero.GetPlayerID = function() return 0 end
    hero.GetUnitName = function() return "npc_dota_hero_ent" end

    MockHeroList:SetHeroes({
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    EliminationHandler:OnEntEliminated(hero)
    assert(announced == true, "Elimination announcement should fire")
end

RunTests(TestEliminationHandler, "EliminationHandler")
