extends StaticBody2D

## Breakable wall obstacle
## Can be destroyed by the player with rock-breaking ability

signal wall_broken

@onready var label: Label = $Label
@onready var trigger_area: Area2D = $TriggerArea

var player_in_range: bool = false
var is_broken: bool = false
var health: int = 3

func _ready() -> void:
	trigger_area.body_entered.connect(_on_body_entered)
	trigger_area.body_exited.connect(_on_body_exited)
	label.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not is_broken:
		player_in_range = true
		label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		label.visible = false

func _input(event: InputEvent) -> void:
	if player_in_range and event.is_action_pressed("interact"):
		attempt_break()

func attempt_break() -> void:
	if is_broken:
		return

	# TODO: Check if player has rock-breaking ability
	# For now, allow breaking for testing
	health -= 1
	print("BreakableWall: Hit! Health: ", health)

	if health <= 0:
		break_wall()

func break_wall() -> void:
	is_broken = true
	print("BreakableWall: Wall destroyed!")
	emit_signal("wall_broken")
	visible = false
	collision_layer = 0
	# TODO: Play break animation
	# TODO: Spawn debris particles
