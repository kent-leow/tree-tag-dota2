# Task 006 — Ent Building System

## Goal
Implement the Ent building construction system with three building categories (economy, defensive, military) and tier-based upgrades so that Ents can establish bases and defenses.

## Prerequisites
- [ ] task-001.md completed
- [ ] task-005.md completed

## Tasks

### Building Logic

- [ ] `scripts/vscripts/building_system.lua` — Building placement manager: validate placement location (must be on ground, near trees, not overlapping); construct building with build time; register building with economy system for income bonuses; handle building destruction by Infernals (new)
  - [ ] `scripts/vscripts/tests/test_building_system.lua` — Verify placement validation (valid/invalid positions), verify build time completion, verify economy registration, verify destruction cleanup (new)

- [ ] `scripts/vscripts/building_upgrades.lua` — Upgrade system: buildings can be upgraded through tiers (T1→T2→T3); each tier costs more, provides more benefit; upgrade has build time; tier requirements (economy tier gate) (new)
  - [ ] `scripts/vscripts/tests/test_building_upgrades.lua` — Verify upgrade cost increases, verify tier gate enforcement, verify benefit scaling per tier (new)

### Building Definitions

- [ ] `scripts/npc/npc_units_custom.txt` — Define building units for each category and tier: economy buildings (nature shrine T1-T3), defensive buildings (root barrier T1-T3, healing grove, slow trap), military buildings (guardian barracks T1-T3) with HP, armor, models (existing file)

### Ability Definitions

- [ ] `scripts/npc/npc_abilities_custom.txt` — Define building passive abilities: income aura (economy), regen aura (healing grove), slow field (trap), spawn guardian (military) (existing file)

### Building Passive Logic

- [ ] `scripts/vscripts/abilities/building_income_aura.lua` — Passive: economy buildings grant bonus income to owning player; scales with building tier (new)
  - [ ] `scripts/vscripts/tests/test_building_income_aura.lua` — Verify income bonus applied, verify scaling with tier (new)

- [ ] `scripts/vscripts/abilities/building_heal_aura.lua` — Passive: healing grove regenerates HP to friendly units in radius (new)
  - [ ] `scripts/vscripts/tests/test_building_heal_aura.lua` — Verify heal tick, verify radius boundary (new)

- [ ] `scripts/vscripts/abilities/building_slow_field.lua` — Passive: slow trap reduces enemy move speed in radius; does not reveal but impedes (new)
  - [ ] `scripts/vscripts/tests/test_building_slow_field.lua` — Verify slow applied to enemies, verify no effect on friendlies, verify radius (new)

### Localization

- [ ] `resource/addon_english.txt` — Add building names, descriptions, upgrade tier labels, construction messages (existing file)

## Done When
- [ ] Ent players can construct buildings from a build menu during gameplay
- [ ] Buildings validate placement near trees and on valid ground
- [ ] Economy buildings increase resource income rate
- [ ] Defensive buildings apply healing or slow effects in their area
- [ ] Buildings can be upgraded through tiers with increasing cost and benefit
- [ ] Infernals can destroy Ent buildings
- [ ] All new and modified tests pass
- [ ] No existing tests broken
