extends Area2D

## Base class for interactable objects
## Handles player detection and interaction prompts

signal interacted

@onready var label: Label = $Label
@onready var trigger_area: Area2D = $TriggerArea

var player_in_range: bool = false

func _ready() -> void:
	# Connect to body entered/exited signals
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	trigger_area.body_entered.connect(_on_trigger_entered)
	trigger_area.body_exited.connect(_on_trigger_exited)

	# Hide label initially
	label.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true
		label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		label.visible = false

func _on_trigger_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true
		label.visible = true

func _on_trigger_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		label.visible = false

func _input(event: InputEvent) -> void:
	if player_in_range and event.is_action_pressed("interact"):
		interact()

## Override this in child classes to define interaction behavior
func interact() -> void:
	print("Interacted with: ", name)
	emit_signal("interacted")
