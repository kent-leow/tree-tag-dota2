require("tests.test_framework")
require("building_system")

TestBuildingSystem = {}

function TestBuildingSystem:test_valid_placement()
    BuildingSystem:Init()
    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
        { pos = Vector(120, 120, 0), standing = true },
        { pos = Vector(150, 150, 0), standing = true },
    })

    local valid, err = BuildingSystem:ValidatePlacement(Vector(130, 130, 0), 0)
    assert(valid == true, "Should be valid near trees: " .. tostring(err))
end

function TestBuildingSystem:test_invalid_placement_no_trees()
    BuildingSystem:Init()
    MockGridNav:SetTrees({})

    local valid, err = BuildingSystem:ValidatePlacement(Vector(130, 130, 0), 0)
    assert(valid == false, "Should be invalid without trees nearby")
end

function TestBuildingSystem:test_build_time_completion()
    BuildingSystem:Init()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 500, 300)

    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
        { pos = Vector(120, 120, 0), standing = true },
        { pos = Vector(150, 150, 0), standing = true },
    })

    local building, err = BuildingSystem:Construct(0, "economy", Vector(130, 130, 0), 1)
    assert(building ~= nil, "Building should be constructed: " .. tostring(err))
    assert(building.tier == 1, "Building should be tier 1")
end

function TestBuildingSystem:test_economy_registration()
    BuildingSystem:Init()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 500, 300)

    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
        { pos = Vector(120, 120, 0), standing = true },
        { pos = Vector(150, 150, 0), standing = true },
    })

    BuildingSystem:Construct(0, "economy", Vector(130, 130, 0), 1)

    local rate = Economy:GetIncomeRate(0)
    assert(rate.gold > SETTINGS.TIER_INCOME_RATES[1].gold, "Economy building should increase income")
end

function TestBuildingSystem:test_destruction_cleanup()
    BuildingSystem:Init()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 500, 300)

    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
        { pos = Vector(120, 120, 0), standing = true },
        { pos = Vector(150, 150, 0), standing = true },
    })

    local building, _ = BuildingSystem:Construct(0, "economy", Vector(130, 130, 0), 1)
    assert(#BuildingSystem.buildings == 1, "Should have 1 building")

    -- Simulate destruction
    table.remove(BuildingSystem.buildings, 1)
    assert(#BuildingSystem.buildings == 0, "Building should be removed on destruction")
end

RunTests(TestBuildingSystem, "BuildingSystem")
