# Task 003 — Infernal Tavern & Hired Creeps

## Goal
Implement the Infernal tavern system where Infernals can hire up to 3 controllable scout creeps (melee/ranged) that are lethal to Ents but fragile, verifiable by hiring creeps, controlling them, and testing combat interactions.

## Prerequisites
- [x] task-001.md completed

## Tasks

### Data Layer

- [x] `scripts/vscripts/settings.lua` — Add TAVERN settings: TAVERN_MELEE_COST, TAVERN_RANGED_COST, TAVERN_CREEP_CAP (3), TAVERN_MELEE_DAMAGE (Ent max HP to ensure 1-hit), TAVERN_RANGED_DAMAGE (half Ent HP to ensure 2-hit)

- [x] `scripts/npc/npc_units_custom.txt` — Add `npc_dota_hired_melee` unit definition: melee attack, 1 HP, high damage, Infernal team; add `npc_dota_hired_ranged` unit definition: ranged attack, 1 HP, moderate damage, Infernal team, vision range for scouting

### Tavern System

- [x] `scripts/vscripts/tavern.lua` — `Tavern:Init()`; track hired creep count per player; `Tavern:HireCreep(playerID, creepType)` validates cap not reached and gold available, spawns unit owned by player, deducts gold; `Tavern:OnCreepKilled(creep)` decrements count; `Tavern:GetCreepCount(playerID)` returns current count (new)
  - [x] `scripts/vscripts/tests/test_tavern.lua` — Test hire succeeds under cap; test hire fails at cap (3); test hire fails insufficient gold; test creep death decrements count; test melee vs ranged spawn correct unit type (new)

### Combat Interactions

- [x] `scripts/vscripts/creep_combat.lua` — Listen to entity_killed and damage events; when hired creep attacks Ent: melee deals lethal damage in 1 hit, ranged deals half-lethal per hit (2 hits to kill); when Ent attacks hired creep: creep dies in 1 hit (1 HP); ensure Ent attacks do NOT one-shot Infernal heroes (new)
  - [x] `scripts/vscripts/tests/test_creep_combat.lua` — Test melee creep one-hits Ent; test ranged creep needs exactly 2 hits; test Ent one-hits any hired creep; test Ent does not one-hit Infernal hero (new)

### Game Mode Integration

- [x] `scripts/vscripts/addon_game_mode.lua` — Require and initialise `tavern` and `creep_combat` modules

## Done When
- [x] Infernal players can hire melee and ranged creeps from tavern <!-- verified 2026-06-12 -->
- [x] Maximum 3 hired creeps per Infernal enforced <!-- verified 2026-06-12 -->
- [x] Hired creeps are controllable and repositionable as scouts <!-- verified 2026-06-12 -->
- [x] Melee creep eliminates Ent in 1 hit <!-- verified 2026-06-12 -->
- [x] Ranged creep eliminates Ent in exactly 2 hits <!-- verified 2026-06-12 -->
- [x] Ents destroy any hired creep in 1 hit <!-- verified 2026-06-12 -->
- [x] Ents cannot one-shot Infernal heroes <!-- verified 2026-06-12 -->
- [x] All new and modified tests pass <!-- verified 2026-06-12 -->
- [x] No existing tests broken <!-- verified 2026-06-12 -->
