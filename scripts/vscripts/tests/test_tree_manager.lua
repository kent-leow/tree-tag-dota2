require("tests.test_framework")
require("tree_manager")

TestTreeManager = {}

function TestTreeManager:test_init_clears_state()
    TreeManager:Init()
    assert(#TreeManager.destroyedTrees == 0, "Destroyed trees should be empty after init")
end

function TestTreeManager:test_get_trees_in_radius()
    TreeManager:Init()
    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
        { pos = Vector(200, 200, 0), standing = true },
        { pos = Vector(1000, 1000, 0), standing = true },
    })

    local trees = TreeManager:GetTreesInRadius(Vector(150, 150, 0), 200)
    assert(#trees >= 1, "Should find trees within radius")
end

function TestTreeManager:test_destroy_trees_removes_standing()
    TreeManager:Init()
    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
        { pos = Vector(150, 150, 0), standing = true },
    })

    local count = TreeManager:DestroyTreesInRadius(Vector(125, 125, 0), 200)
    assert(count == 2, "Should destroy 2 trees, got " .. count)
    assert(#TreeManager.destroyedTrees == 2, "Should track 2 destroyed trees")
end

function TestTreeManager:test_regrow_restores_trees()
    TreeManager:Init()
    TreeManager.destroyedTrees = {
        { position = Vector(100, 100, 0), destroyedAt = 0 },
        { position = Vector(150, 150, 0), destroyedAt = 0 },
    }

    local regrown = TreeManager:RegrowTreesInRadius(Vector(125, 125, 0), 200)
    assert(regrown == 2, "Should regrow 2 trees")
    assert(#TreeManager.destroyedTrees == 0, "Destroyed list should be empty after regrow")
end

function TestTreeManager:test_event_emitted_on_destroy()
    TreeManager:Init()
    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
    })

    local eventFired = false
    TreeManager:RegisterListener("trees_destroyed", function(data)
        eventFired = true
        assert(data.count == 1, "Event should report 1 tree destroyed")
    end)

    TreeManager:DestroyTreesInRadius(Vector(100, 100, 0), 200)
    assert(eventFired, "trees_destroyed event should fire")
end

function TestTreeManager:test_event_emitted_on_regrow()
    TreeManager:Init()
    TreeManager.destroyedTrees = {
        { position = Vector(100, 100, 0), destroyedAt = 0 },
    }

    local eventFired = false
    TreeManager:RegisterListener("trees_regrown", function(data)
        eventFired = true
    end)

    TreeManager:RegrowTreesInRadius(Vector(100, 100, 0), 200)
    assert(eventFired, "trees_regrown event should fire")
end

function TestTreeManager:test_normal_burn_radius_without_rage()
    TreeManager:Init()
    local radius = TreeManager:GetEffectiveBurnRadius()
    assert(radius == SETTINGS.TREE_BURN_RADIUS, "Normal burn radius should equal TREE_BURN_RADIUS")
end

function TestTreeManager:test_expanded_burn_radius_during_rage()
    TreeManager:Init()
    TreeManager:SetRageMultiplier(SETTINGS.RAGE_BURN_RADIUS_MULTIPLIER)

    local radius = TreeManager:GetEffectiveBurnRadius()
    local expected = SETTINGS.TREE_BURN_RADIUS * SETTINGS.RAGE_BURN_RADIUS_MULTIPLIER
    assert(radius == expected, "Rage burn radius should be " .. expected .. ", got " .. radius)
end

RunTests(TestTreeManager, "TreeManager")
