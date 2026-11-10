extends Area2D

## Door interactable object
## Can be opened/closed by the player

signal door_opened(building_name: String)
signal door_closed(building_name: String)

@onready var label: Label = $Label

var is_open: bool = false
var building_name: String = "Building"

func _ready() -> void:
	label.visible = false
	
	# Set building_name from node name
	building_name = name.replace("Door", "").replace("_", " ").capitalize()

func _process(_delta: float) -> void:
	# Check if player is nearby for label visibility
	var player = get_tree().get_first_node_in_group("player")
	if player:
		var distance = global_position.distance_to(player.global_position)
		label.visible = distance < 60.0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		var player = get_tree().get_first_node_in_group("player")
		if player:
			var distance = global_position.distance_to(player.global_position)
			if distance < 60.0:
				interact()

func interact() -> void:
	if is_open:
		close_door()
	else:
		open_door()

func open_door() -> void:
	is_open = true
	print("Door: Opening ", building_name)
	emit_signal("door_opened", building_name)
	# TODO: Play door open animation
	# TODO: Enable entering building

func close_door() -> void:
	is_open = false
	print("Door: Closing ", building_name)
	emit_signal("door_closed", building_name)
	# TODO: Play door close animation
