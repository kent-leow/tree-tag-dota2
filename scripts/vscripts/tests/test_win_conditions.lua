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

function TestWinConditions:test_infernals_win_when_all_ents_eliminated()
    WinConditions.matchEnded = false
    MockHeroList:SetHeroes({
        { team = SETTINGS.ENT_TEAM_ID, alive = false },
        { team = SETTINGS.ENT_TEAM_ID, alive = false },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    WinConditions:CheckEliminationVictory()

    assert(WinConditions.matchEnded == true, "Match should end")
    assert(MockGameRules.winner == SETTINGS.INFERNAL_TEAM_ID, "Infernals should win when all Ents dead")
end

function TestWinConditions:test_ents_win_when_all_infernals_eliminated()
    WinConditions.matchEnded = false
    MockHeroList:SetHeroes({
        { team = SETTINGS.ENT_TEAM_ID, alive = true },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = false },
    })

    WinConditions:CheckEliminationVictory()

    assert(WinConditions.matchEnded == true, "Match should end")
    assert(MockGameRules.winner == SETTINGS.ENT_TEAM_ID, "Ents should win when all Infernals dead")
end

function TestWinConditions:test_no_victory_while_both_teams_alive()
    WinConditions.matchEnded = false
    MockHeroList:SetHeroes({
        { team = SETTINGS.ENT_TEAM_ID, alive = true },
        { team = SETTINGS.INFERNAL_TEAM_ID, alive = true },
    })

    WinConditions:CheckEliminationVictory()

    assert(WinConditions.matchEnded == false, "Match should not end while both teams alive")
end

RunTests(TestWinConditions, "WinConditions")
