# Task 006 — Ent Building System

## Goal
Implement the Ent building construction system with three building categories (economy, defensive, military) and tier-based upgrades so that Ents can establish bases and defenses.

## Prerequisites
- [x] task-001.md completed <!-- verified 2026-06-12 -->
- [x] task-005.md completed <!-- verified 2026-06-12 -->

## Tasks

### Building Logic

- [x] `scripts/vscripts/building_system.lua` — Building placement manager: validate placement location (must be on ground, near trees, not overlapping); construct building with build time; register building with economy system for income bonuses; handle building destruction by Infernals (new)
  - [x] `scripts/vscripts/tests/test_building_system.lua` — Verify placement validation (valid/invalid positions), verify build time completion, verify economy registration, verify destruction cleanup (new)

- [x] `scripts/vscripts/building_upgrades.lua` — Upgrade system: buildings can be upgraded through tiers (T1→T2→T3); each tier costs more, provides more benefit; upgrade has build time; tier requirements (economy tier gate) (new)
  - [x] `scripts/vscripts/tests/test_building_upgrades.lua` — Verify upgrade cost increases, verify tier gate enforcement, verify benefit scaling per tier (new)

### Building Definitions

- [x] `scripts/npc/npc_units_custom.txt` — Define building units for each category and tier: economy buildings (nature shrine T1-T3), defensive buildings (root barrier T1-T3, healing grove, slow trap), military buildings (guardian barracks T1-T3) with HP, armor, models (existing file)

### Ability Definitions

- [x] `scripts/npc/npc_abilities_custom.txt` — Define building passive abilities: income aura (economy), regen aura (healing grove), slow field (trap), spawn guardian (military) (existing file)

### Building Passive Logic

- [x] `scripts/vscripts/abilities/building_income_aura.lua` — Passive: economy buildings grant bonus income to owning player; scales with building tier (new)
  - [x] `scripts/vscripts/tests/test_building_income_aura.lua` — Verify income bonus applied, verify scaling with tier (new)

- [x] `scripts/vscripts/abilities/building_heal_aura.lua` — Passive: healing grove regenerates HP to friendly units in radius (new)
  - [x] `scripts/vscripts/tests/test_building_heal_aura.lua` — Verify heal tick, verify radius boundary (new)

- [x] `scripts/vscripts/abilities/building_slow_field.lua` — Passive: slow trap reduces enemy move speed in radius; does not reveal but impedes (new)
  - [x] `scripts/vscripts/tests/test_building_slow_field.lua` — Verify slow applied to enemies, verify no effect on friendlies, verify radius (new)

### Localization

- [x] `resource/addon_english.txt` — Add building names, descriptions, upgrade tier labels, construction messages (existing file)

## Done When
- [x] Ent players can construct buildings from a build menu during gameplay <!-- verified 2026-06-12 -->
- [x] Buildings validate placement near trees and on valid ground <!-- verified 2026-06-12 -->
- [x] Economy buildings increase resource income rate <!-- verified 2026-06-12 -->
- [x] Defensive buildings apply healing or slow effects in their area <!-- verified 2026-06-12 -->
- [x] Buildings can be upgraded through tiers with increasing cost and benefit <!-- verified 2026-06-12 -->
- [x] Infernals can destroy Ent buildings <!-- verified 2026-06-12 -->
- [x] All new and modified tests pass <!-- verified 2026-06-12 -->
- [x] No existing tests broken <!-- verified 2026-06-12 -->
