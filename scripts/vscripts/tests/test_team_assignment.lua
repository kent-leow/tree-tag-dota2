require("tests.test_framework")
require("team_assignment")

TestTeamAssignment = {}

function TestTeamAssignment:test_12_players_assigns_9_ents_3_infernals()
    MockPlayerResource:SetPlayerCount(12)
    local result = TeamAssignment:AssignTeams()

    assert(result.ents == 9, "Expected 9 Ents, got " .. result.ents)
    assert(result.infernals == 3, "Expected 3 Infernals, got " .. result.infernals)
end

function TestTeamAssignment:test_8_players_assigns_proportionally()
    MockPlayerResource:SetPlayerCount(8)
    local result = TeamAssignment:AssignTeams()

    assert(result.ents + result.infernals == 8, "All players must be assigned")
    assert(result.infernals >= 1, "Must have at least 1 Infernal")
    assert(result.ents > result.infernals, "Ents should outnumber Infernals")
end

function TestTeamAssignment:test_4_players_assigns_proportionally()
    MockPlayerResource:SetPlayerCount(4)
    local result = TeamAssignment:AssignTeams()

    assert(result.ents + result.infernals == 4, "All players must be assigned")
    assert(result.infernals >= 1, "Must have at least 1 Infernal")
end

function TestTeamAssignment:test_no_player_left_unassigned()
    MockPlayerResource:SetPlayerCount(12)
    TeamAssignment:AssignTeams()

    for playerID = 0, 11 do
        local team = MockPlayerResource:GetTeamAssignment(playerID)
        assert(team == SETTINGS.ENT_TEAM_ID or team == SETTINGS.INFERNAL_TEAM_ID,
            "Player " .. playerID .. " must be assigned to a team")
    end
end

RunTests(TestTeamAssignment, "TeamAssignment")
