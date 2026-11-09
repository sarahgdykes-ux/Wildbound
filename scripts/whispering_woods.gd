extends Node2D

## Whispering Woods scene
## Introduction to exploration and taming

@onready var encounter_ui = $EncounterUI

func _ready():
	print("WhisperingWoods: Forest loaded")

	# Connect to village exit
	$VillageExit.body_entered.connect(_on_village_exit_entered)
	
	# Connect to ruins exit
	$RuinsExit.body_entered.connect(_on_ruins_exit_entered)

	# Connect to breakable wall
	$Obstacles/BreakableWall.wall_broken.connect(_on_wall_broken)

	# Connect creature encounters
	for creature in $Creatures.get_children():
		creature.battle_started.connect(_on_creature_encounter)

	# Connect encounter UI
	encounter_ui.taming_success.connect(_on_taming_success)
	encounter_ui.taming_failed.connect(_on_taming_failed)

func _on_village_exit_entered(body: Node2D):
	if body.is_in_group("player"):
		print("WhisperingWoods: Player exiting to Bramblewick Village")
		get_tree().change_scene_to_file("res://scenes/bramblewick_village.tscn")

func _on_ruins_exit_entered(body: Node2D):
	if body.is_in_group("player"):
		print("WhisperingWoods: Player exiting to Hollow Ruins")
		get_tree().change_scene_to_file("res://scenes/hollow_ruins.tscn")

func _on_wall_broken():
	print("WhisperingWoods: Path opened!")

func _on_creature_encounter(creature_data: Dictionary):
	print("WhisperingWoods: Creature encountered: ", creature_data.name)
	# Trigger battle instead of taming
	var battle_scene = load("res://scenes/battle.tscn")
	var battle = battle_scene.instantiate()
	get_tree().root.add_child(battle)
	battle.battle_ended.connect(_on_battle_ended)
	
	# Get first party member or use default creature
	var player_creature = PartyManager.get_party_member(0)
	if not player_creature:
		# Create a default mosskit for testing
		var mosskit_data = DataManager.get_creature("mosskit")
		player_creature = CreatureInstance.new()
		player_creature.initialize(mosskit_data)
		player_creature.creature_id = "mosskit_party_001"
	
	battle.start_battle(player_creature, creature_data)

func _on_battle_ended(result: String):
	print("WhisperingWoods: Battle ended: ", result)
	if result == "victory":
		# Add creature to sanctuary
		var species_data = DataManager.get_creature(creature_data.species_id)
		var new_creature = CreatureInstance.new()
		new_creature.initialize(species_data)
		new_creature.creature_id = species_data.species_id + "_" + str(randi(1000))
		SanctuaryManager.add_creature(new_creature)
		# Remove creature sprite
		visible = false
