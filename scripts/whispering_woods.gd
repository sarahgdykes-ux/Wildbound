extends Node2D

## Whispering Woods scene
## Introduction to exploration and taming

func _ready():
	print("WhisperingWoods: Forest loaded")

	# Connect to village exit
	$VillageExit.body_entered.connect(_on_village_exit_entered)

func _on_village_exit_entered(body: Node2D):
	if body.is_in_group("player"):
		print("WhisperingWoods: Player exiting to Bramblewick Village")
		# TODO: Save player position
		# TODO: Transition to Bramblewick Village
		get_tree().change_scene_to_file("res://scenes/bramblewick_village.tscn")
