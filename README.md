# Wildbound: Echoes of the Forgotten

A top-down 2D fantasy adventure RPG featuring creature discovery, taming, and strategic turn-based battles.

## Project Status

**MVP COMPLETE** - All 9 development phases complete. Playable demo with exploration, combat, creatures, sanctuary, evolution, and boss encounters.

## Game Overview

Wildbound: Echoes of the Forgotten is a creature-taming RPG where players explore a vast magical world, discover unique creatures, develop relationships with them, and participate in strategic turn-based battles. The game emphasizes individual creature personalities, different taming methods, environmental evolution, and a shared sanctuary where discovered creatures live together.

### Key Features

- **Exploration** - Reward curiosity with hidden paths, creatures, locations, and secrets
- **Creature Discovery** - Different species with unique taming requirements and behaviors
- **Relationships** - Meaningful creature friendships and experiences
- **Strategic Combat** - Turn-based battles with elemental interactions and team synergy
- **Evolution** - Environmental exposure and relationships influence creature development
- **Living Sanctuary** - Shared home for discovered creatures without demanding care mechanics
- **Mystery** - Overarching story with rivals, regional challenges, and powerful guardians

## Initial Scope

The first playable milestone focuses on **Verdant Hollow**, the starting region, which includes:

- Bramblewick Village (settlement and starting location)
- Whispering Woods (introduction to exploration and taming)
- Stoneback Ridge (environmental exploration abilities)
- Moonwater Glade (time-dependent encounters)
- The Hollow Ruins (first major story discovery and boss)

The MVP includes at least 6 functional creature species (12 designed), with functional turn-based combat, sanctuary management, and the first chapter's main quest.

## Engine

**Selected Engine:** Godot 4.x

Godot was selected for:
- Strong 2D development capabilities
- Scene-based architecture
- Built-in animation and tilemap tools
- GDScript is approachable for solo/small team
- Supports data-driven game systems
- Excellent fit for 2D RPG development

## Getting Started

### Quick Start

1. **Download Godot 4.x**
   - Visit: https://godotengine.org/download/windows/
   - Download Godot 4.7.2 (stable) for Windows
   - Extract and run - no installation required

2. **Open the Project**
   - Launch Godot
   - Click "Import" and select this project folder
   - Or click "New Project" and set this as the project path

3. **Run the Game**
   - Press **F5** in Godot to run
   - Use **WASD** or **Arrow keys** to move
   - Press **E** or **Space** to interact
   - Press **Escape** for menu

### Project Structure
   - `scenes/` - Godot scene files (.tscn)
   - `scripts/` - GDScript files (.gd)
   - `resources/` - Resource files (.tres, .res)
   - `autoload/` - Singleton scripts
   - `assets/` - Art, audio, and other assets
   - `data/` - Game data definitions (JSON)
   - `docs/` - Design and technical documentation

### Development

See [CONTRIBUTING.md](CONTRIBUTING.md) for development workflow and guidelines.
See [CONVENTIONS.md](CONVENTIONS.md) for coding standards and Godot-specific conventions.

## Documentation

- [Game Design Document](docs/GDD.md) - Complete game design specification
- [Development Roadmap](docs/DEVELOPMENT_ROADMAP.md) - Implementation phases and milestones
- [Architecture](docs/ARCHITECTURE.md) - Technical architecture notes
- [Creature Roster](docs/CREATURE_ROSTER.md) - Detailed creature specifications
- [Region Designs](docs/REGION_DESIGNS.md) - World and region design details
- [Open Questions](docs/OPEN_QUESTIONS.md) - Design decisions and questions

## Current Features

### Implemented Systems
- **Exploration** - Bramblewick Village, Whispering Woods, Hollow Ruins
- **Player Movement** - 8-directional movement with collision
- **Interactions** - NPCs, doors, items, creatures
- **Dialogue System** - Typing effect with multi-line progression
- **Combat System** - Turn-based battles with abilities
- **Creature Discovery** - Wild creatures in the woods
- **Taming** - Battle-based creature capture
- **Party Management** - Up to 4 creatures in party
- **Sanctuary** - Unlimited creature storage
- **Relationships** - Progress through interactions
- **Evolution** - Branching paths based on requirements
- **Quest System** - Rival and boss encounters
- **Experience & Leveling** - XP rewards and stat scaling

### Playable Areas
- **Bramblewick Village** - Starting settlement with buildings, NPC, doors, items
- **Whispering Woods** - Forest with creatures, trees, items, obstacles
- **Hollow Ruins** - Ancient ruins with puzzle, rival, and boss

### Creatures
- **Mosskit** - Nature starter creature
- **Cindlet** - Fire creature (available in data)
- Additional creatures can be added via JSON data files

## Development Roadmap

The project is organized into 9 development phases:

1. **Project Foundation** - Engine selection, repository setup, basic player movement
2. **World Exploration** - Bramblewick and Whispering Woods maps, transitions, NPCs
3. **Creature Foundation** - Species data, instances, statistics, party management
4. **Taming** - Encounter interactions, trust/battle/quest-based taming methods
5. **Combat** - Battle scene, turn order, abilities, damage calculations
6. **Sanctuary and Relationships** - Sanctuary environment, creature storage, relationship progression
7. **Evolution** - Evolution requirements, environmental tracking, branching evolution
8. **Story and Boss Encounter** - Quest flags, rival, Hollow Ruins, sound puzzle, boss battle
9. **Polish and Testing** - Animations, audio, UI, save/load, playtesting

See [BACKLOG.md](BACKLOG.md) for detailed task breakdown.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines.

## License

To be determined.
