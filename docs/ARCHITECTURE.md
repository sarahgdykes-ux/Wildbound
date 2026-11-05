# Technical Architecture

This document outlines the technical architecture for Wildbound: Echoes of the Forgotten. The architecture is designed to be modular, data-driven, and adaptable to different game engines.

## Engine Selection (Pending)

The final engine has not been selected. Current recommendation is **Godot** due to:
- Strong 2D development capabilities
- Scene-based architecture
- Built-in animation and tilemap tools
- GDScript is approachable
- Supports data-driven game systems

Alternative options under consideration:
- GameMaker
- Unity
- Rust

The architecture described below is engine-agnostic where possible, with engine-specific details to be added after selection.

## System Architecture

### Core Systems

The game is organized into modular systems with clear responsibilities:

```
GameManager
├── PlayerController
├── WorldManager
├── EncounterManager
├── CreatureManager
├── TamingManager
├── BattleManager
├── SanctuaryManager
├── EvolutionManager
├── QuestManager
├── DialogueManager
├── SaveManager
└── UIManager
```

### System Responsibilities

#### GameManager
- Orchestrates game initialization and state
- Manages game modes (exploration, battle, dialogue, etc.)
- Handles global game events
- Coordinates between subsystems

#### PlayerController
- Handles player input and movement
- Manages player state (position, inventory, etc.)
- Handles player interactions with world objects
- Manages player animation

#### WorldManager
- Loads and manages world scenes/rooms
- Handles scene transitions
- Manages map data and collision
- Coordinates environmental effects

#### EncounterManager
- Manages creature encounters
- Triggers encounter interactions
- Handles encounter states
- Coordinates with TamingManager

#### CreatureManager
- Manages creature data loading
- Handles creature instance creation
- Manages creature statistics
- Coordinates creature state

#### TamingManager
- Manages taming interactions
- Handles different taming methods
- Validates taming requirements
- Coordinates taming success/failure

#### BattleManager
- Manages battle state
- Handles turn order
- Manages ability execution
- Calculates damage and effects
- Handles victory/defeat conditions

#### SanctuaryManager
- Manages sanctuary state
- Handles creature storage
- Manages creature display
- Coordinates sanctuary interactions

#### EvolutionManager
- Tracks evolution requirements
- Validates evolution eligibility
- Handles evolution execution
- Updates creature statistics after evolution

#### QuestManager
- Manages quest flags and state
- Tracks quest progress
- Handles quest completion
- Coordinates story progression

#### DialogueManager
- Loads and displays dialogue
- Handles dialogue choices
- Manages dialogue state
- Coordinates with QuestManager

#### SaveManager
- Serializes game state
- Writes save files
- Loads save files
- Handles save versioning

#### UIManager
- Manages all UI elements
- Handles UI state
- Coordinates UI updates
- Manages input routing to UI

## Data Architecture

### Data-Driven Design

The game uses a data-driven approach where game content is separated from code logic. This allows for easy content creation and modification without code changes.

### Data Categories

#### Species Data
Defines creature species templates:
- Species ID
- Name
- Elements
- Role
- Base statistics
- Abilities
- Taming method
- Evolution options
- Rarity

#### Ability Data
Defines abilities:
- Ability ID
- Name
- Element
- Type (physical, special, status)
- Power
- Accuracy
- Effects
- Cooldown
- Animation

#### Item Data
Defines items:
- Item ID
- Name
- Type (consumable, key, etc.)
- Effects
- Value
- Description

#### Region Data
Defines regions:
- Region ID
- Name
- Theme
- Maps/areas
- Creature spawns
- Quests
- Environmental effects

#### Quest Data
Defines quests:
- Quest ID
- Name
- Description
- Objectives
- Prerequisites
- Rewards
- Flags

### Data Format Example

#### Species Definition (JSON)
```json
{
  "species_id": "mosskit",
  "name": "Mosskit",
  "elements": ["nature"],
  "role": "support",
  "base_stats": {
    "hp": 45,
    "attack": 30,
    "defense": 35,
    "magic": 40,
    "resistance": 35,
    "speed": 55
  },
  "abilities": ["seedburst", "leaf_guard", "nature_boost"],
  "taming_method": {
    "type": "trust",
    "requirements": {
      "item": "forest_berries",
      "approach": "patient"
    }
  },
  "evolution_options": [
    {
      "target": "briarhorn",
      "requirements": {
        "environmental_affinity": {
          "nature": 50
        },
        "level": 20
      }
    },
    {
      "target": "bloomveil",
      "requirements": {
        "relationship": 80,
        "level": 20
      }
    }
  ],
  "habitats": ["whispering_woods"],
  "rarity": "common"
}
```

#### Individual Creature Instance (JSON)
```json
{
  "creature_id": "mosskit_001",
  "species_id": "mosskit",
  "level": 5,
  "experience": 120,
  "current_hp": 45,
  "stats": {
    "hp": 50,
    "attack": 32,
    "defense": 37,
    "magic": 42,
    "resistance": 37,
    "speed": 57
  },
  "relationship": 25,
  "environmental_affinity": {
    "nature": 15,
    "earth": 5
  },
  "known_abilities": ["seedburst"],
  "evolution_state": "unevolved",
  "personality": "curious"
}
```

## Save System Architecture

### Save Data Structure

Save files include:
- Player location
- Player progression (level, story flags)
- Active party (creature IDs)
- Sanctuary creatures (creature IDs)
- Creature instances (full data)
- Creature relationships
- Evolution history
- Unlocked locations
- Quest progress
- Discovered species
- Inventory
- Story flags

### Save Versioning

Save data includes a version number to handle schema changes:
```json
{
  "version": 1,
  "timestamp": "2026-11-05T12:00:00Z",
  "player": { ... },
  "creatures": [ ... ],
  "world": { ... },
  "quests": { ... }
}
```

### Save Management

- Auto-save at key checkpoints
- Manual save slots (multiple slots)
- Save validation on load
- Migration system for version changes

## State Management

### Game States

The game has distinct states:
- **Exploration** - Overworld movement and interaction
- **Battle** - Turn-based combat
- **Dialogue** - NPC conversation
- **Taming** - Creature taming interaction
- **Menu** - Sanctuary, inventory, etc.
- **Transition** - Scene/area transitions

### State Transitions

```
Exploration ↔ Battle
Exploration ↔ Dialogue
Exploration ↔ Taming
Exploration ↔ Menu
Battle → Exploration (after victory/defeat)
Dialogue → Exploration
Taming → Exploration
Menu → Exploration
```

## Component Design

### Creature Component

Manages individual creature state:
- Species reference
- Statistics
- Experience and level
- Abilities
- Relationship score
- Environmental affinity
- Evolution state

### Party Component

Manages active party:
- Party slots (4 provisionally)
- Party member ordering
- Party member availability
- Temporary party modifications

### Sanctuary Component

Manages stored creatures:
- Storage capacity (if limited)
- Creature grouping
- Sanctuary interactions
- Relationship effects

## Performance Considerations

### Asset Loading
- Lazy load assets when needed
- Pool frequently used assets
- Unload unused assets from distant areas

### Data Loading
- Load species data at startup
- Cache ability data
- Stream world data by region

### Creature Rendering
- Limit visible creatures in sanctuary
- Use LOD (Level of Detail) for distant creatures
- Batch similar sprites

## Testing Strategy

### Unit Tests
- Test data loading and validation
- Test stat calculations
- Test evolution logic
- Test save/load operations

### Integration Tests
- Test system interactions
- Test state transitions
- Test end-to-end flows

### Playtesting
- Test gameplay balance
- Test UI usability
- Test performance on target hardware

## Security Considerations

### Save File Security
- Validate save data on load
- Prevent save tampering where possible
- Detect corrupted saves

### Data Validation
- Validate all loaded data
- Sanitize user inputs
- Prevent exploits through data manipulation

## Future Extensions

### Multiplayer (Out of Scope for MVP)
- Network layer
- Synchronization
- Battle matching
- Trading system

### Mod Support (Future Consideration)
- Expose data file formats
- Provide modding tools
- Document API

### Analytics (Future Consideration)
- Track player progression
- Track creature usage
- Track balance metrics
