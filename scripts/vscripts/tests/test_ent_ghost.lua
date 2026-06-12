require("tests.test_framework")
require("ent_ghost")

TestEntGhost = {}

function TestEntGhost:test_ghost_spawns_at_map_centre()
    EntGhost:Init()

    local hero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    hero.playerID = 2
    hero.GetPlayerID = function() return 2 end

    local ghost = EntGhost:CreateGhost(hero)

    assert(ghost ~= nil, "Ghost should be created")
    assert(ghost.position.x == SETTINGS.MAP_CENTRE_POSITION.x, "Ghost should be at map centre X")
    assert(ghost.position.y == SETTINGS.MAP_CENTRE_POSITION.y, "Ghost should be at map centre Y")
end

function TestEntGhost:test_ghost_movement_restricted_to_radius()
    EntGhost:Init()

    local hero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    hero.playerID = 1
    hero.GetPlayerID = function() return 1 end

    EntGhost:CreateGhost(hero)

    local withinRadius = EntGhost:IsWithinMoveRadius(1, Vector(100, 100, 0))
    assert(withinRadius == true, "Position within radius should be valid")

    local outsideRadius = EntGhost:IsWithinMoveRadius(1, Vector(5000, 5000, 0))
    assert(outsideRadius == false, "Position outside radius should be invalid")
end

function TestEntGhost:test_ghost_cannot_attack()
    EntGhost:Init()

    local hero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    hero.playerID = 0
    hero.GetPlayerID = function() return 0 end

    local ghost = EntGhost:CreateGhost(hero)

    assert(ghost.canAttack == false, "Ghost should not be able to attack")
end

function TestEntGhost:test_ghost_tracks_correct_player_id()
    EntGhost:Init()

    local hero = MockHero:New(SETTINGS.ENT_TEAM_ID)
    hero.playerID = 5
    hero.GetPlayerID = function() return 5 end

    EntGhost:CreateGhost(hero)

    assert(EntGhost:IsGhost(5) == true, "Should track ghost for player 5")
    assert(EntGhost:IsGhost(3) == false, "Should not track ghost for player 3")
end

RunTests(TestEntGhost, "EntGhost")
