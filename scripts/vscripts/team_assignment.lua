require("settings")

TeamAssignment = TeamAssignment or {}

function TeamAssignment:AssignTeams()
    local players = {}
    for playerID = 0, PlayerResource:GetPlayerCount() - 1 do
        if PlayerResource:IsValidPlayerID(playerID) then
            table.insert(players, playerID)
        end
    end

    local totalPlayers = #players
    if totalPlayers == 0 then return end

    local infernalCount = math.max(1, math.floor(totalPlayers * SETTINGS.TEAM_INFERNAL_COUNT / (SETTINGS.TEAM_ENT_COUNT + SETTINGS.TEAM_INFERNAL_COUNT)))
    local entCount = totalPlayers - infernalCount

    for i, playerID in ipairs(players) do
        if i <= entCount then
            PlayerResource:SetCustomTeamAssignment(playerID, SETTINGS.ENT_TEAM_ID)
        else
            PlayerResource:SetCustomTeamAssignment(playerID, SETTINGS.INFERNAL_TEAM_ID)
        end
    end

    return { ents = entCount, infernals = infernalCount }
end

return TeamAssignment
