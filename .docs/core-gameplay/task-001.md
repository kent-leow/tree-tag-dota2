# Task 001 — Game Mode Foundation

## Goal
Deliver the core game mode skeleton: asymmetric team assignment (9 Ents vs 3 Infernals), countdown timer, and win condition detection so that a match can start, run, and end correctly.

## Prerequisites
- None

## Tasks

### Game Mode Logic

- [ ] `scripts/vscripts/addon_game_mode.lua` — Replace template with Tree Tag game mode class: initialize game rules, set custom team limits, configure game timer duration as constant (new logic, existing file)
  - [ ] `scripts/vscripts/tests/test_game_mode.lua` — Verify game mode initializes without error, timer starts on game begin (new)

- [ ] `scripts/vscripts/team_assignment.lua` — Assign players to Ent (DOTA_TEAM_GOODGUYS) or Infernal (DOTA_TEAM_BADGUYS) teams with 9:3 ratio; handle <12 players gracefully (new)
  - [ ] `scripts/vscripts/tests/test_team_assignment.lua` — Verify ratio enforcement with 12, 8, and 4 players; verify no player left unassigned (new)

- [ ] `scripts/vscripts/win_conditions.lua` — Monitor elimination state: Ents win when timer expires with ≥1 alive OR all Infernals dead; Infernals win when all Ents dead; trigger game end with appropriate victor (new)
  - [ ] `scripts/vscripts/tests/test_win_conditions.lua` — Verify each win path triggers correctly: timer expiry with Ent alive, all Infernals eliminated, all Ents eliminated (new)

### Configuration

- [ ] `scripts/vscripts/settings.lua` — Central config: MATCH_DURATION, TEAM_ENT_COUNT, TEAM_INFERNAL_COUNT, ENT_TEAM_ID, INFERNAL_TEAM_ID (new)

### Localization

- [ ] `resource/addon_english.txt` — Add game name, team names, win/loss messages, timer UI labels (existing file, replace template content)

## Done When
- [ ] A 12-player lobby starts with 9 Ents and 3 Infernals on separate teams
- [ ] A visible countdown timer runs for the configured duration
- [ ] Match ends with Ent victory when timer reaches zero with Ents alive
- [ ] Match ends with Infernal victory when all Ents are eliminated
- [ ] All new and modified tests pass
- [ ] No existing tests broken
