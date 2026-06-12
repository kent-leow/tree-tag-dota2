# Tree Tag Classic — Core Gameplay

## Summary
Deliver a fully playable asymmetric survival arcade mode for Dota 2 where a team of Ents (survivors) must outlast a team of Infernals (hunters) within a timed match. Ents hide in forests, build economies, construct defenses, and scale into late-game power. Infernals hunt by burning forests, detecting hidden Ents, and eliminating them before the timer expires. The core tension is destruction versus regeneration across a forest-dominated map.

## Scope
**In scope**
- Asymmetric team assignment (9 Ents vs 3 Infernals for 12-player lobby)
- Timer-based win conditions for both factions
- Dense-forest map with constrained pathing, Infernal spawn zones, and Ent safe zones
- Tree system: trees as camouflage, resource, and terrain
- Tree destruction mechanics (Infernal burning) and tree regrowth mechanics (Ent regeneration)
- Ent economy: passive income, resource buildings, harvesting, tiered scaling
- Ent building system: economy, defensive, and military structures
- Ent abilities: hide/root, tree regrowth, blink/escape, fortify, scout
- Guardian system: spawnable AI-controlled tree defenders
- Three Infernal archetypes: Tank, Stalker, Caster
- Infernal abilities: burning aura, gap-close, AoE fire, reveal/detection
- Snowball mechanic: Infernals gain power as Ents are eliminated
- Balance framework ensuring early-game Infernal advantage and late-game Ent advantage

**Out of scope**
- Matchmaking and lobby system (relies on Dota 2 custom game infrastructure)
- Cosmetics, skins, or progression systems
- Voice lines or custom audio
- Variants beyond the 12-player classic (large lobby scaling)
- Spectator or replay features beyond Dota 2 defaults
- Tutorial or onboarding flow

## Acceptance Criteria

| **AC1** | Team assignment and lobby setup |
|---------|---| 
| Given | A 12-player lobby starts the game |
| When  | The game mode initializes |
| Then  | 9 players are assigned as Ents and 3 players are assigned as Infernals with appropriate spawn locations |

| **AC2** | Win conditions and game timer |
|---------|---|
| Given | A match is in progress with a visible countdown timer |
| When  | The timer reaches zero with at least one Ent alive, OR all Infernals are eliminated |
| Then  | The Ent team wins and the match ends |

| **AC3** | Infernal elimination victory |
|---------|---|
| Given | A match is in progress |
| When  | All Ent players are eliminated before the timer expires |
| Then  | The Infernal team wins and the match ends |

| **AC4** | Forest map and tree-based camouflage |
|---------|---|
| Given | An Ent is positioned within a dense forest area |
| When  | The Ent activates their hide ability |
| Then  | The Ent becomes invisible to the Infernal team while surrounded by trees |

| **AC5** | Tree destruction by Infernals |
|---------|---|
| Given | An Infernal with a burning aura or AoE fire ability is near trees |
| When  | The ability activates or the aura ticks |
| Then  | Nearby trees are destroyed, revealing the terrain and any hidden Ents |

| **AC6** | Tree regrowth mechanic |
|---------|---|
| Given | Trees have been destroyed in an area |
| When  | An Ent uses a regrowth ability OR sufficient time passes |
| Then  | Trees regenerate in the area, restoring camouflage and pathing |

| **AC7** | Ent economy and resource generation |
|---------|---|
| Given | An Ent player is alive in a match |
| When  | Time passes or resource buildings are constructed |
| Then  | The Ent accumulates resources at a rate determined by their economic tier |

| **AC8** | Ent building construction |
|---------|---|
| Given | An Ent has sufficient resources |
| When  | They construct economy, defensive, or military buildings |
| Then  | Buildings are placed, provide their respective benefits, and can be upgraded through tiers |

| **AC9** | Guardian unit system |
|---------|---|
| Given | An Ent has constructed military buildings |
| When  | Guardian units are spawned |
| Then  | AI-controlled tree defenders patrol the Ent's base zone and engage approaching Infernals |

| **AC10** | Infernal hero archetypes and abilities |
|---------|---|
| Given | A player is assigned to the Infernal team |
| When  | They select or are assigned an archetype (Tank, Stalker, or Caster) |
| Then  | They receive a distinct kit: Tank has cleave and fire aura; Stalker has mobility and single-target burst; Caster has AoE spells and detection |

| **AC11** | Snowball mechanic |
|---------|---|
| Given | An Infernal eliminates an Ent |
| When  | The elimination is confirmed |
| Then  | Remaining Infernals receive a measurable power increase (stats, damage, or ability enhancement) |

| **AC12** | Ent survival abilities |
|---------|---|
| Given | An Ent is being pursued by an Infernal |
| When  | The Ent uses escape abilities (blink, fortify, or scout) |
| Then  | The Ent gains distance, damage reduction, or vision advantage to evade the threat |

## Open Questions

| # | Question | Impact if unresolved |
|---|----------|----------------------|
| 1 | What is the exact match timer duration — 20 or 30 minutes? | Affects balance tuning and pacing of economy tiers |
| 2 | Is Ent elimination permanent death or is there a respawn mechanic with limited lives? | Fundamentally changes game flow and snowball dynamics |
| 3 | Can Infernals be permanently eliminated by Ents, and if so at what stage? | Determines whether the Ent "overpower" win path is viable |
| 4 | What are the specific resource costs and income rates for each economic tier? | Blocks implementation of economy system balance |
| 5 | How does the map handle initial safe-zone protection for Ents (grace period, invulnerability, or physical barriers)? | Affects early-game fairness and spawn zone design |

## Estimate
**Story Points**: 34 SP (~68 days)
> raw SP = (12 AC × 2) + 5 Open Questions = 29, rounded up to nearest Fibonacci = 34. 1 SP = 2 days.

## Notes
- Project is currently a Dota 2 addon template with no game logic implemented — all systems must be built from scratch
- Dota 2 custom game framework provides base infrastructure: hero selection, spawning, abilities framework, KV-based data definitions, Lua scripting
- Key data files already exist but are empty/template: `npc_abilities_custom.txt`, `npc_heroes_custom.txt`, `npc_items_custom.txt`, `npc_units_custom.txt`
- Map creation requires Hammer editor (outside codebase) but map design requirements should inform game logic
- Balance values will require iterative playtesting; initial implementation should use configurable constants
