extends Node2D

## Bramblewick Village scene
## Starting settlement and hub for the player

@onready var dialogue_box = $DialogueBox
@onready var village_guide = $VillageGuide

func _ready():
	print("BramblewickVillage: Village loaded")

	# Connect to woods exit
	$WoodsExit.body_entered.connect(_on_woods_exit_entered)
	
	# Connect to village exit
	$VillageExit.body_entered.connect(_on_village_exit_entered)

	# Connect to dialogue box
	dialogue_box.dialogue_finished.connect(_on_dialogue_finished)

	# Set up village guide dialogue
	village_guide.dialogue_started.connect(_on_guide_dialogue)

	# Set up doors
	for door in $Doors.get_children():
		door.door_opened.connect(_on_door_opened)
		door.door_closed.connect(_on_door_closed)

	# Set up items
	for item in $Items.get_children():
		item.item_collected.connect(_on_item_collected)

func _on_woods_exit_entered(body: Node2D):
	if body.is_in_group("player"):
		print("BramblewickVillage: Player exiting to Whispering Woods")
		# TODO: Save player position
		# TODO: Transition to Whispering Woods
		get_tree().change_scene_to_file("res://scenes/whispering_woods.tscn")

func _on_village_exit_entered(body: Node2D):
	if body.is_in_group("player"):
		print("BramblewickVillage: Player at village exit (placeholder)")
		# TODO: Future expansion area

func _on_guide_dialogue():
	var dialogue_lines = [
		"Welcome to Bramblewick Village, traveler!",
		"I am the village guide. I can help you get started on your journey.",
		"To the east lies the Whispering Woods, where you'll find wild creatures.",
		"Press E or Space to interact with people and objects.",
		"Try collecting the items scattered around the village!",
		"Good luck on your adventure!"
	]
	dialogue_box.start_dialogue("Village Guide", dialogue_lines)

func _on_dialogue_finished():
	print("BramblewickVillage: Dialogue finished")

func _on_door_opened(building_name: String):
	print("BramblewickVillage: Player opened ", building_name)
	if building_name == "Sanctuary":
		get_tree().change_scene_to_file("res://scenes/sanctuary.tscn")
	# TODO: Enter other buildings

func _on_door_closed(building_name: String):
	print("BramblewickVillage: Player closed ", building_name)

func _on_item_collected(item_id: String):
	print("BramblewickVillage: Player collected item: ", item_id)
	# TODO: Add to inventory
