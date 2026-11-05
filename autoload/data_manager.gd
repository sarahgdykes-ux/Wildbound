extends Node

## Data Manager
## Autoload singleton for loading and managing game data

signal data_loaded
signal data_load_failed(error: String)

var creature_data: Dictionary = {}
var ability_data: Dictionary = {}
var region_data: Dictionary = {}
var quest_data: Dictionary = {}

var is_loaded: bool = false

func _ready() -> void:
	print("DataManager: Initializing...")
	load_all_data()

## Load all game data files
func load_all_data() -> void:
	print("DataManager: Loading game data...")

	var error_occurred := false
	var error_message := ""

	# Load creature data
	if not load_creature_data():
		error_occurred = true
		error_message = "Failed to load creature data"

	# Load ability data
	if not load_ability_data():
		error_occurred = true
		error_message = "Failed to load ability data"

	# Load region data
	if not load_region_data():
		error_occurred = true
		error_message = "Failed to load region data"

	if error_occurred:
		print("DataManager: ERROR - ", error_message)
		emit_signal("data_load_failed", error_message)
	else:
		is_loaded = true
		print("DataManager: All data loaded successfully")
		print("  - Creatures: ", creature_data.size())
		print("  - Abilities: ", ability_data.size())
		print("  - Regions: ", region_data.size())
		emit_signal("data_loaded")

## Load creature species data from JSON files
func load_creature_data() -> bool:
	var dir = DirAccess.open("res://data/creatures/")
	if not dir:
		print("DataManager: Failed to open creatures directory")
		return false

	dir.list_dir_begin()
	var file_name = dir.get_next()

	while file_name != "":
		if file_name.ends_with(".json"):
			var file_path = "res://data/creatures/" + file_name
			var json_text = FileAccess.get_file_as_string(file_path)
			var json = JSON.new()

			var parse_result = json.parse(json_text)
			if parse_result == OK:
				var data = json.data
				if data.has("species_id"):
					creature_data[data.species_id] = data
					print("DataManager: Loaded creature: ", data.species_id)
				else:
					print("DataManager: WARNING - Creature data missing species_id: ", file_name)
			else:
				print("DataManager: ERROR - Failed to parse JSON: ", file_name)
				print("  Error: ", json.get_error_message())

		file_name = dir.get_next()

	dir.list_dir_end()
	return true

## Load ability data from JSON files
func load_ability_data() -> bool:
	var dir = DirAccess.open("res://data/abilities/")
	if not dir:
		print("DataManager: Failed to open abilities directory")
		return false

	dir.list_dir_begin()
	var file_name = dir.get_next()

	while file_name != "":
		if file_name.ends_with(".json"):
			var file_path = "res://data/abilities/" + file_name
			var json_text = FileAccess.get_file_as_string(file_path)
			var json = JSON.new()

			var parse_result = json.parse(json_text)
			if parse_result == OK:
				var data = json.data
				if data.has("ability_id"):
					ability_data[data.ability_id] = data
					print("DataManager: Loaded ability: ", data.ability_id)
				else:
					print("DataManager: WARNING - Ability data missing ability_id: ", file_name)
			else:
				print("DataManager: ERROR - Failed to parse JSON: ", file_name)
				print("  Error: ", json.get_error_message())

		file_name = dir.get_next()

	dir.list_dir_end()
	return true

## Load region data from JSON files
func load_region_data() -> bool:
	var dir = DirAccess.open("res://data/regions/")
	if not dir:
		print("DataManager: Failed to open regions directory")
		return false

	dir.list_dir_begin()
	var file_name = dir.get_next()

	while file_name != "":
		if file_name.ends_with(".json"):
			var file_path = "res://data/regions/" + file_name
			var json_text = FileAccess.get_file_as_string(file_path)
			var json = JSON.new()

			var parse_result = json.parse(json_text)
			if parse_result == OK:
				var data = json.data
				if data.has("region_id"):
					region_data[data.region_id] = data
					print("DataManager: Loaded region: ", data.region_id)
				else:
					print("DataManager: WARNING - Region data missing region_id: ", file_name)
			else:
				print("DataManager: ERROR - Failed to parse JSON: ", file_name)
				print("  Error: ", json.get_error_message())

		file_name = dir.get_next()

	dir.list_dir_end()
	return true

## Get creature data by species ID
func get_creature(species_id: String) -> Dictionary:
	if creature_data.has(species_id):
		return creature_data[species_id]
	else:
		print("DataManager: WARNING - Creature not found: ", species_id)
		return {}

## Get ability data by ability ID
func get_ability(ability_id: String) -> Dictionary:
	if ability_data.has(ability_id):
		return ability_data[ability_id]
	else:
		print("DataManager: WARNING - Ability not found: ", ability_id)
		return {}

## Get region data by region ID
func get_region(region_id: String) -> Dictionary:
	if region_data.has(region_id):
		return region_data[region_id]
	else:
		print("DataManager: WARNING - Region not found: ", region_id)
		return {}

## Get all creature IDs
func get_all_creature_ids() -> Array:
	return creature_data.keys()

## Get all ability IDs
func get_all_ability_ids() -> Array:
	return ability_data.keys()

## Get all region IDs
func get_all_region_ids() -> Array:
	return region_data.keys()
