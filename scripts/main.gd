extends Node

## Main game entry point
## This scene is loaded first and handles game initialization

func _ready():
	print("Wildbound: Echoes of the Forgotten")
	print("Initializing game...")

	# Wait for data to load
	DataManager.data_loaded.connect(_on_data_loaded)
	DataManager.data_load_failed.connect(_on_data_load_failed)

	if DataManager.is_loaded:
		_on_data_loaded()
	else:
		print("Main: Waiting for data to load...")

func _on_data_loaded():
	print("Main: Data loaded successfully!")
	print("  Creatures available: ", DataManager.get_all_creature_ids())
	print("  Abilities available: ", DataManager.get_all_ability_ids())
	print("  Regions available: ", DataManager.get_all_region_ids())

	# Test loading specific data
	var mosskit = DataManager.get_creature("mosskit")
	if not mosskit.is_empty():
		print("Main: Successfully loaded Mosskit data")

	# Create test creature instance
	var test_creature = CreatureInstance.new()
	test_creature.initialize(mosskit)
	test_creature.creature_id = "mosskit_test_001"
	print("Main: Created test creature instance")
	print("  HP: ", test_creature.get_max_hp())
	print("  Level: ", test_creature.level)

	# Add to party
	PartyManager.add_creature(test_creature)
	print("Main: Added creature to party")

	# Load Bramblewick Village
	get_tree().change_scene_to_file("res://scenes/bramblewick_village.tscn")

func _on_data_load_failed(error: String):
	print("Main: ERROR - Failed to load data: ", error)
