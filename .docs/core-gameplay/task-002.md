# Task 002 — Tree System

## Goal
Implement tree tracking, Infernal-driven tree destruction, and Ent-driven tree regrowth so that the forest functions as dynamic terrain that both factions interact with.

## Prerequisites
- [ ] task-001.md completed

## Tasks

### Tree Management Logic

- [ ] `scripts/vscripts/tree_manager.lua` — Track all trees on map; provide API: get trees in radius, destroy trees in radius, regrow trees at positions; emit events on tree state changes (new)
  - [ ] `scripts/vscripts/tests/test_tree_manager.lua` — Verify tree counting, radius queries return correct trees, destroy removes trees, regrow restores trees (new)

- [ ] `scripts/vscripts/tree_regrowth.lua` — Passive regrowth system: destroyed trees queue for regrowth after configurable delay; ability-triggered instant regrowth at target location (new)
  - [ ] `scripts/vscripts/tests/test_tree_regrowth.lua` — Verify passive timer triggers regrowth, verify ability-triggered regrowth is immediate, verify already-alive trees are not duplicated (new)

### Configuration

- [ ] `scripts/vscripts/settings.lua` — Add TREE_REGROWTH_DELAY, TREE_BURN_RADIUS, TREE_REGROWTH_RADIUS constants (existing file)

## Done When
- [ ] Trees can be destroyed programmatically and visually disappear from the map
- [ ] Destroyed trees passively regrow after the configured delay
- [ ] Trees can be instantly regrown via ability trigger at a target area
- [ ] Tree state changes emit events consumable by other systems (hide detection, economy)
- [ ] All new and modified tests pass
- [ ] No existing tests broken
