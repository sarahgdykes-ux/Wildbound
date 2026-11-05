# Development Backlog

This document breaks down the development phases from the Game Design Document into actionable tasks with priorities and acceptance criteria.

## Task Legend

- **Priority:** Critical, High, Medium, Low
- **Status:** Not Started, In Progress, Blocked, Completed
- **Owner:** Team member responsible (TBD = To Be Determined)
- **Estimate:** Time estimate (days/weeks)

---

## Phase 1: Project Foundation

**Priority:** Critical
**Status:** Not Started
**Owner:** TBD

### 1.1 Engine Selection
- [ ] **Task:** Evaluate Godot, GameMaker, Unity, and Rust options
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Evaluation document with pros/cons for each engine

- [ ] **Task:** Create test prototypes in top 2 candidates
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 5 days
  - Acceptance: Working prototypes demonstrating basic movement and scene transitions

- [ ] **Task:** Document pros/cons for each engine
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Comparison document with final recommendation

- [ ] **Task:** Make final engine selection
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Engine selected and documented

- [ ] **Task:** Document engine-specific conventions
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Updated CONVENTIONS.md with engine-specific section

### 1.2 Repository Setup
- [ ] **Task:** Initialize engine project
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Engine project created and running

- [ ] **Task:** Configure build system
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Build system configured and tested

- [ ] **Task:** Set up folder structure
  - Priority: Critical
  - Status: Completed
  - Owner: Devin
  - Estimate: 1 day
  - Acceptance: All directories created

- [ ] **Task:** Configure .gitignore for engine
  - Priority: Critical
  - Status: Completed
  - Owner: Devin
  - Estimate: 0.5 days
  - Acceptance: .gitignore configured for engine

- [ ] **Task:** Set up README with engine-specific instructions
  - Priority: High
  - Status: Completed
  - Owner: Devin
  - Estimate: 1 day
  - Acceptance: README updated with setup instructions

### 1.3 Player Movement
- [ ] **Task:** Create player character sprite/placeholder
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Player sprite created and imported

- [ ] **Task:** Implement directional movement (up, down, left, right)
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Player moves in all four directions

- [ ] **Task:** Add diagonal movement if supported
  - Priority: Medium
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Diagonal movement implemented

- [ ] **Task:** Implement smooth movement (if applicable)
  - Priority: Medium
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Movement is smooth, not jerky

- [ ] **Task:** Add movement animations
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Walking/running animations play during movement

### 1.4 Basic World Scene
- [ ] **Task:** Create test scene/room
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Test scene created and loads

- [ ] **Task:** Add ground tiles or background
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Ground tiles/background added to scene

- [ ] **Task:** Add collision objects
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Collision objects prevent player movement

- [ ] **Task:** Test player movement in scene
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Player moves correctly in test scene

- [ ] **Task:** Set up camera tracking
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Camera follows player

### 1.5 Collision and Interaction
- [ ] **Task:** Implement collision detection
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Collision detection works reliably

- [ ] **Task:** Add solid objects (walls, trees, etc.)
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Solid objects block player movement

- [ ] **Task:** Implement interaction system (press button to interact)
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Interaction system implemented

- [ ] **Task:** Create test NPC
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Test NPC created in scene

- [ ] **Task:** Test interaction trigger
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Interaction triggers correctly with NPC

### 1.6 Game Data Conventions
- [ ] **Task:** Define file formats for game data
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Data format specifications documented

- [ ] **Task:** Create data loading system
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Data loading system implemented and tested

- [ ] **Task:** Set up data directory structure
  - Priority: Critical
  - Status: Completed
  - Owner: Devin
  - Estimate: 0.5 days
  - Acceptance: Data directories created

- [ ] **Task:** Document data conventions
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Data conventions documented

- [ ] **Task:** Create example data files
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Example data files created

---

## Phase 2: World Exploration

**Priority:** Critical
**Status:** Not Started
**Owner:** TBD

### 2.1 Bramblewick Map
- [ ] **Task:** Design Bramblewick Village layout
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Village layout designed and documented

- [ ] **Task:** Create tileset for village
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 5 days
  - Acceptance: Village tileset created

- [ ] **Task:** Build village map
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 5 days
  - Acceptance: Village map built in engine

- [ ] **Task:** Add buildings (player home, sanctuary, shop, training grounds)
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: All buildings added to map

- [ ] **Task:** Add NPC positions
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: NPCs placed in appropriate locations

- [ ] **Task:** Add environmental details (paths, decorations)
  - Priority: Medium
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Environmental details added

### 2.2 Whispering Woods Map
- [ ] **Task:** Design Whispering Woods layout
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Forest layout designed and documented

- [ ] **Task:** Create forest tileset
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 5 days
  - Acceptance: Forest tileset created

- [ ] **Task:** Build forest map
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 5 days
  - Acceptance: Forest map built in engine

- [ ] **Task:** Add forest paths
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Forest paths added

- [ ] **Task:** Add hidden clearings
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Hidden clearings added

- [ ] **Task:** Add environmental obstacles
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Environmental obstacles added

### 2.3 Map Transitions
- [ ] **Task:** Implement scene/room transition system
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Transition system implemented

- [ ] **Task:** Add Bramblewick to Woods transition
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Transition works correctly

- [ ] **Task:** Add Woods to Bramblewick transition
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Transition works correctly

- [ ] **Task:** Test transitions preserve player state
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Player state preserved across transitions

- [ ] **Task:** Add transition animations if applicable
  - Priority: Medium
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Transition animations added

### 2.4 NPC Dialogue
- [ ] **Task:** Design dialogue system
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Dialogue system designed

- [ ] **Task:** Create dialogue data format
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Dialogue format defined

- [ ] **Task:** Implement dialogue UI
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 4 days
  - Acceptance: Dialogue UI implemented

- [ ] **Task:** Add test dialogue for village guide
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Test dialogue added

- [ ] **Task:** Test dialogue interactions
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Dialogue interactions work correctly

### 2.5 Interactable Objects
- [ ] **Task:** Design interaction trigger system
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Interaction system designed

- [ ] **Task:** Create interactable object class/type
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Interactable object class created

- [ ] **Task:** Add interactable objects to maps
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Interactable objects added

- [ ] **Task:** Test object interactions
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Object interactions work correctly

- [ ] **Task:** Add interaction feedback
  - Priority: Medium
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Feedback (visual/audio) added

### 2.6 Visible Creature Sprites
- [ ] **Task:** Create placeholder creature sprites
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Placeholder sprites created

- [ ] **Task:** Implement creature sprite system
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Creature sprite system implemented

- [ ] **Task:** Add creatures to Woods map
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Creatures visible in Woods

- [ ] **Task:** Implement creature idle animations
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Idle animations play

- [ ] **Task:** Test creature visibility
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Creatures visible and animating correctly

### 2.7 Environmental Obstacles
- [ ] **Task:** Design obstacle system
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Obstacle system designed

- [ ] **Task:** Add breakable walls (Stoneback Ridge prep)
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Breakable walls added

- [ ] **Task:** Add water obstacles
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Water obstacles added

- [ ] **Task:** Add other environmental barriers
  - Priority: Medium
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Other barriers added

- [ ] **Task:** Test obstacle interactions
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Obstacles work correctly

---

## Phase 3: Creature Foundation

**Priority:** Critical
**Status:** Not Started
**Owner:** TBD

### 3.1 Species Data Format
- [ ] **Task:** Design species data schema
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Schema designed and documented

- [ ] **Task:** Create species data loader
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Data loader implemented

- [ ] **Task:** Define creature statistics structure
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Statistics structure defined

- [ ] **Task:** Create ability data format
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Ability format defined

- [ ] **Task:** Document data format
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Data format documented

### 3.2 Individual Creature Instances
- [ ] **Task:** Implement creature instance class
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Instance class implemented

- [ ] **Task:** Create instance generation system
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Generation system implemented

- [ ] **Task:** Add unique ID generation
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Unique ID generation works

- [ ] **Task:** Link instances to species data
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Instances link to species correctly

- [ ] **Task:** Test instance creation
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Instance creation tested

### 3.3 Statistics System
- [ ] **Task:** Implement base statistics
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Base stats implemented

- [ ] **Task:** Add level-based stat scaling
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Stat scaling implemented

- [ ] **Task:** Implement experience-to-level conversion
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: XP-to-level conversion works

- [ ] **Task:** Add stat calculation functions
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Stat calculations work

- [ ] **Task:** Test stat progression
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Stat progression tested

### 3.4 Experience and Levels
- [ ] **Task:** Implement experience gain system
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: XP gain system implemented

- [ ] **Task:** Add level-up logic
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Level-up logic works

- [ ] **Task:** Create experience curve
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: XP curve defined

- [ ] **Task:** Test level progression
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Level progression tested

- [ ] **Task:** Add level-up notifications
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Notifications displayed

### 3.5 Creature Encyclopedia
- [ ] **Task:** Design encyclopedia UI
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: UI designed

- [ ] **Task:** Implement species discovery tracking
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Discovery tracking works

- [ ] **Task:** Add creature information display
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Information displayed

- [ ] **Task:** Add stat visualization
  - Priority: Medium
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Stats visualized

- [ ] **Task:** Test encyclopedia functionality
  - Priority: High
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Encyclopedia tested

### 3.6 Party Management
- [ ] **Task:** Implement party system
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Party system implemented

- [ ] **Task:** Add party slots (4 provisionally)
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Party slots configured

- [ ] **Task:** Create party selection UI
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Selection UI implemented

- [ ] **Task:** Implement party member switching
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Switching works

- [ ] **Task:** Test party operations
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Party operations tested

### 3.7 Sanctuary Storage
- [ ] **Task:** Implement sanctuary storage system
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 3 days
  - Acceptance: Storage system implemented

- [ ] **Task:** Add creature-to-sanctuary transfer
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Transfer to sanctuary works

- [ ] **Task:** Add sanctuary-to-party transfer
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Transfer to party works

- [ ] **Task:** Implement storage capacity (if any)
  - Priority: Medium
  - Status: Not Started
  - Owner: TBD
  - Estimate: 1 day
  - Acceptance: Capacity implemented

- [ ] **Task:** Test storage operations
  - Priority: Critical
  - Status: Not Started
  - Owner: TBD
  - Estimate: 2 days
  - Acceptance: Storage operations tested

---

## Phases 4-9

Phases 4-9 will be detailed as the project progresses. See [docs/DEVELOPMENT_ROADMAP.md](docs/DEVELOPMENT_ROADMAP.md) for the complete breakdown of these phases.

### Phase 4: Taming
- Encounter interactions
- Trust-based taming
- Battle-based taming
- Quest-based taming
- Success/failure feedback
- Taming to sanctuary connection

### Phase 5: Combat
- Battle scene
- Turn order
- Ability selection
- Damage calculations
- Switching
- Status effects
- Victory/defeat
- Experience rewards

### Phase 6: Sanctuary and Relationships
- Sanctuary environment
- Display stored creatures
- Optional interactions
- Relationship progression
- Creature interaction animations
- Relationship display

### Phase 7: Evolution
- Evolution requirements
- Environmental exposure tracking
- Relationship thresholds
- Evolution eligibility
- Evolution hints
- Branching evolution
- Update creature statistics and abilities

### Phase 8: Story and Boss Encounter
- Quest flags
- Chapter progression
- Rival dialogue and battle
- Hollow Ruins
- Sound puzzle
- Hollow Guardian boss
- Post-battle story event

### Phase 9: Polish and Testing
- Sprite animations
- Battle feedback
- Sound effects and music
- UI improvements
- Save/load testing
- Creature progression testing
- Taming edge cases
- Peer playtesting
- Bug fixes

---

## Current Focus

**Phase 1: Project Foundation**

Next immediate tasks:
1. Select engine (1.1)
2. Initialize engine project (1.2)
3. Create player character sprite (1.3)
4. Implement player movement (1.3)

---

## Blocked Tasks

None currently.

---

## Notes

- This backlog will be updated regularly as tasks are completed
- New tasks may be added as development progresses
- Estimates are preliminary and may change
- Owners will be assigned as team members join
- Dependencies between tasks should be tracked

---

## Backlog Maintenance

This backlog should be reviewed and updated:
- Weekly during active development
- After each major milestone
- When new requirements are identified
- When tasks are completed or blocked
