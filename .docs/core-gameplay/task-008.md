# Task 008 — Snowball Mechanic and Balance Framework

## Goal
Implement the Infernal snowball mechanic (power increase on Ent elimination) and establish the configurable balance framework ensuring early-game Infernal advantage transitions to late-game Ent advantage.

## Prerequisites
- [ ] task-001.md completed
- [ ] task-003.md completed
- [ ] task-004.md completed

## Tasks

### Snowball Logic

- [ ] `scripts/vscripts/snowball.lua` — On Ent death event: apply permanent stat buff to all surviving Infernals (bonus damage, HP, move speed); scale buff amount with number of Ents killed; emit snowball event for UI notification (new)
  - [ ] `scripts/vscripts/tests/test_snowball.lua` — Verify buff applied on Ent death, verify buff scales with kill count, verify all Infernals receive buff, verify buff is permanent (new)

### Balance Framework

- [ ] `scripts/vscripts/balance.lua` — Central balance module: define scaling curves for Ent economy power vs Infernal combat power over time; expose balance query API (expected power level at game minute); log power differential for tuning (new)
  - [ ] `scripts/vscripts/tests/test_balance.lua` — Verify Infernal power exceeds Ent power at minute 0-5, verify crossover point exists at configured minute, verify Ent power exceeds at late game (new)

- [ ] `scripts/vscripts/elimination_handler.lua` — Death processing: on Ent death, mark as permanently eliminated, trigger snowball system, check Infernal win condition; on Infernal death, check Ent win condition; announce eliminations (new)
  - [ ] `scripts/vscripts/tests/test_elimination_handler.lua` — Verify permanent elimination state, verify snowball trigger, verify win condition check on each death, verify announcement fires (new)

### Configuration

- [ ] `scripts/vscripts/settings.lua` — Add SNOWBALL_DAMAGE_PER_KILL, SNOWBALL_HP_PER_KILL, SNOWBALL_SPEED_PER_KILL, BALANCE_CROSSOVER_MINUTE, INFERNAL_EARLY_POWER_MULT (existing file)

### Localization

- [ ] `resource/addon_english.txt` — Add snowball buff name/description, elimination announcement messages, power-up notifications (existing file)

## Done When
- [ ] When an Ent is eliminated, all surviving Infernals visibly gain bonus stats
- [ ] Snowball buff stacks with each subsequent Ent elimination
- [ ] Infernals are measurably stronger than Ents in early game (minutes 0-5)
- [ ] Ents can outscale Infernals in late game if economy and guardians develop
- [ ] Balance constants are configurable for iterative tuning
- [ ] All new and modified tests pass
- [ ] No existing tests broken
