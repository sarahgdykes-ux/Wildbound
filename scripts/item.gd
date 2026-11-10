extends Area2D

## Collectible item
## Can be picked up by the player

signal item_collected(item_id: String)

@onready var label: Label = $Label

var item_id: String = "item"
var item_name: String = "Item"
var is_collected: bool = false

func _ready() -> void:
	label.visible = false

func _process(_delta: float) -> void:
	# Check if player is nearby for label visibility
	var player = get_tree().get_first_node_in_group("player")
	if player and not is_collected:
		var distance = global_position.distance_to(player.global_position)
		label.visible = distance < 60.0

func interact() -> void:
	if is_collected:
		return

	is_collected = true
	print("Item: Collected ", item_name)
	emit_signal("item_collected", item_id)
	visible = false
	# TODO: Add to player inventory
	# TODO: Play pickup animation
