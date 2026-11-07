extends Node2D

## Whispering Woods scene
## Introduction to exploration and taming

@onready var encounter_ui = $EncounterUI

func _ready():
	print("WhisperingWoods: Forest loaded")

	# Connect to village exit
	$VillageExit.body_entered.connect(_on_village_exit_entered)

	# Connect to breakable wall
	$Obstacles/BreakableWall.wall_broken.connect(_on_wall_broken)

	# Connect creature encounters
	for creature in $Creatures.get_children():
		creature.encounter_started.connect(_on_creature_encounter)

	# Connect encounter UI
	encounter_ui.taming_success.connect(_on_taming_success)
	encounter_ui.taming_failed.connect(_on_taming_failed)

func _on_village_exit_entered(body: Node2D):
	if body.is_in_group("player"):
		print("WhisperingWoods: Player exiting to Bramblewick Village")
		get_tree().change_scene_to_file("res://scenes/bramblewick_village.tscn")

func _on_wall_broken():
	print("WhisperingWoods: Path opened!")

func _on_creature_encounter(creature_data: Dictionary):
	print("WhisperingWoods: Creature encountered: ", creature_data.name)
	encounter_ui.start_encounter(creature_data)

func _on_taming_success(species_id: String):
	print("WhisperingWoods: Successfully tamed ", species_id)
	# Create creature instance
	var species_data = DataManager.get_creature(species_id)
	var new_creature = CreatureInstance.new()
	new_creature.initialize(species_data)
	new_creature.creature_id = species_id + "_" + str(randi(1000))
	# Add to sanctuary
	SanctuaryManager.add_creature(new_creature)
	# Remove creature sprite from scene
	# TODO: Implement sprite removal

func _on_taming_failed():
	print("WhisperingWoods: Taming failed")
