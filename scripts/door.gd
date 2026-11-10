extends Area2D

## Door interactable object
## Can be opened/closed by the player

signal door_opened(building_name: String)
signal door_closed(building_name: String)

@onready var label: Label = $Label
@onready var trigger_area: Area2D = $TriggerArea

var player_in_range: bool = false
var is_open: bool = false
var building_name: String = "Building"

func _ready() -> void:
	trigger_area.body_entered.connect(_on_body_entered)
	trigger_area.body_exited.connect(_on_body_exited)
	label.visible = false
	
	# Set building_name from node name
	building_name = name.replace("Door", "").replace("_", " ").capitalize()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true
		label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		label.visible = false

func _input(event: InputEvent) -> void:
	if player_in_range and event.is_action_pressed("interact"):
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
