require("tests.test_framework")
require("guardian_spawner")

TestGuardianSpawner = {}

function TestGuardianSpawner:test_spawn_interval_timing()
    assert(SETTINGS.GUARDIAN_SPAWN_INTERVAL == 30, "Guardians should spawn every 30 seconds")
end

function TestGuardianSpawner:test_cap_enforcement_per_building()
    GuardianSpawner:Init()
    local building = { unit = "bld1", playerID = 0, buildingType = "military", tier = 1, position = Vector(0, 0, 0) }
    local buildingKey = tostring(building.unit)

    GuardianSpawner.buildingGuardians[buildingKey] = SETTINGS.GUARDIAN_CAP_PER_BUILDING
    GuardianSpawner.guardianCounts[0] = 0

    GuardianSpawner:TrySpawnGuardian(building)

    assert(GuardianSpawner.guardianCounts[0] == 0, "Should not spawn past building cap")
end

function TestGuardianSpawner:test_cap_enforcement_per_player()
    GuardianSpawner:Init()
    local building = { unit = "bld2", playerID = 0, buildingType = "military", tier = 1, position = Vector(0, 0, 0) }

    GuardianSpawner.guardianCounts[0] = SETTINGS.GUARDIAN_CAP_PER_PLAYER

    GuardianSpawner:TrySpawnGuardian(building)

    assert(GuardianSpawner.guardianCounts[0] == SETTINGS.GUARDIAN_CAP_PER_PLAYER, "Should not exceed player cap")
end

function TestGuardianSpawner:test_ownership_assignment()
    GuardianSpawner:Init()
    local building = { unit = "bld3", playerID = 2, buildingType = "military", tier = 1, position = Vector(100, 100, 0) }

    GuardianSpawner:TrySpawnGuardian(building)

    assert(MockCreateUnit.lastCreated ~= nil, "Guardian should be spawned")
    assert(MockCreateUnit.lastCreated.team == SETTINGS.ENT_TEAM_ID, "Guardian should be on Ent team")
end

RunTests(TestGuardianSpawner, "GuardianSpawner")
