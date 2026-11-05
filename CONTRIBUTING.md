# Contributing to Wildbound

Thank you for your interest in contributing to Wildbound: Echoes of the Forgotten!

## Project Status

**Pre-production** - The project is currently in the foundation phase. We are setting up the project structure, selecting an engine, and preparing for initial development.

## Getting Started

### Prerequisites

- **Engine** (to be selected)
  - Godot 4.x (recommended)
  - GameMaker Studio 2
  - Unity 2022 LTS
  - Rust toolchain (if selected)

- **Version Control**
  - Git
  - GitHub account (if using GitHub)

- **Development Tools**
  - Text editor or IDE (VS Code recommended)
  - Image editor for sprites (Aseprite, Photoshop, etc.)
  - Audio editor for sound effects and music (Audacity, etc.)

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/Wildbound.git
   cd Wildbound
   ```

2. **Install the engine**
   - Follow the installation instructions for the selected engine
   - Configure the engine for the project

3. **Open the project**
   - Open the project in the selected engine
   - Verify that all assets load correctly

4. **Run the project**
   - Test that the project runs without errors
   - Verify basic functionality

## Development Workflow

### Branching Strategy

- **main** - Stable production code
- **develop** - Integration branch for features
- **feature/*** - Feature branches (e.g., feature/combat-system)
- **bugfix/*** - Bug fix branches (e.g., bugfix/save-crash)
- **refactor/*** - Refactoring branches (e.g., refactor/creature-data)

### Creating a Branch

1. Create a new branch from `develop`:
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/your-feature-name
   ```

2. Make your changes

3. Commit your changes with clear messages:
   ```bash
   git commit -m "Add creature taming system"
   ```

4. Push your branch:
   ```bash
   git push origin feature/your-feature-name
   ```

### Commit Message Convention

Use clear, descriptive commit messages:

- **Feature:** `feat: add creature taming system`
- **Bug fix:** `fix: resolve save file corruption`
- **Documentation:** `docs: update architecture documentation`
- **Refactoring:** `refactor: simplify creature data structure`
- **Style:** `style: format code according to conventions`
- **Test:** `test: add unit tests for damage calculation`
- **Chore:** `chore: update dependencies`

### Pull Request Process

1. Update your branch with the latest `develop`:
   ```bash
   git checkout develop
   git pull origin develop
   git checkout feature/your-feature-name
   git rebase develop
   ```

2. Create a pull request to `develop`
3. Fill out the PR template
4. Request review from team members
5. Address review feedback
6. Ensure CI checks pass
7. Merge when approved

## Code Conventions

### General Guidelines

- Follow the coding style established in `CONVENTIONS.md`
- Write clear, self-documenting code
- Add comments for complex logic
- Keep functions focused and small
- Avoid code duplication

### Naming Conventions

- **Classes/Types:** PascalCase (e.g., `CreatureManager`)
- **Functions/Methods:** camelCase (e.g., `calculateDamage`)
- **Variables:** camelCase (e.g., `creatureId`)
- **Constants:** UPPER_SNAKE_CASE (e.g., `MAX_PARTY_SIZE`)
- **Files:** snake_case or engine convention (e.g., `creature_manager.gd`)

### Documentation

- Document public APIs
- Add inline comments for complex algorithms
- Update documentation when changing functionality
- Keep README files up to date

## Testing

### Unit Tests

- Write unit tests for core systems
- Test edge cases and error conditions
- Maintain test coverage above 80%

### Integration Tests

- Test system interactions
- Test end-to-end flows
- Test save/load operations

### Playtesting

- Conduct regular playtesting sessions
- Document feedback
- Prioritize critical issues

## Asset Guidelines

### Sprites

- Use consistent pixel art style
- Maintain appropriate resolution
- Name files descriptively
- Include source files (e.g., .aseprite files)

### Audio

- Use consistent audio quality
- Normalize volume levels
- Name files descriptively
- Include source files when possible

### Data Files

- Use JSON for data definitions
- Validate data before committing
- Document data structure changes
- Keep data files versioned

## Design Documentation

### Updating Documentation

- Keep Game Design Document (GDD) up to date
- Document design decisions in OPEN_QUESTIONS.md
- Update ROADMAP.md when milestones change
- Add new creatures to CREATURE_ROSTER.md

### Design Changes

- Discuss major design changes with the team
- Update relevant documentation
- Consider impact on existing systems
- Update the backlog if needed

## Issue Reporting

### Bug Reports

When reporting bugs, include:
- Description of the bug
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots or recordings if applicable
- System information (engine version, OS, etc.)

### Feature Requests

When requesting features, include:
- Description of the feature
- Why it's needed
- Potential implementation approach
- Priority level

## Questions and Discussion

- Use GitHub Issues for questions and discussions
- Tag relevant team members
- Provide context and background
- Be respectful and constructive

## Code of Conduct

### Be Respectful

- Treat everyone with respect
- Welcome newcomers
- Assume good intentions
- Be constructive in feedback

### Be Collaborative

- Work together toward common goals
- Share knowledge
- Help others learn
- Accept feedback gracefully

### Be Professional

- Focus on what is best for the project
- Communicate clearly and professionally
- Respect time and effort
- Follow project guidelines

## License

This project's license will be determined. Until then, all contributions are subject to the project's intellectual property policies.

## Contact

For questions about contributing, contact the project maintainers through GitHub Issues or the project's communication channels.

## Acknowledgments

Thank you to all contributors who help make Wildbound a reality!
