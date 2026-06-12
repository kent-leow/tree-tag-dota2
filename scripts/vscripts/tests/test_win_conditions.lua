require("tests.test_framework")
require("win_conditions")

TestWinConditions = {}

function TestWinConditions:test_ents_win_on_timer_expiry_with_ent_alive()
    WinConditions.matchEnded = false
    MockHeroList:SetHeroes({
        { team = SETTINGS.ENT_TEAM_ID, alive = true },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    WinConditions:OnTimerExpired()

    assert(WinConditions.matchEnded == true, "Match should end")
    assert(MockGameRules.winner == SETTINGS.ENT_TEAM_ID, "Ents should win on timer expiry")
end

function TestWinConditions:test_infernals_win_when_all_ents_dead()
    WinConditions.matchEnded = false
    MockHeroList:SetHeroes({
        { team = SETTINGS.ENT_TEAM_ID, alive = false },
        { team = SETTINGS.ENT_TEAM_ID, alive = false },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    WinConditions:CheckEliminationVictory()

    assert(WinConditions.matchEnded == true, "Match should end")
    assert(MockGameRules.winner == SETTINGS.INFERNAL_TEAM_ID, "Infernals should win when all Ents are ghosts/dead")
end

function TestWinConditions:test_infernal_death_does_not_trigger_ent_win()
    WinConditions.matchEnded = false
    MockHeroList:SetHeroes({
        { team = SETTINGS.ENT_TEAM_ID, alive = true },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = false },
    })

    WinConditions:CheckEliminationVictory()

    assert(WinConditions.matchEnded == false, "Infernal death should NOT trigger Ent win (Infernals always respawn)")
end

function TestWinConditions:test_match_continues_while_any_ent_alive()
    WinConditions.matchEnded = false
    MockHeroList:SetHeroes({
        { team = SETTINGS.ENT_TEAM_ID, alive = true },
        { team = SETTINGS.ENT_TEAM_ID, alive = false },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    WinConditions:CheckEliminationVictory()

    assert(WinConditions.matchEnded == false, "Match should continue while any Ent alive")
end

RunTests(TestWinConditions, "WinConditions")
