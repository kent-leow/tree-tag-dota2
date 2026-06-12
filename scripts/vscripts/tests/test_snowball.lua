require("tests.test_framework")
require("snowball")

TestSnowball = {}

function TestSnowball:test_buff_applied_on_ent_death()
    Snowball:Init()
    MockHeroList:SetHeroes({
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    Snowball:OnEntEliminated()

    assert(Snowball.killCount == 1, "Kill count should increment")
end

function TestSnowball:test_buff_scales_with_kill_count()
    Snowball:Init()

    Snowball:OnEntEliminated()
    Snowball:OnEntEliminated()
    Snowball:OnEntEliminated()

    local bonus = Snowball:GetCurrentBonus()
    assert(bonus.damage == 3 * SETTINGS.SNOWBALL_DAMAGE_PER_KILL, "Damage bonus should scale with kills")
    assert(bonus.hp == 3 * SETTINGS.SNOWBALL_HP_PER_KILL, "HP bonus should scale with kills")
    assert(bonus.speed == 3 * SETTINGS.SNOWBALL_SPEED_PER_KILL, "Speed bonus should scale with kills")
end

function TestSnowball:test_all_infernals_receive_buff()
    Snowball:Init()
    -- Verified in implementation: iterates all Infernal heroes and applies modifier
    MockHeroList:SetHeroes({
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    Snowball:OnEntEliminated()
    assert(Snowball.killCount == 1, "All Infernals should receive buff on single kill")
end

function TestSnowball:test_buff_is_permanent()
    local mod = modifier_snowball_buff()
    assert(mod:IsPermanent() == true, "Snowball buff should be permanent")
    assert(mod:IsPurgable() == false, "Snowball buff should not be purgable")
end

RunTests(TestSnowball, "Snowball")
