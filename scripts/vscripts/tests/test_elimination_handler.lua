require("tests.test_framework")
require("elimination_handler")

-- Mock CustomGameEventManager
CustomGameEventManager = {}
function CustomGameEventManager:Send_ServerToAllClients(event, data) end

TestEliminationHandler = {}

function TestEliminationHandler:test_ent_death_creates_ghost()
    EliminationHandler:Init()
    EntGhost:Init()
    InfernalRespawn:Init()
    Snowball:Init()
    WinConditions.matchEnded = false

    local hero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    hero.playerID = 3
    hero.GetPlayerID = function() return 3 end
    hero.GetUnitName = function() return "npc_dota_hero_ent" end

    MockHeroList:SetHeroes({
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    EliminationHandler:OnEntEliminated(hero)

    assert(EntGhost:IsGhost(3) == true, "Ent death should create ghost")
end

function TestEliminationHandler:test_infernal_death_triggers_respawn_timer()
    EliminationHandler:Init()
    EntGhost:Init()
    InfernalRespawn:Init()
    Snowball:Init()

    local hero = MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
    hero.playerID = 0
    hero.alive = false
    hero.GetPlayerID = function() return 0 end

    EliminationHandler:OnInfernalKilled(hero)

    assert(#InfernalRespawn.pendingRespawns == 1, "Infernal death should trigger respawn timer")
end

function TestEliminationHandler:test_snowball_trigger()
    EliminationHandler:Init()
    EntGhost:Init()
    InfernalRespawn:Init()
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

function TestEliminationHandler:test_count_excludes_ghosts()
    EliminationHandler:Init()
    EntGhost:Init()
    InfernalRespawn:Init()
    Snowball:Init()
    WinConditions.matchEnded = false

    local hero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    hero.playerID = 0
    hero.GetPlayerID = function() return 0 end
    hero.GetUnitName = function() return "npc_dota_hero_ent" end

    MockHeroList:SetHeroes({
        { team = SETTINGS.ENT_TEAM_ID, alive = true },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    EntGhost:CreateGhost(hero)

    local count = EliminationHandler:CountRemainingEnts()
    assert(count == 1, "Count should exclude ghosts, got " .. count)
end

function TestEliminationHandler:test_announcement_fires()
    EliminationHandler:Init()
    EntGhost:Init()
    InfernalRespawn:Init()
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
