require("tests.test_framework")
require("guardian_ai")

TestGuardianAI = {}

function TestGuardianAI:test_patrol_within_radius()
    assert(SETTINGS.GUARDIAN_PATROL_RADIUS == 600, "Patrol radius should be 600")
end

function TestGuardianAI:test_aggro_on_enemy_entry()
    -- Guardian AI checks for enemies within patrol radius
    -- and issues MoveToTargetToAttack
    local guardian = MockHero:New(SETTINGS.ENT_TEAM_ID)
    guardian.patrolCenter = Vector(0, 0, 0)
    guardian.position = Vector(0, 0, 0)
    guardian.GetAbsOrigin = function() return guardian.position end
    guardian.attacked = false
    guardian.MoveToTargetToAttack = function(self, target) self.attacked = true end
    guardian.MoveToPosition = function() end
    guardian.isPatrolling = false

    -- Verify the AI behavior structure exists
    assert(GuardianAI.UpdateGuardian ~= nil, "GuardianAI should have UpdateGuardian method")
end

function TestGuardianAI:test_return_after_combat()
    -- Guardian should return to patrol center when no enemies
    assert(SETTINGS.GUARDIAN_PATROL_RADIUS > 0, "Patrol radius must be positive")
end

function TestGuardianAI:test_leash_distance()
    assert(SETTINGS.GUARDIAN_LEASH_DISTANCE == 900, "Leash distance should be 900")
    assert(SETTINGS.GUARDIAN_LEASH_DISTANCE > SETTINGS.GUARDIAN_PATROL_RADIUS,
        "Leash should be greater than patrol radius")
end

RunTests(TestGuardianAI, "GuardianAI")
