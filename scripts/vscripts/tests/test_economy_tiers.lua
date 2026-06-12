require("tests.test_framework")
require("economy_tiers")

TestEconomyTiers = {}

function TestEconomyTiers:test_tier_promotion_at_threshold()
    Economy:Init()
    EconomyTiers:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, SETTINGS.TIER_THRESHOLDS[2], 0)

    EconomyTiers:CheckTierPromotion(0)

    assert(Economy:GetTier(0) == 2, "Player should be promoted to tier 2")
end

function TestEconomyTiers:test_income_rate_changes_per_tier()
    Economy:Init()
    Economy:RegisterPlayer(0)
    Economy:SetTier(0, 3)

    MockGameRules:SetState(DOTA_GAMERULES_STATE_GAME_IN_PROGRESS)
    Economy:EconomyThink()

    local balance = Economy:GetBalance(0)
    assert(balance.gold == SETTINGS.TIER_INCOME_RATES[3].gold, "Should earn tier 3 gold rate")
end

function TestEconomyTiers:test_tier_up_event_fires()
    Economy:Init()
    EconomyTiers:Init()
    Economy:RegisterPlayer(0)

    local eventFired = false
    EconomyTiers:RegisterListener("tier_up", function(data)
        eventFired = true
        assert(data.playerID == 0, "Event should have correct playerID")
        assert(data.newTier == 2, "Event should report new tier")
    end)

    Economy:Earn(0, SETTINGS.TIER_THRESHOLDS[2], 0)
    EconomyTiers:CheckTierPromotion(0)

    assert(eventFired, "tier_up event should fire")
end

function TestEconomyTiers:test_no_promotion_below_threshold()
    Economy:Init()
    EconomyTiers:Init()
    Economy:RegisterPlayer(0)
    Economy:Earn(0, SETTINGS.TIER_THRESHOLDS[2] - 1, 0)

    EconomyTiers:CheckTierPromotion(0)

    assert(Economy:GetTier(0) == 1, "Player should remain at tier 1")
end

RunTests(TestEconomyTiers, "EconomyTiers")
