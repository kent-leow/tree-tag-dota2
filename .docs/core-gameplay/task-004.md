# Task 004 — Infernal Hero Archetypes and Abilities

## Goal
Define three Infernal hero archetypes (Tank, Stalker, Caster) each with distinct ability kits so that Infernal players have differentiated roles for hunting Ents.

## Prerequisites
- [ ] task-001.md completed
- [ ] task-002.md completed

## Tasks

### Hero Definitions

- [ ] `scripts/npc/npc_heroes_custom.txt` — Define 3 Infernal heroes overriding base heroes: Tank (high HP, slow), Stalker (high move speed, burst), Caster (ranged, AoE); assign 4 ability slots each (existing file)

### Ability Definitions

- [ ] `scripts/npc/npc_abilities_custom.txt` — Define all 12 Infernal abilities (4 per archetype) with KV data: behavior flags, cooldowns, mana costs, damage values, special values per level (existing file)

### Tank Abilities

- [ ] `scripts/vscripts/abilities/infernal_cleave.lua` — Passive cleave on attack: deal percentage damage in frontal cone; extra damage to trees in radius (new)
  - [ ] `scripts/vscripts/tests/test_infernal_cleave.lua` — Verify cone damage, verify tree destruction in cleave area (new)

- [ ] `scripts/vscripts/abilities/infernal_fire_aura.lua` — Toggle aura: burn trees within radius every tick; deal minor DPS to enemies in radius; interact with tree_manager (new)
  - [ ] `scripts/vscripts/tests/test_infernal_fire_aura.lua` — Verify tree destruction per tick, verify damage to nearby units, verify toggle on/off (new)

- [ ] `scripts/vscripts/abilities/infernal_slam.lua` — Ground-target AoE: damage + slow enemies in area; destroy trees in area (new)
  - [ ] `scripts/vscripts/tests/test_infernal_slam.lua` — Verify AoE damage, verify slow applied, verify trees destroyed (new)

- [ ] `scripts/vscripts/abilities/infernal_bulwark.lua` — Passive: percentage damage reduction, bonus HP regen; no active component (new)
  - [ ] `scripts/vscripts/tests/test_infernal_bulwark.lua` — Verify damage reduction, verify HP regen bonus (new)

### Stalker Abilities

- [ ] `scripts/vscripts/abilities/infernal_charge.lua` — Target-unit charge: dash to target at high speed, deal damage on arrival, stun briefly; destroy trees in path (new)
  - [ ] `scripts/vscripts/tests/test_infernal_charge.lua` — Verify dash to target, verify damage on hit, verify stun duration, verify trees destroyed in path (new)

- [ ] `scripts/vscripts/abilities/infernal_ambush.lua` — Active: short invisibility + bonus move speed; attacking from invis grants bonus damage; break on attack or duration end (new)
  - [ ] `scripts/vscripts/tests/test_infernal_ambush.lua` — Verify invis applied, verify move speed bonus, verify bonus damage on attack break, verify duration expiry (new)

- [ ] `scripts/vscripts/abilities/infernal_execute.lua` — Single-target nuke: high damage that scales with target's missing HP; cooldown resets on kill (new)
  - [ ] `scripts/vscripts/tests/test_infernal_execute.lua` — Verify damage scaling with missing HP, verify cooldown reset on kill, verify normal cooldown on non-kill (new)

- [ ] `scripts/vscripts/abilities/infernal_hunt.lua` — Passive: gain move speed when moving toward visible enemy heroes; lose bonus when no enemy in range (new)
  - [ ] `scripts/vscripts/tests/test_infernal_hunt.lua` — Verify speed bonus toward enemies, verify bonus removed when no enemies (new)

### Caster Abilities

- [ ] `scripts/vscripts/abilities/infernal_fire_wave.lua` — Directional wave: deal damage in a line, destroy all trees in path; travel distance configurable (new)
  - [ ] `scripts/vscripts/tests/test_infernal_fire_wave.lua` — Verify line damage, verify tree destruction along path, verify max travel distance (new)

- [ ] `scripts/vscripts/abilities/infernal_reveal.lua` — Target-area reveal: grant vision of area for duration; reveal invisible units in area; long cooldown (new)
  - [ ] `scripts/vscripts/tests/test_infernal_reveal.lua` — Verify vision granted, verify invisible units revealed, verify duration expiry (new)

- [ ] `scripts/vscripts/abilities/infernal_meteor.lua` — Target-area delayed nuke: mark area, after delay deal heavy damage + destroy trees in radius; enemies can flee during delay (new)
  - [ ] `scripts/vscripts/tests/test_infernal_meteor.lua` — Verify delay before damage, verify AoE damage, verify tree destruction, verify area indicator visible (new)

- [ ] `scripts/vscripts/abilities/infernal_fire_trail.lua` — Passive: leave a burning trail while moving that damages enemies and destroys trees; trail fades after short duration (new)
  - [ ] `scripts/vscripts/tests/test_infernal_fire_trail.lua` — Verify trail creation on movement, verify trail damages enemies, verify trail destroys trees, verify trail fade (new)

### Localization

- [ ] `resource/addon_english.txt` — Add 3 Infernal hero names, 12 ability names, descriptions, and lore (existing file)

## Done When
- [ ] Three distinct Infernal heroes appear in hero selection
- [ ] Tank: cleave destroys trees, fire aura burns surrounding forest, slam AoEs area
- [ ] Stalker: charge dashes through trees, ambush grants invis, execute bursts low-HP targets
- [ ] Caster: fire wave clears lines of trees, reveal exposes hidden Ents, meteor area-denies
- [ ] All tree-destroying abilities interact correctly with the tree manager system
- [ ] All new and modified tests pass
- [ ] No existing tests broken
