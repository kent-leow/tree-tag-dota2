require("tests.test_framework")
require("tree_regrowth")

TestTreeRegrowth = {}

function TestTreeRegrowth:test_passive_regrowth_after_delay()
    TreeManager:Init()
    TreeManager.destroyedTrees = {
        { position = Vector(100, 100, 0), destroyedAt = 0 },
    }

    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)
    MockGameRules.gameTime = SETTINGS.TREE_REGROWTH_DELAY + 1

    TreeRegrowth:RegrowthThink()

    assert(#TreeManager.destroyedTrees == 0, "Tree should be regrown after delay")
end

function TestTreeRegrowth:test_no_regrowth_before_delay()
    TreeManager:Init()
    TreeManager.destroyedTrees = {
        { position = Vector(100, 100, 0), destroyedAt = 50 },
    }

    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)
    MockGameRules.gameTime = 50 + SETTINGS.TREE_REGROWTH_DELAY - 1

    TreeRegrowth:RegrowthThink()

    assert(#TreeManager.destroyedTrees == 1, "Tree should not regrow before delay expires")
end

function TestTreeRegrowth:test_instant_regrow()
    TreeManager:Init()
    TreeManager.destroyedTrees = {
        { position = Vector(100, 100, 0), destroyedAt = 0 },
        { position = Vector(120, 120, 0), destroyedAt = 0 },
    }

    local regrown = TreeRegrowth:InstantRegrow(Vector(110, 110, 0), 200)
    assert(regrown == 2, "Instant regrow should restore all trees in radius")
    assert(#TreeManager.destroyedTrees == 0, "No destroyed trees should remain")
end

function TestTreeRegrowth:test_no_duplicate_regrowth()
    TreeManager:Init()
    -- No destroyed trees to regrow
    local regrown = TreeRegrowth:InstantRegrow(Vector(100, 100, 0), 200)
    assert(regrown == 0, "Should not regrow already-alive trees")
end

RunTests(TestTreeRegrowth, "TreeRegrowth")
