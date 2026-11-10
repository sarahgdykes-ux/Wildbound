extends StaticBody2D

## Simple NPC for testing interactions

signal dialogue_started

@onready var label: Label = $Label

var player_in_range: bool = false
var dialogue_shown: bool = false

func _ready() -> void:
	# Use the NPC's own area for detection
	var area = Area2D.new()
	area.name = "InteractionArea"
	area.collision_layer = 0
	area.collision_mask = 1
	area.monitoring = true
	add_child(area)
	
	var shape = CollisionShape2D.new()
	var circle = CircleShape2D.new()
	circle.radius = 60.0
	shape.shape = circle
	area.add_child(shape)
	
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)
	
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
	emit_signal("dialogue_started")
