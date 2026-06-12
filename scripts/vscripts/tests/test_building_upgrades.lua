require("tests.test_framework")
require("building_upgrades")

TestBuildingUpgrades = {}

function TestBuildingUpgrades:test_upgrade_cost_increases()
    local costs = SETTINGS.BUILDING_DEFS.economy.costs
    assert(costs[2].gold > costs[1].gold, "T2 should cost more gold than T1")
    assert(costs[3].gold > costs[2].gold, "T3 should cost more gold than T2")
end

function TestBuildingUpgrades:test_tier_gate_enforcement()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 1000, 500)
    Economy:SetTier(0, 1)

    local buildingData = {
        buildingType = "economy",
        tier = 1,
        playerID = 0,
    }

    -- T2 requires economy tier 2
    local success, err = BuildingUpgrades:Upgrade(0, buildingData)
    assert(success == false, "Should fail: economy tier too low")
    assert(err == "Economy tier too low", "Error should mention tier gate")
end

function TestBuildingUpgrades:test_benefit_scaling_per_tier()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, 2000, 1000)
    Economy:SetTier(0, 2)

    MockGridNav:SetTrees({
        { pos = Vector(100, 100, 0), standing = true },
        { pos = Vector(120, 120, 0), standing = true },
        { pos = Vector(150, 150, 0), standing = true },
    })
    BuildingSystem:Init()

    local building, _ = BuildingSystem:Construct(0, "economy", Vector(130, 130, 0), 1)
    local rateBefore = Economy:GetIncomeRate(0)

    BuildingUpgrades:Upgrade(0, building)
    local rateAfter = Economy:GetIncomeRate(0)

    assert(rateAfter.gold > rateBefore.gold, "Upgraded building should provide more income")
end

RunTests(TestBuildingUpgrades, "BuildingUpgrades")
