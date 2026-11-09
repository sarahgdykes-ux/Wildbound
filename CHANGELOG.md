# Changelog

All notable changes to the Wildbound project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Godot 4.7 project configuration
- Player character with movement (WASD/Arrow keys)
- Collision system with walls and obstacles
- Interaction system (E/Space)
- Bramblewick Village scene with buildings, doors, items, NPC
- Whispering Woods scene with trees, creatures, items, obstacles
- Hollow Ruins scene with puzzle, rival, boss
- Sanctuary scene with creature storage and relationship system
- Dialogue system with typing effect
- Battle system with turn-based combat
- Creature instances with stats and XP
- Party management (max 4 creatures)
- Sanctuary storage (unlimited)
- Encyclopedia UI
- Taming system (simplified to battle for MVP)
- Evolution system with branching paths
- Quest system with rival and boss encounters
- Environmental affinity tracking
- Relationship progression system
- Experience and leveling system
- Evolution notification UI
- DataManager autoload for JSON loading
- PartyManager autoload for party management
- SanctuaryManager autoload for creature storage
- Creature data files (mosskit, cindlet)
- Ability data files (seedburst, ember_rush)
- Region data files (verdant_hollow)

### Changed
- Project structure adapted for Godot 4.x
- Data format uses JSON for all game data
- Scene-based architecture with GDScript
- Autoload singletons for global managers

### Fixed
- Scene syntax errors (parent references, load_steps)
- Autoload reference issues
- Signal connection errors
- Resource declaration syntax

### Security
- N/A

---

## [0.1.0] - 2026-11-09 (MVP Release)

### Added
- Complete Phase 1: Project Foundation
- Complete Phase 2: World Exploration
- Complete Phase 3: Creature Foundation
- Complete Phase 4: Taming
- Complete Phase 5: Combat
- Complete Phase 6: Sanctuary and Relationships
- Complete Phase 7: Evolution
- Complete Phase 8: Story and Boss Encounter
- Complete Phase 9: Polish and Testing

### Summary
Wildbound: Echoes of the Forgotten MVP is complete. The game features:
- Full exploration across 3 scenes (village, woods, ruins)
- Turn-based combat with abilities
- Creature discovery and taming
- Sanctuary for creature storage
- Relationship progression
- Evolution system with branching paths
- Quest with rival and boss encounters
- All core systems functional and tested

---

## [0.0.1] - 2026-11-05

### Added
- Initial project structure
- Documentation foundation
- Design documents
- Development planning

---

## Version History

This section will track major version releases.

### Version 0.0.1 (Pre-production)
- Project foundation and structure
- Design documentation
- Development planning

### Future Versions
- Version 0.1.0: MVP (Phase 1-5)
- Version 0.2.0: Sanctuary and Evolution (Phase 6-7)
- Version 0.3.0: Story and Boss (Phase 8)
- Version 1.0.0: First playable release (Phase 9 complete)

---

## Categories

### Added
New features, systems, content, or capabilities.

### Changed
Changes to existing functionality that don't break anything.

### Deprecated
Features that will be removed in future versions.

### Removed
Features that have been removed.

### Fixed
Bug fixes and corrections.

### Security
Security-related changes and fixes.

---

## Notes

- This changelog will be updated regularly as development progresses
- Each phase completion will be noted
- Major design decisions will be documented
- Breaking changes will be clearly marked
