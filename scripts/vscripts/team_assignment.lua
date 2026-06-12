require("settings")

TeamAssignment = TeamAssignment or {}

TeamAssignment.configuredInfernals = nil
TeamAssignment.configuredEnts = nil
TeamAssignment.isChallenge = false

function TeamAssignment:Configure(infernalCount, entCount)
    local valid, err = self:Validate(infernalCount, entCount)
    if not valid then return false, err end

    self.configuredInfernals = infernalCount
    self.configuredEnts = entCount
    self.isChallenge = self:IsUnbalanced(infernalCount, entCount)

    return true, nil
end

function TeamAssignment:Validate(infernalCount, entCount)
    if infernalCount < SETTINGS.MIN_INFERNALS then
        return false, "Too few Infernals (min " .. SETTINGS.MIN_INFERNALS .. ")"
    end
    if infernalCount > SETTINGS.MAX_INFERNALS then
        return false, "Too many Infernals (max " .. SETTINGS.MAX_INFERNALS .. ")"
    end
    if entCount < SETTINGS.MIN_ENTS then
        return false, "Too few Ents (min " .. SETTINGS.MIN_ENTS .. ")"
    end
    if entCount > SETTINGS.MAX_ENTS then
        return false, "Too many Ents (max " .. SETTINGS.MAX_ENTS .. ")"
    end
    if infernalCount + entCount > SETTINGS.MAX_TOTAL_PLAYERS then
        return false, "Too many players (max " .. SETTINGS.MAX_TOTAL_PLAYERS .. ")"
    end
    return true, nil
end

function TeamAssignment:IsUnbalanced(infernalCount, entCount)
    local defaultRatio = SETTINGS.TEAM_INFERNAL_COUNT / SETTINGS.TEAM_ENT_COUNT
    local configuredRatio = infernalCount / entCount
    return math.abs(configuredRatio - defaultRatio) > 0.1
end

function TeamAssignment:AssignTeams()
    local players = {}
    for playerID = 0, PlayerResource:GetPlayerCount() - 1 do
        if PlayerResource:IsValidPlayerID(playerID) then
            table.insert(players, playerID)
        end
    end

    local totalPlayers = #players
    if totalPlayers == 0 then return end

    local infernalCount, entCount

    if self.configuredInfernals and self.configuredEnts then
        infernalCount = self.configuredInfernals
        entCount = self.configuredEnts
    else
        infernalCount = math.max(1, math.floor(totalPlayers * SETTINGS.TEAM_INFERNAL_COUNT / (SETTINGS.TEAM_ENT_COUNT + SETTINGS.TEAM_INFERNAL_COUNT)))
        entCount = totalPlayers - infernalCount
    end

    for i, playerID in ipairs(players) do
        if i <= entCount then
            PlayerResource:SetCustomTeamAssignment(playerID, SETTINGS.ENT_TEAM_ID)
        else
            PlayerResource:SetCustomTeamAssignment(playerID, SETTINGS.INFERNAL_TEAM_ID)
        end
    end

    if self.isChallenge then
        CustomGameEventManager:Send_ServerToAllClients("challenge_mode", {
            infernals = infernalCount,
            ents = entCount,
        })
    end

    return { ents = entCount, infernals = infernalCount }
end

return TeamAssignment
