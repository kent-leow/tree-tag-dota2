# Task 005 — Ent Economy System

## Goal
Implement the Ent resource generation system with passive income, resource building multipliers, and tiered economic scaling so that Ents accumulate wealth over time to fund buildings and guardians.

## Prerequisites
- [ ] task-001.md completed

## Tasks

### Economy Logic

- [ ] `scripts/vscripts/economy.lua` — Core economy manager: track per-player resources (gold/lumber); passive income tick every N seconds; calculate income rate from base + building multipliers; expose API for spend/earn/query balance (new)
  - [ ] `scripts/vscripts/tests/test_economy.lua` — Verify passive income accrual, verify building multiplier increases rate, verify spend deducts correctly, verify insufficient funds rejected (new)

- [ ] `scripts/vscripts/economy_tiers.lua` — Tiered scaling: define 4 economic tiers with income rates and unlock thresholds; auto-promote player tier when conditions met; emit tier-up event (new)
  - [ ] `scripts/vscripts/tests/test_economy_tiers.lua` — Verify tier promotion at threshold, verify income rate changes per tier, verify tier-up event fires (new)

### Configuration

- [ ] `scripts/vscripts/settings.lua` — Add INCOME_TICK_INTERVAL, BASE_INCOME_RATE, TIER_THRESHOLDS table, TIER_INCOME_RATES table (existing file)

### UI Feedback

- [ ] `resource/flash3/custom_ui.txt` — Define HUD element for resource display and income rate indicator (existing file)

### Localization

- [ ] `resource/addon_english.txt` — Add resource names, tier names, income notifications (existing file)

## Done When
- [ ] Ent players receive passive gold/lumber income every tick
- [ ] Constructing resource buildings increases income rate
- [ ] Players progress through 4 economic tiers as they accumulate wealth
- [ ] Current resources, income rate, and tier are visible in the HUD
- [ ] All new and modified tests pass
- [ ] No existing tests broken
