extends Node2D

## Test world scene script
## Handles test world initialization

func _ready():
	print("TestWorld: Initializing test world...")

	if DataManager.is_loaded:
		print("TestWorld: Data is loaded")
	else:
		print("TestWorld: Waiting for data...")
		DataManager.data_loaded.connect(_on_data_loaded)

func _on_data_loaded():
	print("TestWorld: Data loaded, world ready!")
