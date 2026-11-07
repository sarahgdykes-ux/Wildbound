extends Area2D

## Collectible item
## Can be picked up by the player

signal item_collected(item_id: String)

@onready var label: Label = $Label
@onready var trigger_area: Area2D = $TriggerArea

var player_in_range: bool = false
var item_id: String = "item"
var item_name: String = "Item"
var is_collected: bool = false

func _ready() -> void:
	trigger_area.body_entered.connect(_on_body_entered)
	trigger_area.body_exited.connect(_on_body_exited)
	label.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not is_collected:
		player_in_range = true
		label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		label.visible = false

func _input(event: InputEvent) -> void:
	if player_in_range and event.is_action_pressed("interact"):
		collect()

func collect() -> void:
	if is_collected:
		return

	is_collected = true
	print("Item: Collected ", item_name)
	emit_signal("item_collected", item_id)
	visible = false
	# TODO: Add to player inventory
	# TODO: Play pickup animation
