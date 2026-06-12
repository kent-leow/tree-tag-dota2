# Task 003 — Ent Hero and Survival Abilities

## Goal
Define the Ent hero with five core abilities (hide/root, tree regrowth, blink/escape, fortify/bark skin, scout/wisp) so that Ent players can survive, hide, and evade Infernals.

## Prerequisites
- [ ] task-001.md completed
- [ ] task-002.md completed

## Tasks

### Hero Definition

- [ ] `scripts/npc/npc_heroes_custom.txt` — Define Ent hero overriding a base hero: assign 5 custom ability slots, set base stats (move speed, HP, armor) appropriate for a fragile survivor (existing file)

### Ability Definitions

- [ ] `scripts/npc/npc_abilities_custom.txt` — Define all 5 Ent abilities with KV data: behavior flags, cooldowns, mana costs, special values per level (existing file)

### Ability Logic

- [ ] `scripts/vscripts/abilities/ent_hide.lua` — Root ability: apply invisibility modifier while Ent is surrounded by trees (check tree count in radius); break if trees destroyed or Ent moves; interact with tree_manager events (new)
  - [ ] `scripts/vscripts/tests/test_ent_hide.lua` — Verify invisibility applied when trees sufficient, broken when trees destroyed, broken on movement (new)

- [ ] `scripts/vscripts/abilities/ent_regrowth.lua` — Target-point ability: call tree_manager to regrow trees in target area; visual particle effect on regrown area (new)
  - [ ] `scripts/vscripts/tests/test_ent_regrowth.lua` — Verify trees regrown at target, verify cooldown respected, verify mana cost deducted (new)

- [ ] `scripts/vscripts/abilities/ent_blink.lua` — Short-range teleport: instant cast, move Ent to target point within max range; cannot blink into impassable terrain (new)
  - [ ] `scripts/vscripts/tests/test_ent_blink.lua` — Verify teleport distance, verify range cap, verify impassable terrain rejection (new)

- [ ] `scripts/vscripts/abilities/ent_fortify.lua` — Self-buff: apply damage reduction modifier for duration; Ent cannot attack during fortify (new)
  - [ ] `scripts/vscripts/tests/test_ent_fortify.lua` — Verify damage reduction percentage, verify duration expiry, verify attack disabled during buff (new)

- [ ] `scripts/vscripts/abilities/ent_scout.lua` — Summon a wisp unit: controllable, provides flying vision, limited duration, low HP; wisp uses npc_units_custom definition (new)
  - [ ] `scripts/vscripts/tests/test_ent_scout.lua` — Verify wisp spawns, provides vision, expires after duration, dies when HP depleted (new)

### Unit Definitions

- [ ] `scripts/npc/npc_units_custom.txt` — Define wisp scout unit: flying movement, no attack, vision range, low HP, timed life (existing file)

### Localization

- [ ] `resource/addon_english.txt` — Add Ent hero name, ability names, ability descriptions, ability lore (existing file)

## Done When
- [ ] Ent hero appears in hero selection with 5 abilities visible
- [ ] Hide ability makes Ent invisible when surrounded by trees; visibility breaks when trees are burned
- [ ] Regrowth ability restores trees at target location
- [ ] Blink teleports Ent a short distance instantly
- [ ] Fortify grants temporary damage reduction
- [ ] Scout summons a controllable wisp that grants vision
- [ ] All new and modified tests pass
- [ ] No existing tests broken
