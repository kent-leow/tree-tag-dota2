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

-- Mock CustomGameEventManager for challenge mode event
CustomGameEventManager = CustomGameEventManager or {}
function CustomGameEventManager:Send_ServerToAllClients(event, data) end

function TestTeamAssignment:test_custom_split_2v2()
    TeamAssignment.configuredInfernals = nil
    TeamAssignment.configuredEnts = nil
    local success, err = TeamAssignment:Configure(2, 2)
    assert(success == true, "2v2 should be valid: " .. (err or ""))

    MockPlayerResource:SetPlayerCount(4)
    local result = TeamAssignment:AssignTeams()

    assert(result.ents == 2, "Expected 2 Ents, got " .. result.ents)
    assert(result.infernals == 2, "Expected 2 Infernals, got " .. result.infernals)
end

function TestTeamAssignment:test_custom_split_1v9()
    TeamAssignment.configuredInfernals = nil
    TeamAssignment.configuredEnts = nil
    local success, err = TeamAssignment:Configure(1, 9)
    assert(success == true, "1v9 should be valid: " .. (err or ""))

    MockPlayerResource:SetPlayerCount(10)
    local result = TeamAssignment:AssignTeams()

    assert(result.ents == 9, "Expected 9 Ents, got " .. result.ents)
    assert(result.infernals == 1, "Expected 1 Infernal, got " .. result.infernals)
end

function TestTeamAssignment:test_custom_split_3v9()
    TeamAssignment.configuredInfernals = nil
    TeamAssignment.configuredEnts = nil
    local success, err = TeamAssignment:Configure(3, 9)
    assert(success == true, "3v9 should be valid: " .. (err or ""))

    MockPlayerResource:SetPlayerCount(12)
    local result = TeamAssignment:AssignTeams()

    assert(result.ents == 9, "Expected 9 Ents")
    assert(result.infernals == 3, "Expected 3 Infernals")
end

function TestTeamAssignment:test_validation_rejects_0_infernals()
    TeamAssignment.configuredInfernals = nil
    TeamAssignment.configuredEnts = nil
    local success, err = TeamAssignment:Configure(0, 9)
    assert(success == false, "0 Infernals should be rejected")
end

function TestTeamAssignment:test_validation_rejects_4_infernals()
    TeamAssignment.configuredInfernals = nil
    TeamAssignment.configuredEnts = nil
    local success, err = TeamAssignment:Configure(4, 9)
    assert(success == false, "4 Infernals should be rejected")
end

function TestTeamAssignment:test_validation_rejects_total_over_12()
    TeamAssignment.configuredInfernals = nil
    TeamAssignment.configuredEnts = nil
    local success, err = TeamAssignment:Configure(3, 10)
    assert(success == false, "Total > 12 should be rejected")
end

RunTests(TestTeamAssignment, "TeamAssignment")
