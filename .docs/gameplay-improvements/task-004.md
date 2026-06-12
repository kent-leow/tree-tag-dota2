# Task 004 — Respawn Mechanics (Infernal Permanent, Ent Ghost Channel)

## Goal
Replace current elimination logic with asymmetric respawn: Infernals always respawn (15s + 10s/kill escalation), dead Ents become ghosts at map centre requiring 5s allied channel to revive, verifiable by observing respawn behaviour after kills.

## Prerequisites
- None

## Tasks

### Data Layer

- [ ] `scripts/vscripts/settings.lua` — Add RESPAWN settings: INFERNAL_RESPAWN_BASE (15), INFERNAL_RESPAWN_PER_KILL (10), ENT_GHOST_MOVE_RADIUS (500), ENT_CHANNEL_DURATION (5), MAP_CENTRE_POSITION (Vector)

### Infernal Respawn

- [ ] `scripts/vscripts/infernal_respawn.lua` — On Infernal death: calculate respawn timer (15 + 10 × total Ent kills this match); set respawn timer; Infernal respawns at spawn point when timer expires; track total Ent kills for escalation (new)
  - [ ] `scripts/vscripts/tests/test_infernal_respawn.lua` — Test base respawn time is 15s with 0 kills; test respawn time is 25s after 1 Ent kill; test respawn time is 35s after 2 Ent kills; test Infernal actually respawns after timer (new)

### Ent Ghost System

- [ ] `scripts/vscripts/ent_ghost.lua` — On Ent death: create ghost unit at map centre; ghost has restricted movement radius (ENT_GHOST_MOVE_RADIUS); ghost is visible to all; ghost cannot attack or use abilities; track which player the ghost represents (new)
  - [ ] `scripts/vscripts/tests/test_ent_ghost.lua` — Test ghost spawns at map centre on Ent death; test ghost movement is restricted to radius; test ghost cannot attack; test ghost tracks correct playerID (new)

### Ent Channel Respawn

- [ ] `scripts/vscripts/ent_channel_respawn.lua` — When living Ent is adjacent to allied ghost: enable channel ability; on 5s uninterrupted channel completion: destroy ghost, respawn original Ent at full health at channel location; if channel interrupted (caster takes damage or moves): cancel and restart required (new)
  - [ ] `scripts/vscripts/tests/test_ent_channel_respawn.lua` — Test channel completes in 5s and respawns Ent; test channel interrupted resets progress; test respawned Ent has full health; test only living Ent can channel (new)

### Elimination Handler Refactor

- [ ] `scripts/vscripts/elimination_handler.lua` — Remove permanent elimination logic for Ents; on Ent death: delegate to ent_ghost instead of marking eliminated; on Infernal death: delegate to infernal_respawn; update CountRemainingEnts to count alive Ents (not ghosts)
  - [ ] `scripts/vscripts/tests/test_elimination_handler.lua` — Test Ent death triggers ghost creation not permanent elimination; test Infernal death triggers respawn timer; test count excludes ghosts

### Win Conditions Update

- [ ] `scripts/vscripts/win_conditions.lua` — Remove Infernal elimination as win condition (Infernals always respawn); Infernal wins when all Ents are in ghost state simultaneously (none alive); Ent wins only on timer expiry with at least one alive Ent
  - [ ] `scripts/vscripts/tests/test_win_conditions.lua` — Test Infernal wins when all Ents are ghosts; test Ent wins on timer with alive Ent; test Infernal death does NOT trigger Ent win; test match continues while any Ent is alive

### Game Mode Integration

- [ ] `scripts/vscripts/addon_game_mode.lua` — Require and initialise `infernal_respawn`, `ent_ghost`, and `ent_channel_respawn` modules

## Done When
- [ ] Infernals respawn after death with escalating timer (15s base + 10s per Ent kill)
- [ ] Dead Ents appear as ghosts at map centre with restricted movement
- [ ] Living Ent can channel ghost for 5s to respawn teammate
- [ ] Channel is interruptible and must be restarted
- [ ] Infernal team wins when all Ents are simultaneously in ghost state
- [ ] Ent team wins when timer expires with at least one alive Ent
- [ ] Infernal death no longer triggers Ent win condition
- [ ] All new and modified tests pass
- [ ] No existing tests broken
