# Godot Setup Guide

This guide provides specific instructions for setting up and working with the Wildbound project in Godot 4.x.

## Installation

### Download Godot 4.x

1. Visit: https://godotengine.org/download/windows/
2. Download: **Godot Engine 4.7.2 - Windows - x86_64** (standard version)
3. Extract the ZIP file to a location of your choice
4. Run `Godot_v4.7.2-stable_win64.exe` - no installation required

### Optional: Add to PATH

To use Godot from the command line:

1. Copy the path to the extracted Godot folder (e.g., `C:\Godot\`)
2. Add it to your system PATH:
   - Press Windows key, search for "Environment Variables"
   - Click "Edit the system environment variables"
   - Click "Environment Variables"
   - Under "System variables", find "Path" and click "Edit"
   - Click "New" and add the Godot folder path
   - Click OK on all dialogs
3. Restart your terminal
4. Verify with: `godot --version`

## Opening the Project

### Method 1: Import Existing Project

1. Launch Godot
2. Click "Import" on the project manager
3. Navigate to the Wildbound folder
4. Select the folder and click "Import"
5. The project will open in the editor

### Method 2: Create New Project

1. Launch Godot
2. Click "New Project"
3. Click the folder icon next to "Project Path"
4. Navigate to and select the Wildbound folder
5. Click "Create & Edit"

## Project Structure

```
Wildbound/
├── project.godot          # Godot project configuration
├── icon.svg               # Project icon
├── scenes/                # Scene files (.tscn)
│   └── main.tscn         # Main scene
├── scripts/               # Script files (.gd)
│   └── main.gd           # Main script
├── autoload/              # Singleton scripts (managers)
├── resources/             # Resource files (.tres, .res)
├── assets/                # Art, audio, and other assets
│   ├── sprites/          # Character and creature sprites
│   ├── tilesets/         # Environment tilesets
│   ├── audio/            # Music and sound effects
│   └── ui/               # UI elements and icons
├── data/                  # Game data definitions (JSON)
│   ├── creatures/        # Creature species and instances
│   ├── abilities/        # Ability definitions
│   ├── regions/         # Region and map data
│   └── quests/           # Quest definitions
├── docs/                  # Documentation
├── design/                # Design documents
├── tests/                 # Unit and integration tests
└── tools/                 # Build tools and utilities
```

## Running the Project

### In Editor

1. Open the project in Godot
2. Press **F5** or click the "Play" button (▶) in the top-right
3. The game will launch in a new window

### From Command Line

```bash
# Navigate to project directory
cd C:\Users\sarah\Documents\GitHub\Wildbound

# Run the project
godot

# Run with specific scene
godot scenes/main.tscn
```

## Project Settings

The project has been configured with:

- **Display:** 1280x720 resolution, windowed mode
- **Input:**
  - WASD / Arrow keys: Movement
  - E / Space: Interact
  - Escape: Menu
- **Collision Layers:** 32 layers configured for different game entities
- **Rendering:** Nearest neighbor filtering for pixel art

You can modify these in:
`Project > Project Settings`

## Development Workflow

### Creating a New Scene

1. Right-click in the FileSystem dock
2. Select "New Scene"
3. Choose a root node (e.g., CharacterBody2D for player)
4. Add child nodes as needed
5. Attach scripts
6. Save the scene

### Creating a Script

1. Create or select a node
2. Click the script icon (📜) in the Inspector
3. Click "Extend" to create a new script
4. Choose the location and name
5. Godot will create and open the script

### Testing

1. Press **F5** to run the main scene
2. Press **F6** to run the current scene
3. Press **F7** to run the current scene as a test

### Debugging

1. Set breakpoints by clicking the gutter (left side of script)
2. Press **F4** to attach debugger
3. Use the Debugger dock to inspect variables
4. Use `print()` statements for quick debugging

## Common Tasks

### Adding a Sprite

1. Add a `Sprite2D` node to your scene
2. In the Inspector, find "Texture"
3. Drag and drop your sprite image
4. Adjust offset and scale as needed

### Adding Collision

1. Add a `CollisionShape2D` as a child of a physics node
2. In the Inspector, find "Shape"
3. Choose a shape (Rectangle, Circle, etc.)
4. Adjust the shape in the viewport

### Connecting Signals

1. Select the node emitting the signal
2. In the Inspector, click the "Node" tab (next to Inspector)
3. Double-click the signal you want to connect
4. Choose the target node and method
5. Godot will create the connection and method stub

## Godot Resources

- **Official Documentation:** https://docs.godotengine.org/
- **GDScript Reference:** https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html
- **2D Tutorials:** https://docs.godotengine.org/en/stable/tutorials/2d/index.html
- **Community Forum:** https://forum.godotengine.org/
- **GitHub:** https://github.com/godotengine/godot

## Troubleshooting

### Project won't open

- Ensure you're using Godot 4.x (not 3.x)
- Check that `project.godot` exists in the project root
- Try creating a new project and copying files over

### Missing resources

- Check the FileSystem dock for missing file indicators (!)
- Ensure asset paths are correct
- Reimport assets if needed (right-click > Reimport)

### Performance issues

- Check the Debugger > Performance tab
- Reduce texture sizes if needed
- Optimize collision shapes
- Use `visible = false` for off-screen objects

## Next Steps

After setting up Godot:

1. Review the [Development Roadmap](docs/DEVELOPMENT_ROADMAP.md)
2. Check the [Backlog](BACKLOG.md) for current tasks
3. Read [CONVENTIONS.md](CONVENTIONS.md) for coding standards
4. Start with Phase 1 tasks in the backlog

## Support

For issues specific to this project:
- Check [docs/OPEN_QUESTIONS.md](docs/OPEN_QUESTIONS.md) for design decisions
- Review [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for technical guidance
- See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines

For Godot-specific issues:
- Consult Godot documentation
- Search the Godot forums
- Check Godot GitHub issues
