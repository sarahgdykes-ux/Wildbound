# Wildbound: Echoes of the Forgotten

A top-down 2D fantasy adventure RPG featuring creature discovery, taming, and strategic turn-based battles.

## Project Status

**Pre-production** - Project foundation and structure being established.

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

Engine selection is pending. Recommended options:
- **Godot** (primary recommendation) - Strong 2D capabilities, scene-based architecture, GDScript
- GameMaker - Strong 2D workflow for sprite-based RPGs
- Unity - Extensive ecosystem, more infrastructure than initially required
- Rust - High performance and control, higher initial development cost

## Documentation

- [Game Design Document](docs/GDD.md) - Complete game design specification
- [Development Roadmap](docs/DEVELOPMENT_ROADMAP.md) - Implementation phases and milestones
- [Architecture](docs/ARCHITECTURE.md) - Technical architecture notes
- [Creature Roster](docs/CREATURE_ROSTER.md) - Detailed creature specifications
- [Region Designs](docs/REGION_DESIGNS.md) - World and region design details
- [Open Questions](docs/OPEN_QUESTIONS.md) - Design decisions and questions

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
