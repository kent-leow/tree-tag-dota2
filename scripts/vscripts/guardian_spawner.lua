require("settings")
require("building_system")

GuardianSpawner = GuardianSpawner or {}

GuardianSpawner.guardianCounts = {}
GuardianSpawner.buildingGuardians = {}

function GuardianSpawner:Init()
    self.guardianCounts = {}
    self.buildingGuardians = {}
    GameRules:GetGameModeEntity():SetThink("GuardianSpawnThink", self, "GuardianSpawnThink", SETTINGS.GUARDIAN_SPAWN_INTERVAL)
end

function GuardianSpawner:GuardianSpawnThink()
    if GameRules:State_Get() ~= DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
        return SETTINGS.GUARDIAN_SPAWN_INTERVAL
    end

    for _, building in pairs(BuildingSystem.buildings) do
        if building.buildingType == "military" then
            self:TrySpawnGuardian(building)
        end
    end

    return SETTINGS.GUARDIAN_SPAWN_INTERVAL
end

function GuardianSpawner:TrySpawnGuardian(building)
    local playerID = building.playerID
    local buildingKey = tostring(building.unit)

    if not self.buildingGuardians[buildingKey] then
        self.buildingGuardians[buildingKey] = 0
    end
    if not self.guardianCounts[playerID] then
        self.guardianCounts[playerID] = 0
    end

    if self.buildingGuardians[buildingKey] >= SETTINGS.GUARDIAN_CAP_PER_BUILDING then
        return
    end
    if self.guardianCounts[playerID] >= SETTINGS.GUARDIAN_CAP_PER_PLAYER then
        return
    end

    local unitName = self:GetGuardianUnitName(building.tier)
    local guardian = CreateUnitByName(unitName, building.position, true, nil, nil, SETTINGS.ENT_TEAM_ID)

    guardian.spawnBuilding = building
    guardian.patrolCenter = building.position

    self.buildingGuardians[buildingKey] = self.buildingGuardians[buildingKey] + 1
    self.guardianCounts[playerID] = self.guardianCounts[playerID] + 1
end

function GuardianSpawner:GetGuardianUnitName(tier)
    if tier >= 3 then return "npc_dota_guardian_t3" end
    if tier >= 2 then return "npc_dota_guardian_t2" end
    return "npc_dota_guardian_t1"
end

function GuardianSpawner:OnGuardianKilled(guardian)
    local building = guardian.spawnBuilding
    if building then
        local buildingKey = tostring(building.unit)
        if self.buildingGuardians[buildingKey] then
            self.buildingGuardians[buildingKey] = math.max(0, self.buildingGuardians[buildingKey] - 1)
        end
        if self.guardianCounts[building.playerID] then
            self.guardianCounts[building.playerID] = math.max(0, self.guardianCounts[building.playerID] - 1)
        end
    end
end

return GuardianSpawner
