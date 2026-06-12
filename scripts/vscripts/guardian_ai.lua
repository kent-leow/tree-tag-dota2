require("settings")

GuardianAI = GuardianAI or {}

function GuardianAI:Init()
    GameRules:GetGameModeEntity():SetThink("GuardianAIThink", self, "GuardianAIThink", 1)
end

function GuardianAI:GuardianAIThink()
    if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        return 1
    end

    local guardians = FindUnitsInRadius(SETTINGS.ENT_TEAM_ID, Vector(0, 0, 0), nil, 99999,
        DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

    for _, guardian in pairs(guardians) do
        if guardian.patrolCenter then
            self:UpdateGuardian(guardian)
        end
    end

    return 1
end

function GuardianAI:UpdateGuardian(guardian)
    local patrolCenter = guardian.patrolCenter
    local currentPos = guardian:GetAbsOrigin()
    local distFromBase = (currentPos - patrolCenter):Length2D()

    -- Leash: return to patrol if pulled too far
    if distFromBase > SETTINGS.GUARDIAN_LEASH_DISTANCE then
        guardian:MoveToPosition(patrolCenter)
        return
    end

    -- Check for enemies in patrol radius
    local enemies = FindUnitsInRadius(guardian:GetTeamNumber(), patrolCenter, nil, SETTINGS.GUARDIAN_PATROL_RADIUS,
        DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

    if #enemies > 0 then
        local target = enemies[1]
        guardian:MoveToTargetToAttack(target)
    else
        -- Patrol: move to random point within patrol radius if idle
        if not guardian.isPatrolling then
            local offset = Vector(
                math.random(-SETTINGS.GUARDIAN_PATROL_RADIUS, SETTINGS.GUARDIAN_PATROL_RADIUS) * 0.5,
                math.random(-SETTINGS.GUARDIAN_PATROL_RADIUS, SETTINGS.GUARDIAN_PATROL_RADIUS) * 0.5,
                0
            )
            guardian:MoveToPosition(patrolCenter + offset)
            guardian.isPatrolling = true
        end
    end
end

return GuardianAI
