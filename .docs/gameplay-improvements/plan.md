# Gameplay Improvements — Tavern, Multi-Resource Economy, Flexible Lobbies & Respawn Mechanics

## Summary
Expand the Tree Tag game mode with three new systems and revised core mechanics: an Infernal tavern for hiring limited scout creeps (max 3, fragile but lethal), a tri-resource economy (gold, lumber, kill) with tiered exchange values, and fully customisable team compositions (any split up to 3v9 including unbalanced "challenge" modes). Additionally, formalise respawn asymmetry — Infernals always respawn (15s base, increasing per kill), dead Ents must be channelled back (5s) by living teammates — and add a last-3-minutes Infernal rage phase with enhanced burning and movement speed.

## Scope
**In scope**
- Tavern building where Infernal players purchase melee or ranged creeps (max 3 per player)
- Hired creep control: player-owned scouting units repositionable anywhere
- Creep combat: melee creeps one-hit kill Ent, ranged creeps two-hit kill Ent
- Creep fragility: Ents can one-hit kill any hired creep (but cannot one-hit Infernals)
- Tri-resource system: gold (common), lumber (mid-value), kill (highest value)
- Gold farming via Ent economic buildings
- Lumber farming: Giant Tree building spawns Wisps (costs gold), Wisps are assigned to normal trees to passively generate lumber resource
- Kill resource earned by eliminating enemy units
- Resource exchange: higher-value resources unlock advanced units/buildings not purchasable with gold alone
- Customisable team composition: lobby host sets any Infernal vs Ent split (1v1 through 3v9, unbalanced allowed as "challenge" mode)
- Infernal permanent respawn (base 15s death timer, +10s per each Ent eliminated)
- Ent death and respawn: dead Ent is placed at map centre with restricted movement area; a living Ent must channel for 5 seconds to respawn them
- Ent win condition: at least one Ent survives when timer expires
- Infernal win condition: eliminate all Ents before timer expires
- Last-3-minutes Infernal rage: when ≤3 minutes remain, Infernals gain massively increased tree burn radius and movement speed bonus

**Out of scope**
- Online content platform or add-on marketplace
- Content authoring tools or SDK
- Balancing creep costs across all possible team compositions (initial pass only)
- Changes to existing Infernal archetype abilities (beyond the rage phase buff)
- Changes to map layout or terrain

## Acceptance Criteria

| **AC1** | Infernal tavern with limited purchase (cap 3) |
|---------|---|
| Given | An Infernal player is alive in a match |
| When  | They open the tavern interface |
| Then  | They see melee and ranged creeps available for purchase, with a visible cap of 3 total hired creeps per player |

| **AC2** | Hiring and controlling scout creeps |
|---------|---|
| Given | An Infernal player purchases a creep from the tavern and has fewer than 3 active creeps |
| When  | The creep is spawned |
| Then  | The creep is owned by that player, controllable, and can be moved to any passable location as a scout |

| **AC3** | Melee creep kills Ent in one hit |
|---------|---|
| Given | An Infernal-owned melee creep is within attack range of an Ent |
| When  | The melee creep attacks the Ent |
| Then  | The Ent is eliminated in a single attack |

| **AC4** | Ranged creep requires two hits to kill Ent |
|---------|---|
| Given | An Infernal-owned ranged creep attacks an Ent |
| When  | The ranged creep lands two hits |
| Then  | The Ent is eliminated after exactly the second hit |

| **AC5** | Ents one-hit kill creeps |
|---------|---|
| Given | An Ent attacks an Infernal-owned hired creep (melee or ranged) |
| When  | The attack lands |
| Then  | The creep is destroyed in one hit |

| **AC6** | Ents cannot one-hit Infernals |
|---------|---|
| Given | An Ent attacks an Infernal hero |
| When  | The attack lands |
| Then  | The Infernal takes damage but is not eliminated (Infernals have significantly higher HP) |

| **AC7** | Tri-resource tracking |
|---------|---|
| Given | A player is in an active match |
| When  | They view their resource panel |
| Then  | They see three distinct resource counters: gold, lumber, and kill |

| **AC8** | Gold farming via economic buildings |
|---------|---|
| Given | An Ent has constructed an economic farm building |
| When  | The income tick fires |
| Then  | The Ent receives gold resource at the building's configured rate |

| **AC9** | Wisp spawning from Giant Tree building |
|---------|---|
| Given | An Ent has constructed a Giant Tree building and has sufficient gold |
| When  | They spend gold to spawn a Wisp |
| Then  | A controllable Wisp unit is created, owned by that player |

| **AC10** | Wisp lumber harvesting |
|---------|---|
| Given | An Ent-owned Wisp is assigned to a normal tree |
| When  | The Wisp harvests over time |
| Then  | The owning Ent accumulates lumber resource at the Wisp's configured harvest rate |

| **AC11** | Kill resource earned on elimination |
|---------|---|
| Given | A player eliminates an enemy unit |
| When  | The kill is confirmed |
| Then  | The killing player receives kill resource points proportional to the eliminated unit's value |

| **AC12** | Resource exchange — tiered unlocks |
|---------|---|
| Given | A player has accumulated lumber or kill resources |
| When  | They access the exchange interface |
| Then  | They can spend higher-value resources to unlock advanced units or buildings not available for gold alone |

| **AC13** | Customisable team composition (any split) |
|---------|---|
| Given | A lobby host is configuring a new match |
| When  | They adjust team sizes via the lobby UI |
| Then  | They can set any Infernal vs Ent split (Infernals 1–3, Ents 1–9, total ≤ 12) including unbalanced configurations labelled as "challenge" |

| **AC14** | Game systems scale to team size |
|---------|---|
| Given | A match starts with a non-default team composition |
| When  | The game initialises |
| Then  | Economy rates, snowball values, and timer duration scale to the configured team sizes |

| **AC15** | Infernal respawn with escalating timer |
|---------|---|
| Given | An Infernal is eliminated during a match |
| When  | Their death timer expires (base 15s + 10s per Ent previously eliminated in the match) |
| Then  | The Infernal respawns at their spawn point (unlimited respawns) |

| **AC16** | Ent death — ghost placement at map centre |
|---------|---|
| Given | An Ent is eliminated |
| When  | Their death is confirmed |
| Then  | A "ghost" unit representing the dead Ent appears at the map centre with movement restricted to a limited radius |

| **AC17** | Ent respawn via 5-second allied channel |
|---------|---|
| Given | A living Ent is adjacent to a dead Ent's ghost at map centre |
| When  | The living Ent channels for 5 uninterrupted seconds |
| Then  | The dead Ent respawns as a fully alive unit at that location |

| **AC18** | Ent win condition — timer survival |
|---------|---|
| Given | The match timer reaches zero |
| When  | At least one Ent is still alive |
| Then  | The Ent team wins and the match ends |

| **AC19** | Infernal win condition — total elimination |
|---------|---|
| Given | All Ent players are eliminated (no living Ents and no ghosts being channelled) |
| When  | The last Ent death is confirmed |
| Then  | The Infernal team wins and the match ends |

| **AC20** | Last-3-minutes Infernal rage phase |
|---------|---|
| Given | The match timer shows 3 minutes or less remaining |
| When  | The rage phase triggers |
| Then  | All Infernals gain a massively increased tree burn radius and a significant movement speed bonus for the remainder of the match |

## Estimate
**Story Points**: 34 SP (~68 days)
> raw SP = (20 AC × 2) + 0 Open Questions = 40, rounded down to nearest Fibonacci = 34. 1 SP = 2 days.

## Notes
- Current economy system tracks gold and lumber — lumber remains as-is; "kill" is a new third currency
- Wisp is a separate controllable unit spawned from Giant Tree building (gold cost), assigned to trees for passive lumber harvest
- Team assignment must accept arbitrary splits — current fixed-ratio logic replaced with lobby-configured values
- Unbalanced team splits (e.g. 1v9) are explicitly allowed and framed as "challenge" difficulty
- The Ent ghost/respawn mechanic creates risk-reward: living Ents must expose themselves at map centre for 5s to rescue teammates
- Infernal respawn timer escalates (+10s per Ent kill) — rewards Infernals for kills early but slows them late when fewer Ents remain
- Last-3-minutes rage phase creates final urgency — Ents must have strong late-game defenses or survive the push
- Creeps are glass-cannon scouts: max 3 per Infernal, lethal to Ents but die instantly to Ent attacks
- Specific gold costs for creeps and resource exchange rates to be tuned during implementation via configurable constants

## Changelog
- 2026-06-12: Initial creation with 13 ACs and 6 open questions
- 2026-06-12: Refined — answered all open questions: creep cap = 3, Infernal respawn = 15s base +10s/kill, Ent channel = 5s, team splits fully unrestricted. Removed online content platform (AC21–22). Added respawn mechanics, win conditions, rage phase. Final AC count: 20, open questions: 0.
- 2026-06-12: Refined — resource naming: "lumber" stays as-is (not renamed to "tree"). Tri-resource is gold/lumber/kill. Updated ACs 7, 10, 12 and scope/notes.
