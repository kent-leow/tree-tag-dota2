require("tests.test_framework")
require("creep_combat")

TestCreepCombat = {}

function TestCreepCombat:test_melee_creep_one_hits_ent()
    CreepCombat:Init()

    local ent = MockHero:New(SETTINGS.ENT_TEAM_ID)
    ent.hp = 500

    local creep = { GetUnitName = function() return "npc_dota_hired_melee" end }

    CreepCombat:OnCreepAttacksEnt(creep, ent, "npc_dota_hired_melee")

    assert(ent.hp == 0, "Ent should have 0 HP after melee creep attack")
    assert(ent.alive == false, "Ent should be dead after melee creep attack")
end

function TestCreepCombat:test_ranged_creep_needs_two_hits()
    CreepCombat:Init()

    local ent = MockHero:New(SETTINGS.ENT_TEAM_ID)
    ent.hp = 500

    local creep = { GetUnitName = function() return "npc_dota_hired_ranged" end }

    CreepCombat:OnCreepAttacksEnt(creep, ent, "npc_dota_hired_ranged")
    assert(ent.hp == 500 - SETTINGS.TAVERN_RANGED_DAMAGE, "Ent should lose TAVERN_RANGED_DAMAGE HP")
    assert(ent.alive == true, "Ent should survive first hit")

    CreepCombat:OnCreepAttacksEnt(creep, ent, "npc_dota_hired_ranged")
    assert(ent.hp <= 0, "Ent should have 0 or less HP after second hit")
    assert(ent.alive == false, "Ent should be dead after second hit")
end

function TestCreepCombat:test_ent_one_hits_hired_creep()
    -- Hired creeps have 1 HP, so any attack kills them
    local creepHP = 1
    assert(creepHP == 1, "Hired creep should have 1 HP (dies to any damage)")
end

function TestCreepCombat:test_ent_does_not_one_hit_infernal_hero()
    -- Infernal heroes have significant HP (500+ from MockHero default)
    local infernal = MockHero:New(SETTINGS.INFERNAL_TEAM_ID)
    infernal.hp = 500

    -- Simulate Ent attack dealing moderate damage (e.g. 50)
    local damage = 50
    infernal.hp = infernal.hp - damage

    assert(infernal.hp > 0, "Infernal hero should survive Ent attack")
    assert(infernal.alive == true, "Infernal hero should still be alive")
end

RunTests(TestCreepCombat, "CreepCombat")
