# Task 001 — Tri-Resource Economy (Gold, Lumber, Kill)

## Goal
Extend the existing economy system to track three resources (gold, lumber, kill) with distinct earning mechanics and tiered value, verifiable by checking resource balances after income ticks and kill events.

## Prerequisites
- None

## Tasks

### Data Layer

- [x] `scripts/vscripts/settings.lua` — Add KILL resource settings: KILL_VALUE_PER_ENT, KILL_VALUE_PER_CREEP, KILL_VALUE_PER_GUARDIAN; add WISP settings: WISP_SPAWN_COST, WISP_HARVEST_RATE, WISP_HARVEST_INTERVAL; add GIANT_TREE building definition to BUILDING_DEFS
  - [x] `scripts/vscripts/tests/test_settings.lua` — Verify new constants exist and have expected types/ranges (new)

### Economy System

- [x] `scripts/vscripts/economy.lua` — Add `kill` field to playerData; add `Economy:EarnKill(playerID, amount)` method; add `Economy:GetKillBalance(playerID)` method; update `GetBalance` to return {gold, lumber, kill}
  - [x] `scripts/vscripts/tests/test_economy.lua` — Test kill accumulation, GetBalance returns all three resources, EarnKill method, Spend still works for gold/lumber

### Kill Resource Earning

- [x] `scripts/vscripts/kill_reward.lua` — Listen to entity_killed event; award kill resource to the killing player based on unit type (Ent → KILL_VALUE_PER_ENT, creep → KILL_VALUE_PER_CREEP, guardian → KILL_VALUE_PER_GUARDIAN); call Economy:EarnKill (new)
  - [x] `scripts/vscripts/tests/test_kill_reward.lua` — Test kill resource awarded for each unit type; test no reward for friendly kills; test no reward when killer is nil (new)

### Wisp & Lumber Harvesting

- [x] `scripts/npc/npc_units_custom.txt` — Already has `npc_dota_ent_wisp` definition; verify suitability (no changes expected)

- [x] `scripts/vscripts/wisp_harvester.lua` — Wisp manager: track spawned wisps per player; `SpawnWisp(playerID, position)` spends gold via Economy:Spend; `AssignToTree(wisp, treeEntity)` starts harvest loop; harvest think awards lumber resource via Economy:Earn at WISP_HARVEST_RATE per interval (new)
  - [x] `scripts/vscripts/tests/test_wisp_harvester.lua` — Test spawn costs gold; test spawn fails if insufficient gold; test harvest tick awards lumber resource; test wisp assignment; test wisp killed stops harvest (new)

### Giant Tree Building

- [x] `scripts/vscripts/building_system.lua` — Add support for "giant_tree" building type in construction logic; on construction, register the building as a wisp spawner
  - [x] `scripts/vscripts/tests/test_building_system.lua` — Test giant_tree building can be constructed; test building registers with wisp system

### Game Mode Integration

- [x] `scripts/vscripts/addon_game_mode.lua` — Require and initialise `kill_reward` and `wisp_harvester` modules on game start

## Done When
- [x] Players accumulate three distinct resources: gold, lumber, kill <!-- verified 2026-06-12 -->
- [x] Economic farm buildings generate gold on tick <!-- verified 2026-06-12 -->
- [x] Wisps can be spawned from Giant Tree building for gold cost <!-- verified 2026-06-12 -->
- [x] Wisps assigned to trees generate lumber resource over time <!-- verified 2026-06-12 -->
- [x] Killing enemy units awards kill resource proportional to unit value <!-- verified 2026-06-12 -->
- [x] All new and modified tests pass <!-- verified 2026-06-12 -->
- [x] No existing tests broken <!-- verified 2026-06-12 -->

## Changelog
- 2026-06-12: Refined — resource stays as "lumber" (not renamed to "tree"). Updated all references.
