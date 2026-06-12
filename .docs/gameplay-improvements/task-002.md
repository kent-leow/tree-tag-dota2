# Task 002 — Resource Exchange System (Tiered Unlocks)

## Goal
Implement a resource exchange interface where players spend higher-value resources (lumber, kill) to unlock advanced units/buildings not available for gold alone, verifiable by attempting purchases with insufficient vs sufficient resources.

## Prerequisites
- [x] task-001.md completed

## Tasks

### Data Layer

- [x] `scripts/vscripts/settings.lua` — Add EXCHANGE_DEFS table: list of advanced units/buildings with costs specified in lumber and/or kill resources; add ADVANCED_BUILDING_DEFS for buildings requiring lumber/kill resources

### Exchange System

- [x] `scripts/vscripts/resource_exchange.lua` — `ResourceExchange:Init()`; `ResourceExchange:GetAvailableExchanges(playerID)` returns list of unlockable items based on current resource balances; `ResourceExchange:Purchase(playerID, itemKey)` validates resource requirements, deducts resources, and triggers unit/building creation; emit custom event to client on purchase (new)
  - [x] `scripts/vscripts/tests/test_resource_exchange.lua` — Test purchase succeeds when resources sufficient; test purchase fails when resources insufficient; test correct resource type deducted (kill vs lumber); test available list filters by affordability (new)

### Game Mode Integration

- [x] `scripts/vscripts/addon_game_mode.lua` — Require and initialise `resource_exchange` module

## Done When
- [x] Players can spend lumber resource to unlock mid-tier advanced buildings/units <!-- verified 2026-06-12 -->
- [x] Players can spend kill resource to unlock top-tier advanced buildings/units <!-- verified 2026-06-12 -->
- [x] Purchase fails gracefully when resources are insufficient <!-- verified 2026-06-12 -->
- [x] All new and modified tests pass <!-- verified 2026-06-12 -->
- [x] No existing tests broken <!-- verified 2026-06-12 -->

## Changelog
- 2026-06-12: Refined — "tree" resource references changed to "lumber" throughout.
