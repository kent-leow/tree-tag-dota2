# Task 002 — Resource Exchange System (Tiered Unlocks)

## Goal
Implement a resource exchange interface where players spend higher-value resources (lumber, kill) to unlock advanced units/buildings not available for gold alone, verifiable by attempting purchases with insufficient vs sufficient resources.

## Prerequisites
- [ ] task-001.md completed

## Tasks

### Data Layer

- [ ] `scripts/vscripts/settings.lua` — Add EXCHANGE_DEFS table: list of advanced units/buildings with costs specified in lumber and/or kill resources; add ADVANCED_BUILDING_DEFS for buildings requiring lumber/kill resources

### Exchange System

- [ ] `scripts/vscripts/resource_exchange.lua` — `ResourceExchange:Init()`; `ResourceExchange:GetAvailableExchanges(playerID)` returns list of unlockable items based on current resource balances; `ResourceExchange:Purchase(playerID, itemKey)` validates resource requirements, deducts resources, and triggers unit/building creation; emit custom event to client on purchase (new)
  - [ ] `scripts/vscripts/tests/test_resource_exchange.lua` — Test purchase succeeds when resources sufficient; test purchase fails when resources insufficient; test correct resource type deducted (kill vs lumber); test available list filters by affordability (new)

### Game Mode Integration

- [ ] `scripts/vscripts/addon_game_mode.lua` — Require and initialise `resource_exchange` module

## Done When
- [ ] Players can spend lumber resource to unlock mid-tier advanced buildings/units
- [ ] Players can spend kill resource to unlock top-tier advanced buildings/units
- [ ] Purchase fails gracefully when resources are insufficient
- [ ] All new and modified tests pass
- [ ] No existing tests broken

## Changelog
- 2026-06-12: Refined — "tree" resource references changed to "lumber" throughout.
