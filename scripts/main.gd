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

	# Load Bramblewick Village
	get_tree().change_scene_to_file("res://scenes/bramblewick_village.tscn")

func _on_data_load_failed(error: String):
	print("Main: ERROR - Failed to load data: ", error)
