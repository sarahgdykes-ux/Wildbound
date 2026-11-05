# Project Conventions

This document outlines the coding style, naming conventions, and organizational standards for the Wildbound project.

## File Organization

### Directory Structure

```
Wildbound/
├── docs/              # Documentation (GDD, roadmap, architecture, etc.)
├── design/            # Design documents, creature designs, maps, UI mockups
├── assets/            # Game assets
│   ├── sprites/       # Character and creature sprites
│   ├── tilesets/      # Environment tilesets
│   ├── audio/         # Music and sound effects
│   └── ui/            # UI elements and icons
├── scripts/           # Engine-specific scripts
├── data/              # Game data definitions
│   ├── creatures/     # Creature species and instances
│   ├── abilities/     # Ability definitions
│   ├── regions/       # Region and map data
│   └── quests/        # Quest definitions
├── tests/             # Unit and integration tests
└── tools/             # Build tools, utilities, and scripts
```

### File Naming

- Use **snake_case** for filenames (e.g., `creature_manager.gd`, `battle_system.py`)
- Use descriptive names that indicate content (e.g., `player_controller` not `player`)
- Group related files in appropriate directories
- Keep filenames consistent within each directory

## Coding Style

### General Principles

- **Readability first** - Code should be easy to read and understand
- **Consistency** - Follow established patterns throughout the codebase
- **Simplicity** - Avoid over-engineering, prefer simple solutions
- **Documentation** - Document complex logic and public APIs

### Indentation and Formatting

- Use spaces for indentation (not tabs)
- 4 spaces per indentation level
- Maximum line length: 120 characters
- Use blank lines to separate logical sections
- One statement per line

### Comments

- Use comments to explain **why**, not **what**
- Document public functions and classes
- Add TODO comments for temporary solutions
- Remove commented-out code before committing

**Example:**
```gdscript
# Calculate damage based on attacker's attack stat and defender's defense
# Includes elemental multiplier for type advantages
func calculate_damage(attacker, defender, ability):
    var base_damage = attacker.attack * ability.power
    var defense_reduction = defender.defense * 0.5
    var elemental_multiplier = get_elemental_multiplier(ability.element, defender.element)
    return (base_damage - defense_reduction) * elemental_multiplier
```

## Naming Conventions

### Classes and Types

- Use **PascalCase** for class names
- Use descriptive, noun-based names
- Avoid abbreviations unless widely understood

**Examples:**
```gdscript
class CreatureManager:
class BattleSystem:
class SanctuaryView:
```

### Functions and Methods

- Use **camelCase** for function names
- Use verb-based names for actions
- Use descriptive names that indicate purpose

**Examples:**
```gdscript
func calculate_damage():
func spawn_creature():
func update_relationship():
```

### Variables

- Use **camelCase** for variable names
- Use descriptive names
- Avoid single-letter variables except for loop counters

**Examples:**
```gdscript
var creatureId
var battleState
var relationshipScore
```

### Constants

- Use **UPPER_SNAKE_CASE** for constants
- Define constants at the top of files or in dedicated constant files
- Group related constants together

**Examples:**
```gdscript
const MAX_PARTY_SIZE = 4
const BASE_EXPERIENCE_CURVE = [0, 100, 300, 600, 1000]
const ELEMENT_FIRE = "fire"
```

### Private Members

- Prefix private members with underscore (engine-specific convention may vary)
- Keep implementation details private

**Examples:**
```gdscript
var _internalState
func _private_function():
```

## Code Organization

### Class Structure

1. Class definition and docstring
2. Constants
3. Exported variables (engine-specific)
4. Public variables
5. Private variables
6. _ready() or initialization
7. Public methods
8. Private methods
9. Signal handlers

**Example:**
```gdscript
## Manages creature data and instances
class_name CreatureManager

const MAX_PARTY_SIZE = 4

var current_party = []
var sanctuary_creatures = []

func _ready():
    load_creature_data()

func add_to_party(creature):
    if current_party.size() < MAX_PARTY_SIZE:
        current_party.append(creature)

func _load_creature_data():
    # Private implementation
    pass
```

### Function Length

- Keep functions under 50 lines when possible
- Extract complex logic into separate functions
- One responsibility per function

### Function Parameters

- Limit to 5 parameters maximum
- Use data structures for complex parameter sets
- Provide default values for optional parameters

## Data Conventions

### JSON Data Files

- Use 2-space indentation
- Use double quotes for strings
- Include comments if format allows (or use comment fields)
- Validate JSON before committing

**Example:**
```json
{
  "species_id": "mosskit",
  "name": "Mosskit",
  "elements": ["nature"],
  "base_stats": {
    "hp": 45,
    "attack": 30
  }
}
```

### Data IDs

- Use **snake_case** for IDs
- Include type prefix when helpful (e.g., `creature_mosskit_001`)
- Keep IDs consistent across data files

**Examples:**
```
creature_mosskit_001
ability_seedburst
region_verdant_hollow
quest_chapter_one
```

## Engine-Specific Conventions

### Godot (Selected Engine)

**Scripting Language:**
- Use GDScript for game logic
- GDScript 2.0 (Godot 4.x) syntax
- Type hints recommended for clarity

**Scene-Based Architecture:**
- Each scene represents a game entity or location
- Use inheritance with scene trees
- Keep scenes focused and reusable
- Use `.tscn` files for scenes
- Use `.gd` files for scripts

**File Naming:**
- Scenes: `snake_case.tscn` (e.g., `player.tscn`, `main_menu.tscn`)
- Scripts: `snake_case.gd` (e.g., `player.gd`, `creature_manager.gd`)
- Resources: `snake_case.tres` or `snake_case.res` (e.g., `mosskit_species.tres`)
- Textures: `snake_case.png` or `snake_case.svg` (e.g., `mosskit_idle.png`)
- Audio: `snake_case.ogg` or `snake_case.mp3` (e.g., `battle_theme.ogg`)

**Node Naming:**
- Use snake_case for node names in scenes
- Use descriptive names that indicate purpose
- Follow Godot's node hierarchy conventions

**Class Naming:**
- Use PascalCase for class names (class_name declarations)
- Example: `class_name CreatureManager extends Node`

**Signals:**
- Use signals for event-driven communication
- Name signals with past tense verbs (e.g., `creature_tamed`, `battle_ended`)
- Connect signals in `_ready()` when possible
- Use `connect()` with callable references

**Resources:**
- Use Resource types for data (e.g., CreatureSpecies, Ability)
- Store data in `.tres` files
- Load resources with `load()` or `preload()`
- Use `@export` for inspector-exposed variables

**Autoload Singletons:**
- Use autoload for global managers (GameManager, SaveManager, etc.)
- Register in Project Settings > Autoload
- Access via singleton name globally
- Example: `GameManager.load_game()`

**Project Structure:**
```
Wildbound/
├── scenes/           # Scene files (.tscn)
│   ├── player/
│   ├── creatures/
│   ├── ui/
│   └── world/
├── scripts/          # Script files (.gd)
│   ├── player/
│   ├── managers/
│   └── systems/
├── resources/        # Resource files (.tres, .res)
│   ├── creatures/
│   ├── abilities/
│   └── data/
├── autoload/         # Autoload singleton scripts
└── assets/           # Art, audio, and other assets
```

**GDScript Conventions:**
- Use `_ready()` for initialization
- Use `_process()` for per-frame updates
- Use `_physics_process()` for physics updates
- Use `_input()` for input handling
- Use type hints: `var creature: Creature`
- Use `@export` for editor-exposed variables
- Use `@onready` for deferred node references: `@onready var sprite = $Sprite2D`

**Constants:**
- Use `const` for compile-time constants
- Group related constants
- Use UPPER_SNAKE_CASE: `const MAX_PARTY_SIZE = 4`

**Functions:**
- Use `func` keyword
- Use snake_case for function names
- Specify return types: `func calculate_damage() -> int:`
- Use `_` prefix for private functions (optional)

**Groups:**
- Use Godot groups for organization
- Add nodes to groups in scene or code
- Use `get_tree().get_nodes_in_group()` to query groups
- Common groups: "player", "creatures", "interactables"

**Collision Layers and Masks:**
- Use collision layers for what the object IS
- Use collision masks for what the object DETECTS
- Configure in project settings or per-object
- Document layer assignments in project.godot

## Version Control

### Commit Messages

Follow the conventional commit format:
```
<type>: <subject>

<body>

<footer>
```

**Types:**
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting)
- `refactor:` Code refactoring
- `test:` Test additions or changes
- `chore:` Maintenance tasks

**Examples:**
```
feat: add creature taming system

Implements trust-based taming with item offering mechanics.
Includes UI for taming interactions and success/failure feedback.

Closes #42
```

### Branch Naming

- `feature/` - New features
- `bugfix/` - Bug fixes
- `refactor/` - Refactoring
- `docs/` - Documentation changes

**Examples:**
```
feature/creature-taming
bugfix/save-corruption
refactor/creature-data-structure
docs/update-architecture
```

## Testing Conventions

### Unit Tests

- Test individual functions and methods
- Test edge cases and error conditions
- Use descriptive test names
- Arrange-Act-Assert pattern

**Example:**
```gdscript
func test_calculate_damage_with_elemental_advantage():
    # Arrange
    var attacker = create_test_creature(element="fire")
    var defender = create_test_creature(element="nature")
    var ability = create_test_ability(element="fire", power=50)

    # Act
    var damage = calculate_damage(attacker, defender, ability)

    # Assert
    assert(damage > 50, "Elemental advantage should increase damage")
```

### Integration Tests

- Test system interactions
- Test end-to-end flows
- Test save/load operations
- Test state transitions

## Documentation Conventions

### Code Documentation

- Document public classes and functions
- Include parameter descriptions
- Include return value descriptions
- Document exceptions or error conditions

**Example:**
```gdscript
## Adds a creature to the player's party.
##
## Parameters:
##   creature: The creature instance to add
##
## Returns:
##   true if added successfully, false if party is full
func add_to_party(creature) -> bool:
    if current_party.size() >= MAX_PARTY_SIZE:
        return false
    current_party.append(creature)
    return true
```

### README Files

- Keep README files up to date
- Include setup instructions
- Include build instructions
- Include contribution guidelines

## Asset Conventions

### Sprites

- Use consistent pixel art style
- Maintain appropriate resolution (e.g., 32x32, 64x64)
- Name files descriptively (e.g., `mosskit_idle.png`)
- Include source files (e.g., .aseprite)
- Organize by creature or category

### Audio

- Use consistent audio quality (44.1kHz, 16-bit)
- Normalize volume levels
- Name files descriptively (e.g., `battle_theme.mp3`)
- Organize by type (music, sfx, voice)

### Tilesets

- Use consistent tile size (e.g., 32x32)
- Include collision data if applicable
- Name files descriptively (e.g., `forest_tileset.png`)
- Document tile indices

## Performance Guidelines

### Optimization

- Profile code before optimizing
- Focus on hot paths
- Avoid premature optimization
- Document performance decisions

### Memory Management

- Clean up unused resources
- Use object pooling for frequently created objects
- Avoid memory leaks
- Test memory usage regularly

## Security Guidelines

### Input Validation

- Validate all user inputs
- Sanitize data from external sources
- Prevent injection attacks
- Handle errors gracefully

### Save Data

- Validate save data on load
- Detect corrupted saves
- Prevent save tampering where possible
- Use versioning for save data

## Review Guidelines

### Code Review Checklist

- [ ] Code follows project conventions
- [ ] Code is readable and well-documented
- [ ] No obvious bugs or issues
- [ ] Tests are included where appropriate
- [ ] Performance considerations addressed
- [ ] Security implications considered
- [ ] Documentation updated if needed

### Design Review Checklist

- [ ] Design aligns with GDD
- [ ] Design is consistent with existing systems
- [ ] Design is scalable and maintainable
- [ ] Open questions documented
- [ ] Impact on other systems considered

## Updating This Document

This document should be updated when:
- New conventions are established
- Engine is selected (add engine-specific section)
- Conventions prove problematic in practice
- Team consensus on style changes

Changes should be discussed with the team before implementation.
