# Task 006 — Customisable Team Composition

## Goal
Allow lobby hosts to configure any Infernal vs Ent split (1–3 Infernals, 1–9 Ents, total ≤ 12) including unbalanced "challenge" modes, with game systems scaling appropriately, verifiable by starting matches with non-default compositions.

## Prerequisites
- [ ] task-004.md completed

## Tasks

### Data Layer

- [ ] `scripts/vscripts/settings.lua` — Add TEAM_CONFIG settings: MIN_INFERNALS (1), MAX_INFERNALS (3), MIN_ENTS (1), MAX_ENTS (9), MAX_TOTAL_PLAYERS (12); add BALANCE_SCALING table mapping team ratios to economy/snowball/timer multipliers

### Team Assignment Refactor

- [ ] `scripts/vscripts/team_assignment.lua` — Refactor AssignTeams to accept configurable infernalCount and entCount from lobby settings (instead of fixed ratio); validate against MIN/MAX constraints; label unbalanced compositions as "challenge" via custom game event
  - [ ] `scripts/vscripts/tests/test_team_assignment.lua` — Test custom split 2v2; test custom split 1v9; test custom split 3v9; test validation rejects 0 Infernals; test validation rejects 4 Infernals; test validation rejects total > 12

### Balance Scaling

- [ ] `scripts/vscripts/balance.lua` — Add `Balance:ScaleForTeamSize(infernalCount, entCount)` that adjusts: income rates (fewer Ents = higher per-Ent income), snowball per-kill values (fewer Ents = lower snowball gain), match timer (fewer Ents = shorter timer); apply at game start
  - [ ] `scripts/vscripts/tests/test_balance.lua` — Test scaling for 3v9 (default, no change); test scaling for 1v9 (Infernal gets bonuses); test scaling for 3v3 (reduced timer); test scaling for 2v2

### Game Mode Integration

- [ ] `scripts/vscripts/addon_game_mode.lua` — Read team configuration from custom game settings at InitGameMode; pass to TeamAssignment and Balance:ScaleForTeamSize; update SetCustomGameTeamMaxPlayers to use configured values

## Done When
- [ ] Lobby host can configure any Infernal (1–3) vs Ent (1–9) split
- [ ] Unbalanced configurations display "challenge" label
- [ ] Economy rates scale to team size
- [ ] Snowball values scale to team size
- [ ] Match timer adjusts for team size
- [ ] Invalid configurations are rejected
- [ ] All new and modified tests pass
- [ ] No existing tests broken
