require("tests.test_framework")
require("settings")

TestSettings = {}

function TestSettings:test_kill_resource_constants_exist()
    assert(SETTINGS.KILL_VALUE_PER_ENT ~= nil, "KILL_VALUE_PER_ENT should exist")
    assert(SETTINGS.KILL_VALUE_PER_CREEP ~= nil, "KILL_VALUE_PER_CREEP should exist")
    assert(SETTINGS.KILL_VALUE_PER_GUARDIAN ~= nil, "KILL_VALUE_PER_GUARDIAN should exist")
    assert(type(SETTINGS.KILL_VALUE_PER_ENT) == "number", "KILL_VALUE_PER_ENT should be number")
    assert(type(SETTINGS.KILL_VALUE_PER_CREEP) == "number", "KILL_VALUE_PER_CREEP should be number")
    assert(type(SETTINGS.KILL_VALUE_PER_GUARDIAN) == "number", "KILL_VALUE_PER_GUARDIAN should be number")
end

function TestSettings:test_kill_values_are_positive()
    assert(SETTINGS.KILL_VALUE_PER_ENT > 0, "KILL_VALUE_PER_ENT should be positive")
    assert(SETTINGS.KILL_VALUE_PER_CREEP > 0, "KILL_VALUE_PER_CREEP should be positive")
    assert(SETTINGS.KILL_VALUE_PER_GUARDIAN > 0, "KILL_VALUE_PER_GUARDIAN should be positive")
end

function TestSettings:test_kill_value_ordering()
    assert(SETTINGS.KILL_VALUE_PER_ENT > SETTINGS.KILL_VALUE_PER_GUARDIAN, "Ent kill should be worth more than guardian")
    assert(SETTINGS.KILL_VALUE_PER_GUARDIAN > SETTINGS.KILL_VALUE_PER_CREEP, "Guardian kill should be worth more than creep")
end

function TestSettings:test_wisp_constants_exist()
    assert(SETTINGS.WISP_SPAWN_COST ~= nil, "WISP_SPAWN_COST should exist")
    assert(SETTINGS.WISP_HARVEST_RATE ~= nil, "WISP_HARVEST_RATE should exist")
    assert(SETTINGS.WISP_HARVEST_INTERVAL ~= nil, "WISP_HARVEST_INTERVAL should exist")
    assert(type(SETTINGS.WISP_SPAWN_COST) == "number", "WISP_SPAWN_COST should be number")
    assert(type(SETTINGS.WISP_HARVEST_RATE) == "number", "WISP_HARVEST_RATE should be number")
    assert(type(SETTINGS.WISP_HARVEST_INTERVAL) == "number", "WISP_HARVEST_INTERVAL should be number")
end

function TestSettings:test_wisp_values_are_positive()
    assert(SETTINGS.WISP_SPAWN_COST > 0, "WISP_SPAWN_COST should be positive")
    assert(SETTINGS.WISP_HARVEST_RATE > 0, "WISP_HARVEST_RATE should be positive")
    assert(SETTINGS.WISP_HARVEST_INTERVAL > 0, "WISP_HARVEST_INTERVAL should be positive")
end

function TestSettings:test_giant_tree_building_def_exists()
    assert(SETTINGS.BUILDING_DEFS.giant_tree ~= nil, "giant_tree building def should exist")
    assert(SETTINGS.BUILDING_DEFS.giant_tree.unitName == "npc_dota_building_giant_tree", "giant_tree should have correct unit name")
    assert(SETTINGS.BUILDING_DEFS.giant_tree.costs[1].gold > 0, "giant_tree should have gold cost")
end

RunTests(TestSettings, "Settings")
