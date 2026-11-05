extends StaticBody2D

## Simple NPC for testing interactions

@onready var label: Label = $Label
@onready var interaction_area: Area2D = $InteractionArea

var player_in_range: bool = false
var dialogue_shown: bool = false

func _ready() -> void:
	interaction_area.body_entered.connect(_on_body_entered)
	interaction_area.body_exited.connect(_on_body_exited)
	label.visible = false

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
	if not dialogue_shown:
		print("NPC: Hello, traveler! Welcome to Wildbound!")
		dialogue_shown = true
	else:
		print("NPC: Is there anything else you need?")
