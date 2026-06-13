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
        giant_tree = {
            unitName = "npc_dota_building_giant_tree",
            costs = {
                { gold = 150, lumber = 0 },
            },
            tierGates = { 1 },
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

    -- Kill Resource
    KILL_VALUE_PER_ENT = 3,
    KILL_VALUE_PER_CREEP = 1,
    KILL_VALUE_PER_GUARDIAN = 2,

    -- Wisp
    WISP_SPAWN_COST = 80,
    WISP_HARVEST_RATE = 3,
    WISP_HARVEST_INTERVAL = 10,

    -- Tavern
    TAVERN_MELEE_COST = 150,
    TAVERN_RANGED_COST = 200,
    TAVERN_CREEP_CAP = 3,
    TAVERN_MELEE_DAMAGE = 9999,
    TAVERN_RANGED_DAMAGE = 250,

    -- Respawn
    INFERNAL_RESPAWN_BASE = 15,
    INFERNAL_RESPAWN_PER_KILL = 10,
    ENT_GHOST_MOVE_RADIUS = 500,
    ENT_CHANNEL_DURATION = 5,
    MAP_CENTRE_POSITION = Vector(0, 0, 0),

    -- Game Flow
    ENT_HEAD_START_DURATION = 15,
    INFERNAL_PICK_TIME = 30,

    -- Rage Phase
    RAGE_TRIGGER_TIME = 180,
    RAGE_BURN_RADIUS_MULTIPLIER = 3.0,
    RAGE_SPEED_BONUS = 100,

    -- Team Config
    MIN_INFERNALS = 1,
    MAX_INFERNALS = 3,
    MIN_ENTS = 1,
    MAX_ENTS = 9,
    MAX_TOTAL_PLAYERS = 12,
    BALANCE_SCALING = {
        { infernals = 1, ents = 9, income_mult = 1.5, snowball_mult = 0.7, timer_mult = 0.8 },
        { infernals = 2, ents = 9, income_mult = 1.2, snowball_mult = 0.85, timer_mult = 0.9 },
        { infernals = 3, ents = 9, income_mult = 1.0, snowball_mult = 1.0, timer_mult = 1.0 },
        { infernals = 3, ents = 3, income_mult = 0.8, snowball_mult = 1.2, timer_mult = 0.6 },
        { infernals = 2, ents = 2, income_mult = 0.8, snowball_mult = 1.2, timer_mult = 0.5 },
        { infernals = 1, ents = 1, income_mult = 0.6, snowball_mult = 1.5, timer_mult = 0.4 },
    },

    -- Resource Exchange
    EXCHANGE_DEFS = {
        advanced_guardian = { lumber = 50, kill = 0, unitName = "npc_dota_guardian_t2" },
        elite_guardian = { lumber = 0, kill = 5, unitName = "npc_dota_guardian_t3" },
        fortified_barrier = { lumber = 100, kill = 3, buildingType = "defensive" },
    },
}

return SETTINGS
