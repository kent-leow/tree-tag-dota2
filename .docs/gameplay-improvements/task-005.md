# Task 005 — Last-3-Minutes Infernal Rage Phase

## Goal
Implement an Infernal rage phase that triggers when ≤3 minutes remain on the match timer, granting massively increased tree burn radius and movement speed bonus, verifiable by observing buff application at the 3-minute mark.

## Prerequisites
- [ ] task-004.md completed

## Tasks

### Data Layer

- [ ] `scripts/vscripts/settings.lua` — Add RAGE settings: RAGE_TRIGGER_TIME (180 seconds remaining), RAGE_BURN_RADIUS_MULTIPLIER (e.g. 3.0), RAGE_SPEED_BONUS (e.g. 100)

### Rage Phase System

- [ ] `scripts/vscripts/infernal_rage.lua` — `InfernalRage:Init(gameMode)` registers think that checks remaining time; when matchTimer ≤ RAGE_TRIGGER_TIME: apply rage modifier to all living Infernals; rage modifier grants RAGE_SPEED_BONUS move speed and sets burn radius multiplier; emit global event to clients for UI notification; apply to newly respawning Infernals if rage already active (new)
  - [ ] `scripts/vscripts/tests/test_infernal_rage.lua` — Test rage not active above 3 minutes; test rage triggers at exactly 3 minutes remaining; test all Infernals receive speed bonus; test burn radius multiplied; test Infernal respawning during rage gets buff; test rage persists until match end (new)

### Tree Burn Integration

- [ ] `scripts/vscripts/tree_manager.lua` — Update burn radius calculation to check for rage multiplier; when rage active, use TREE_BURN_RADIUS × RAGE_BURN_RADIUS_MULTIPLIER
  - [ ] `scripts/vscripts/tests/test_tree_manager.lua` — Test normal burn radius without rage; test expanded burn radius during rage phase

### Game Mode Integration

- [ ] `scripts/vscripts/addon_game_mode.lua` — Require and initialise `infernal_rage` module; pass game mode reference for timer access

## Done When
- [ ] Infernal rage phase triggers automatically when ≤3 minutes remain
- [ ] All Infernals gain significant movement speed bonus during rage
- [ ] Tree burn radius is massively increased during rage
- [ ] Infernals respawning during rage immediately receive the buff
- [ ] Visual/event notification fires when rage activates
- [ ] All new and modified tests pass
- [ ] No existing tests broken
