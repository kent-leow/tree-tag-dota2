require("settings")
require("economy")

KillReward = KillReward or {}

function KillReward:Init()
    ListenToGameEvent("entity_killed", Dynamic_Wrap(KillReward, "OnEntityKilled"), self)
end

function KillReward:OnEntityKilled(event)
    local killedUnit = EntIndexToHScript(event.entindex_killed)
    local killerUnit = event.entindex_attacker and EntIndexToHScript(event.entindex_attacker) or nil

    if not killerUnit then return end
    if not killedUnit then return end

    local killerTeam = killerUnit:GetTeamNumber()
    local killedTeam = killedUnit:GetTeamNumber()

    if killerTeam == killedTeam then return end

    local killerPlayerID = killerUnit:GetPlayerID()
    if killerPlayerID == nil or killerPlayerID < 0 then return end

    local killValue = self:GetKillValue(killedUnit)
    if killValue > 0 then
        Economy:EarnKill(killerPlayerID, killValue)
    end
end

function KillReward:GetKillValue(unit)
    local unitName = unit:GetUnitName()

    if unit:IsRealHero() then
        if unit:GetTeamNumber() == SETTINGS.ENT_TEAM_ID then
            return SETTINGS.KILL_VALUE_PER_ENT
        end
    end

    if unitName and (unitName == "npc_dota_hired_melee" or unitName == "npc_dota_hired_ranged") then
        return SETTINGS.KILL_VALUE_PER_CREEP
    end

    if unitName and (unitName == "npc_dota_guardian_t1" or unitName == "npc_dota_guardian_t2" or unitName == "npc_dota_guardian_t3") then
        return SETTINGS.KILL_VALUE_PER_GUARDIAN
    end

    return 0
end

return KillReward
