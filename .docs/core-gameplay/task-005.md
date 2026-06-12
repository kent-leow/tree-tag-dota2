# Task 005 — Ent Economy System

## Goal
Implement the Ent resource generation system with passive income, resource building multipliers, and tiered economic scaling so that Ents accumulate wealth over time to fund buildings and guardians.

## Prerequisites
- [x] task-001.md completed <!-- verified 2026-06-12 -->

## Tasks

### Economy Logic

- [x] `scripts/vscripts/economy.lua` — Core economy manager: track per-player resources (gold/lumber); passive income tick every N seconds; calculate income rate from base + building multipliers; expose API for spend/earn/query balance (new)
  - [x] `scripts/vscripts/tests/test_economy.lua` — Verify passive income accrual, verify building multiplier increases rate, verify spend deducts correctly, verify insufficient funds rejected (new)

- [x] `scripts/vscripts/economy_tiers.lua` — Tiered scaling: define 4 economic tiers with income rates and unlock thresholds; auto-promote player tier when conditions met; emit tier-up event (new)
  - [x] `scripts/vscripts/tests/test_economy_tiers.lua` — Verify tier promotion at threshold, verify income rate changes per tier, verify tier-up event fires (new)

### Configuration

- [x] `scripts/vscripts/settings.lua` — Add INCOME_TICK_INTERVAL, BASE_INCOME_RATE, TIER_THRESHOLDS table, TIER_INCOME_RATES table (existing file)

### UI Feedback

- [x] `resource/flash3/custom_ui.txt` — Define HUD element for resource display and income rate indicator (existing file)

### Localization

- [x] `resource/addon_english.txt` — Add resource names, tier names, income notifications (existing file)

## Done When
- [x] Ent players receive passive gold/lumber income every tick <!-- verified 2026-06-12 -->
- [x] Constructing resource buildings increases income rate <!-- verified 2026-06-12 -->
- [x] Players progress through 4 economic tiers as they accumulate wealth <!-- verified 2026-06-12 -->
- [x] Current resources, income rate, and tier are visible in the HUD <!-- verified 2026-06-12 -->
- [x] All new and modified tests pass <!-- verified 2026-06-12 -->
- [x] No existing tests broken <!-- verified 2026-06-12 -->
