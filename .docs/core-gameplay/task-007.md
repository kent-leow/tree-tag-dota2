# Task 007 — Guardian Unit System

## Goal
Implement the guardian spawning system where Ent military buildings produce AI-controlled tree defender units that patrol base zones and engage Infernals.

## Prerequisites
- [x] task-001.md completed <!-- verified 2026-06-12 -->
- [x] task-002.md completed <!-- verified 2026-06-12 -->
- [x] task-006.md completed <!-- verified 2026-06-12 -->

## Tasks

### Guardian Logic

- [x] `scripts/vscripts/guardian_spawner.lua` — Spawning system: military buildings spawn guardian units at configurable intervals; max guardian cap per building and per player; guardians are owned by building's player (new)
  - [x] `scripts/vscripts/tests/test_guardian_spawner.lua` — Verify spawn interval timing, verify cap enforcement (building and player), verify ownership assignment (new)

- [x] `scripts/vscripts/guardian_ai.lua` — AI behavior: guardians patrol within radius of their spawning building; engage hostile units entering patrol radius; return to patrol after combat; leash back if pulled too far (new)
  - [x] `scripts/vscripts/tests/test_guardian_ai.lua` — Verify patrol within radius, verify aggro on enemy entry, verify return after combat, verify leash distance (new)

### Unit Definitions

- [x] `scripts/npc/npc_units_custom.txt` — Define guardian unit tiers: Treant Defender (T1, melee, moderate HP), Ancient Guardian (T2, melee, high HP + thorns), Elder Protector (T3, ranged, AoE root) (existing file)

### Ability Definitions

- [x] `scripts/npc/npc_abilities_custom.txt` — Define guardian abilities: thorns passive (T2), root attack (T3); scale with building tier (existing file)

### Guardian Ability Logic

- [x] `scripts/vscripts/abilities/guardian_thorns.lua` — Passive: reflect percentage of melee damage back to attacker (new)
  - [x] `scripts/vscripts/tests/test_guardian_thorns.lua` — Verify damage reflection on melee hit, verify no reflection on ranged hit (new)

- [x] `scripts/vscripts/abilities/guardian_root.lua` — Attack modifier: chance on attack to root target for short duration (new)
  - [x] `scripts/vscripts/tests/test_guardian_root.lua` — Verify root proc chance, verify root duration, verify root prevents movement (new)

### Configuration

- [x] `scripts/vscripts/settings.lua` — Add GUARDIAN_SPAWN_INTERVAL, GUARDIAN_CAP_PER_BUILDING, GUARDIAN_CAP_PER_PLAYER, GUARDIAN_PATROL_RADIUS, GUARDIAN_LEASH_DISTANCE (existing file)

### Localization

- [x] `resource/addon_english.txt` — Add guardian unit names, ability names, spawn notifications (existing file)

## Done When
- [x] Military buildings periodically spawn guardian units up to the configured cap <!-- verified 2026-06-12 -->
- [x] Guardians patrol near their spawning building <!-- verified 2026-06-12 -->
- [x] Guardians automatically engage Infernals that enter their patrol radius <!-- verified 2026-06-12 -->
- [x] Guardians return to patrol after combat and leash if pulled too far <!-- verified 2026-06-12 -->
- [x] T2 guardians reflect damage; T3 guardians can root attackers <!-- verified 2026-06-12 -->
- [x] All new and modified tests pass <!-- verified 2026-06-12 -->
- [x] No existing tests broken <!-- verified 2026-06-12 -->
