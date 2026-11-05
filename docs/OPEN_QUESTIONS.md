# Open Design Questions

This document tracks design decisions that still need validation and questions that need to be resolved before finalizing the complete production plan.

## Priority Questions

### Engine Selection

**Question:** Which engine should we use for Wildbound?

**Options:**
- **Godot** (Recommended)
  - Pros: Strong 2D capabilities, scene-based architecture, built-in tools, GDScript is approachable, supports data-driven systems
  - Cons: Smaller ecosystem than Unity, less documentation for complex projects
  - Suitability: High for solo/small team 2D RPG

- **GameMaker**
  - Pros: Strong 2D workflow, good for sprite-based RPGs, useful room and object management
  - Cons: Less flexible for complex systems, GML has limitations
  - Suitability: Medium, good for simpler 2D games

- **Unity**
  - Pros: Extensive ecosystem, large asset/tutorial library, powerful tools
  - Cons: More infrastructure than needed, C# learning curve, heavier for 2D
  - Suitability: Medium, powerful but potentially overkill

- **Rust**
  - Pros: Performance, control, modern language
  - Cons: Requires custom development for rendering/UI/animation, higher initial cost
  - Suitability: Low for initial development, high for long-term optimization

**Recommendation:** Godot is the strongest default choice for a solo or small-team 2D RPG.

**Decision Status:** Pending
**Target Resolution:** Phase 1 (Project Foundation)

---

### Party Size

**Question:** How many creatures should be in the active battle party?

**Options:**
- **4 creatures** (Provisional choice in GDD)
  - Pros: Balanced team composition, manageable complexity, good variety
  - Cons: May limit strategic depth

- **6 creatures**
  - Pros: More strategic options, larger team variety
  - Cons: Increased complexity, longer battles, more balancing work

- **3 creatures**
  - Pros: Simpler mechanics, faster battles
  - Cons: Limited variety, less strategic depth

**Recommendation:** Start with 4 for MVP, evaluate during playtesting.

**Decision Status:** Pending
**Target Resolution:** Phase 5 (Combat implementation)

---

### Starter Selection

**Question:** How should the player obtain their first companion?

**Options:**
- **Choose one of three starters** (Traditional)
  - Pros: Player agency, classic monster-catching feel, replayability
  - Cons: Multiple character designs, dialogue variations

- **Discover through story** (Narrative-driven)
  - Pros: Stronger story integration, simpler initial design
  - Cons: Less player choice, potential replayability decrease

- **Receive from village elder** (Gift-based)
  - Pros: Natural story integration, establishes mentor relationship
  - Cons: Less agency, may feel forced

**Recommendation:** Story-driven discovery fits the game's emphasis on exploration and mystery.

**Decision Status:** Pending
**Target Resolution:** Phase 2 (World Exploration)

---

### Encounter System

**Question:** Should all wild encounters be visible, or should some use surprise encounters?

**Options:**
- **All visible** (Overworld sprites)
  - Pros: Player choice, reduces frustration, fits exploration theme
  - Cons: Less surprise, may feel less "wild"

- **Mixed system** (Visible + surprise)
  - Pros: Variety, surprise encounters in special areas
  - Cons: More complex, potential frustration

- **All surprise** (Random encounters)
  - Pros: Classic RPG feel, unpredictability
  - Cons: Frustrating exploration, contradicts visible creatures in GDD

**Recommendation:** All visible encounters fit the game's exploration pillar and design philosophy.

**Decision Status:** Pending
**Target Resolution:** Phase 2 (World Exploration)

---

### Evolution Control

**Question:** How much control should players have over alternative evolutions?

**Options:**
- **Full control** (Player chooses evolution)
  - Pros: Player agency, strategic planning
  - Cons: May reduce feeling of discovery

- **Partial control** (Conditions determine, player confirms)
  - Pros: Balances agency and discovery
  - Cons: May feel arbitrary

- **No control** (Conditions determine automatically)
  - Pros: Feels natural, rewards exploration
  - Cons: Player frustration if unwanted evolution

**Recommendation:** Partial control - conditions determine eligibility, player chooses from eligible options.

**Decision Status:** Pending
**Target Resolution:** Phase 7 (Evolution implementation)

---

## Medium Priority Questions

### Creature Personalities

**Question:** Should creatures have individual personalities with gameplay consequences, or mostly cosmetic personalities?

**Options:**
- **Gameplay-affecting personalities**
  - Pros: Adds depth, replayability, strategic variety
  - Cons: Balancing complexity, player frustration

- **Cosmetic personalities**
  - Pros: Simpler implementation, focuses on other systems
  - Cons: Less depth, missed opportunity

- **Hybrid approach**
  - Pros: Mild gameplay effects, mostly cosmetic
  - Cons: Still requires implementation

**Recommendation:** Hybrid approach - minor gameplay bonuses tied to personality, mostly cosmetic.

**Decision Status:** Pending
**Target Resolution:** Phase 3 (Creature Foundation)

---

### Regional Challenges

**Question:** How should regional challenges be organized?

**Options:**
- **Leagues** (Structured competition)
  - Pros: Clear progression, competitive feel
  - Cons: May feel rigid, requires many opponents

- **Tournaments** (Periodic events)
  - Pros: Special events, variety
  - Cons: May feel disconnected from main game

- **Individual guardian trials** (Solo challenges)
  - Pros: Fits exploration theme, flexible
  - Cons: Less competitive feel

- **Mixed system**
  - Pros: Variety, flexible
  - Cons: Complex to design

**Recommendation:** Individual guardian trials fit the exploration pillar and guardian encounters in GDD.

**Decision Status:** Pending
**Target Resolution:** Phase 8 (Story and Boss Encounter)

---

### Ultimate Creature Count

**Question:** How many creatures should ultimately be available in the complete game?

**Options:**
- **50-100 creatures**
  - Pros: Manageable scope, good variety
  - Cons: May feel limited for genre

- **100-200 creatures**
  - Pros: Competitive with genre, good variety
  - Cons: Significant design work, balancing complexity

- **200+ creatures**
  - Pros: Genre standard, massive variety
  - Cons: Enormous scope, may overwhelm team

**Recommendation:** Start with 50-100 for initial release, expand in updates based on success.

**Decision Status:** Pending
**Target Resolution:** Post-MVP planning

---

## Lower Priority Questions

### Save System

**Question:** How many save slots should be available?

**Options:**
- **Single auto-save**
  - Pros: Simple, encourages commitment
  - Cons: No experimentation, potential frustration

- **3 save slots**
  - Pros: Experimentation, standard for RPGs
  - Cons: More complexity

- **Unlimited saves**
  - Pros: Maximum flexibility
  - Cons: Save scumming potential

**Recommendation:** 3 save slots + auto-save slot for balance.

**Decision Status:** Pending
**Target Resolution:** Phase 1 (Project Foundation)

---

### Relationship Decay

**Question:** Should relationships have any decay mechanic?

**Current GDD Stance:** No relationship decay from inactivity.

**Reconsideration Options:**
- Keep current stance (no decay)
- Slow decay for very high relationships only
- Decay only if creature is left in sanctuary for extended period

**Recommendation:** Keep current stance - no decay maintains accessibility.

**Decision Status:** Pending confirmation
**Target Resolution:** Phase 6 (Sanctuary and Relationships)

---

### Battle Speed

**Question:** What should the target battle duration be?

**Options:**
- **Fast battles** (2-3 minutes)
  - Pros: Keeps pacing quick, less fatigue
  - Cons: May feel rushed

- **Medium battles** (3-5 minutes)
  - Pros: Balanced pacing
  - Cons: May feel slow for some players

- **Variable based on difficulty**
  - Pros: Flexible
  - Cons: Complex to balance

**Recommendation:** Target 3-5 minutes for standard battles, test during Phase 5.

**Decision Status:** Pending
**Target Resolution:** Phase 5 (Combat implementation)

---

## Technical Questions

### Data Format

**Question:** What format should game data use?

**Options:**
- **JSON**
  - Pros: Human-readable, widely supported, easy to edit
  - Cons: Verbose, not most efficient

- **YAML**
  - Pros: More readable than JSON
  - Cons: Less common, parsing overhead

- **Custom binary**
  - Pros: Efficient, harder to modify
  - Cons: Harder to debug, tooling required

- **Engine-specific format**
  - Pros: Optimized for engine
  - Cons: Engine lock-in

**Recommendation:** JSON for development data, engine-specific for shipping.

**Decision Status:** Pending
**Target Resolution:** Phase 1 (Project Foundation)

---

### Save Encryption

**Question:** Should save files be encrypted?

**Options:**
- **No encryption**
  - Pros: Easy debugging, player modification allowed
  - Cons: Easy cheating

- **Light obfuscation**
  - Pros: Deters casual cheating
  - Cons: Still breakable

- **Full encryption**
  - Pros: Prevents cheating
  - Cons: Player frustration, harder debugging

**Recommendation:** Light obfuscation - deter casual cheating, allow for player mods.

**Decision Status:** Pending
**Target Resolution:** Phase 5 (Combat implementation)

---

## Design Philosophy Questions

### Punishment vs. Reward

**Question:** How should the game balance punishment for mistakes vs. reward for exploration?

**Current GDD Stance:** Encourage experimentation without punishing players for choosing favorites.

**Confirmation Required:** Does this extend to all systems (battles, taming, exploration)?

**Recommendation:** Maintain gentle failure penalties, focus on positive reinforcement.

**Decision Status:** Pending confirmation
**Target Resolution:** Throughout development

---

### Difficulty Curve

**Question:** What should the difficulty curve look like?

**Options:**
- **Gradual increase** (Standard)
  - Pros: Predictable progression
  - Cons: May feel formulaic

- **Plateau-based** (Areas of similar difficulty)
  - Pros: Encourages exploration within region
  - Cons: May feel static

- **Spike-based** (Challenging encounters mixed with easy)
  - Pros: Exciting, rewarding
  - Cons: May frustrate casual players

**Recommendation:** Gradual increase with plateau-based regions - fits regional structure.

**Decision Status:** Pending
**Target Resolution:** Phase 5 (Combat implementation)

---

## Questions Resolved During Planning

### MVP Scope
**Resolved:** Only Verdant Hollow region for MVP, not all 8 regions.

### Engine Choice Timing
**Resolved:** Engine selection in Phase 1, before any implementation.

### Taming Methods
**Resolved:** Three methods for MVP (Trust, Battle, Quest/Discovery).

### Party Size (Provisional)
**Resolved:** 4 creatures provisionally, subject to change during combat testing.

## Decision Tracking

| Question | Status | Target Phase | Assigned To |
|----------|--------|--------------|-------------|
| Engine Selection | Pending | Phase 1 | TBD |
| Party Size | Pending | Phase 5 | TBD |
| Starter Selection | Pending | Phase 2 | TBD |
| Encounter System | Pending | Phase 2 | TBD |
| Evolution Control | Pending | Phase 7 | TBD |
| Creature Personalities | Pending | Phase 3 | TBD |
| Regional Challenges | Pending | Phase 8 | TBD |
| Ultimate Creature Count | Pending | Post-MVP | TBD |
| Save System | Pending | Phase 1 | TBD |
| Relationship Decay | Pending Confirmation | Phase 6 | TBD |
| Battle Speed | Pending | Phase 5 | TBD |
| Data Format | Pending | Phase 1 | TBD |
| Save Encryption | Pending | Phase 5 | TBD |

## Notes

- This document will be updated as decisions are made
- New questions may be added during development
- Some questions may be resolved through playtesting
- Priority may shift based on development needs
