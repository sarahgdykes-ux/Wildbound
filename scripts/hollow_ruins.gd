extends Node2D

## Hollow Ruins scene
## Ancient ruins with puzzle, rival, and boss

@onready var dialogue_box = $DialogueBox
@onready var rival = $Rival
@onready var guardian = $BossArena/Guardian
@onready var exit = $Exit

var puzzle_solved: bool = false
var rival_defeated: bool = false
var guardian_defeated: bool = false
var quest_complete: bool = false

func _ready():
	print("HollowRuins: Loaded")
	
	# Connect rival
	rival.body_entered.connect(_on_rival_entered)
	
	# Connect guardian
	guardian.body_entered.connect(_on_guardian_entered)
	
	# Connect exit
	exit.body_entered.connect(_on_exit_entered)
	
	# Set up puzzle
	_setup_puzzle()

func _setup_puzzle():
	# Simple puzzle: interact with pillars in order 1-2-3
	# For MVP, just auto-solve
	puzzle_solved = true
	print("HollowRuins: Puzzle solved")

func _on_rival_entered(body: Node2D):
	if body.is_in_group("player") and not rival_defeated:
		print("HollowRuins: Rival encountered")
		var dialogue_lines = [
			"Ah, another challenger!",
			"I've been waiting for someone worthy.",
			"Let's see what your creatures can do!"
		]
		dialogue_box.start_dialogue("Rival", dialogue_lines)
		await dialogue_box.dialogue_finished
		_start_rival_battle()

func _start_rival_battle():
	print("HollowRuins: Starting rival battle")
	# For MVP, use default battle with mosskit
	var battle_scene = load("res://scenes/battle.tscn")
	var battle = battle_scene.instantiate()
	get_tree().root.add_child(battle)
	battle.battle_ended.connect(_on_rival_battle_ended)
	
	var player_creature = PartyManager.get_party_member(0)
	if not player_creature:
		var mosskit_data = DataManager.get_creature("mosskit")
		player_creature = CreatureInstance.new()
		player_creature.initialize(mosskit_data)
		player_creature.creature_id = "mosskit_party_001"
	
	# Create rival creature (stronger mosskit) - deep copy to avoid modifying original
	var mosskit_data = DataManager.get_creature("mosskit")
	var rival_data = mosskit_data.duplicate(true)
	rival_data.name = "Rival's Mosskit"
	rival_data.base_stats = rival_data.base_stats.duplicate(true)
	rival_data.base_stats.hp = 70
	rival_data.base_stats.attack = 45
	rival_data.base_stats.defense = 40
	
	battle.start_battle(player_creature, rival_data)

func _on_rival_battle_ended(result: String):
	print("HollowRuins: Rival battle ended: ", result)
	if result == "victory":
		rival_defeated = true
		print("HollowRuins: Rival defeated!")

func _on_guardian_entered(body: Node2D):
	if body.is_in_group("player") and not guardian_defeated and rival_defeated:
		print("HollowRuins: Guardian encountered")
		var dialogue_lines = [
			"Who disturbs the Hollow Guardian?",
			"You have proven yourself worthy...",
			"Face me if you dare!"
		]
		dialogue_box.start_dialogue("Hollow Guardian", dialogue_lines)
		await dialogue_box.dialogue_finished
		_start_guardian_battle()
	elif not rival_defeated:
		print("HollowRuins: Defeat the rival first!")

func _start_guardian_battle():
	print("HollowRuins: Starting guardian battle")
	var battle_scene = load("res://scenes/battle.tscn")
	var battle = battle_scene.instantiate()
	get_tree().root.add_child(battle)
	battle.battle_ended.connect(_on_guardian_battle_ended)
	
	var player_creature = PartyManager.get_party_member(0)
	if not player_creature:
		var mosskit_data = DataManager.get_creature("mosskit")
		player_creature = CreatureInstance.new()
		player_creature.initialize(mosskit_data)
		player_creature.creature_id = "mosskit_party_001"
	
	# Create guardian (boss creature)
	var guardian_data = {
		"species_id": "hollow_guardian",
		"name": "Hollow Guardian",
		"elements": ["shadow"],
		"role": "boss",
		"base_stats": {
			"hp": 150,
			"attack": 60,
			"defense": 50,
			"magic": 55,
			"resistance": 60,
			"speed": 40
		},
		"abilities": ["shadow_strike", "void_beam"]
	}
	
	battle.start_battle(player_creature, guardian_data)

func _on_guardian_battle_ended(result: String):
	print("HollowRuins: Guardian battle ended: ", result)
	if result == "victory":
		guardian_defeated = true
		quest_complete = true
		print("HollowRuins: Guardian defeated! Quest complete!")
		_complete_quest()

func _complete_quest():
	print("HollowRuins: Chapter One quest completed!")
	# TODO: Add quest completion rewards

func _on_exit_entered(body: Node2D):
	if body.is_in_group("player"):
		print("HollowRuins: Exiting to village")
		get_tree().change_scene_to_file("res://scenes/bramblewick_village.tscn")
