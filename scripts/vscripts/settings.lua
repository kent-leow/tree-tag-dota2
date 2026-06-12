SETTINGS = {
    MATCH_DURATION = 1200,
    TEAM_ENT_COUNT = 9,
    TEAM_INFERNAL_COUNT = 3,
    ENT_TEAM_ID = DOTA_TEAM_GOODGUYS,
    INFERNAL_TEAM_ID = DOTA_TEAM_BADGUYS,

    -- Snowball & Balance
    SNOWBALL_DAMAGE_PER_KILL = 10,
    SNOWBALL_HP_PER_KILL = 50,
    SNOWBALL_SPEED_PER_KILL = 5,
    BALANCE_CROSSOVER_MINUTE = 12,
    INFERNAL_EARLY_POWER_MULT = 2.0,

    -- Guardians
    GUARDIAN_SPAWN_INTERVAL = 30,
    GUARDIAN_CAP_PER_BUILDING = 3,
    GUARDIAN_CAP_PER_PLAYER = 8,
    GUARDIAN_PATROL_RADIUS = 600,
    GUARDIAN_LEASH_DISTANCE = 900,

    -- Tree System
    TREE_REGROWTH_DELAY = 60,
    TREE_BURN_RADIUS = 300,
    TREE_REGROWTH_RADIUS = 400,

    -- Buildings
    BUILDING_DEFS = {
        economy = {
            unitName = "npc_dota_building_nature_shrine",
            costs = {
                { gold = 100, lumber = 50 },
                { gold = 250, lumber = 120 },
                { gold = 500, lumber = 250 },
            },
            incomeBonus = {
                { gold = 3, lumber = 1 },
                { gold = 6, lumber = 2 },
                { gold = 10, lumber = 4 },
            },
            tierGates = { 1, 2, 3 },
        },
        defensive = {
            unitName = "npc_dota_building_root_barrier",
            costs = {
                { gold = 150, lumber = 80 },
                { gold = 300, lumber = 150 },
                { gold = 600, lumber = 300 },
            },
            tierGates = { 1, 2, 3 },
        },
        healing = {
            unitName = "npc_dota_building_healing_grove",
            costs = {
                { gold = 120, lumber = 60 },
                { gold = 280, lumber = 130 },
                { gold = 550, lumber = 270 },
            },
            tierGates = { 1, 2, 3 },
        },
        military = {
            unitName = "npc_dota_building_guardian_barracks",
            costs = {
                { gold = 200, lumber = 100 },
                { gold = 400, lumber = 200 },
                { gold = 800, lumber = 400 },
            },
            tierGates = { 1, 2, 3 },
        },
    },

    -- Economy
    INCOME_TICK_INTERVAL = 10,
    BASE_INCOME_RATE = { gold = 5, lumber = 2 },
    TIER_THRESHOLDS = { 0, 500, 1500, 4000 },
    TIER_INCOME_RATES = {
        { gold = 5, lumber = 2 },
        { gold = 10, lumber = 4 },
        { gold = 18, lumber = 7 },
        { gold = 30, lumber = 12 },
    },
}

return SETTINGS
