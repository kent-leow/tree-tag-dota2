# Task 002 — Tree System

## Goal
Implement tree tracking, Infernal-driven tree destruction, and Ent-driven tree regrowth so that the forest functions as dynamic terrain that both factions interact with.

## Prerequisites
- [x] task-001.md completed <!-- verified 2026-06-12 -->

## Tasks

### Tree Management Logic

- [x] `scripts/vscripts/tree_manager.lua` — Track all trees on map; provide API: get trees in radius, destroy trees in radius, regrow trees at positions; emit events on tree state changes (new)
  - [x] `scripts/vscripts/tests/test_tree_manager.lua` — Verify tree counting, radius queries return correct trees, destroy removes trees, regrow restores trees (new)

- [x] `scripts/vscripts/tree_regrowth.lua` — Passive regrowth system: destroyed trees queue for regrowth after configurable delay; ability-triggered instant regrowth at target location (new)
  - [x] `scripts/vscripts/tests/test_tree_regrowth.lua` — Verify passive timer triggers regrowth, verify ability-triggered regrowth is immediate, verify already-alive trees are not duplicated (new)

### Configuration

- [x] `scripts/vscripts/settings.lua` — Add TREE_REGROWTH_DELAY, TREE_BURN_RADIUS, TREE_REGROWTH_RADIUS constants (existing file)

## Done When
- [x] Trees can be destroyed programmatically and visually disappear from the map <!-- verified 2026-06-12 -->
- [x] Destroyed trees passively regrow after the configured delay <!-- verified 2026-06-12 -->
- [x] Trees can be instantly regrown via ability trigger at a target area <!-- verified 2026-06-12 -->
- [x] Tree state changes emit events consumable by other systems (hide detection, economy) <!-- verified 2026-06-12 -->
- [x] All new and modified tests pass <!-- verified 2026-06-12 -->
- [x] No existing tests broken <!-- verified 2026-06-12 -->
