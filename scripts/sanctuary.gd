extends Node2D

## Sanctuary scene
## Home for discovered creatures

@onready var creatures_node = $Creatures
@onready var exit_button = $ExitButton
@onready var info_label = $InfoLabel
@onready var party_label = $PartyLabel

var creature_sprites: Dictionary = {}

func _ready():
	print("Sanctuary: Loaded")
	exit_button.pressed.connect(_on_exit_pressed)
	refresh_creatures()

func _on_exit_pressed():
	print("Sanctuary: Exiting to village")
	get_tree().change_scene_to_file("res://scenes/bramblewick_village.tscn")

func refresh_creatures():
	# Clear existing sprites
	for sprite in creatures_node.get_children():
		sprite.queue_free()
	creature_sprites.clear()
	
	# Get creatures from SanctuaryManager
	var sanctuary_creatures = SanctuaryManager.get_sanctuary()
	
	# Create sprites for each creature
	for creature in sanctuary_creatures:
		var sprite = ColorRect.new()
		sprite.size = Vector2(32, 32)
		sprite.color = _get_creature_color(creature.species_id)
		sprite.position = _get_random_position()
		creatures_node.add_child(sprite)
		creature_sprites[creature.creature_id] = sprite
	
	# Add click interaction
		_add_interaction(sprite, creature)
	
	info_label.text = "Sanctuary - " + str(sanctuary_creatures.size()) + " Creatures"
	party_label.text = "Party: " + str(PartyManager.get_party_size()) + "/" + str(PartyManager.MAX_PARTY_SIZE)

func _get_creature_color(species_id: String) -> Color:
	# Different colors for different species
	match species_id:
		"mosskit":
			return Color(0.2, 0.8, 0.2, 1)
		"cindlet":
			return Color(0.8, 0.2, 0.2, 1)
		_:
			return Color(0.5, 0.5, 0.5, 1)

func _get_random_position() -> Vector2:
	var meadow_area = Rect2(200, 200, 800, 500)
	return Vector2(
		randi(int(meadow_area.position.x), int(meadow_area.position.x + meadow_area.size.x)),
		randi(int(meadow_area.position.y), int(meadow_area.position.y + meadow_area.size.y))
	)

func _add_interaction(sprite: ColorRect, creature: CreatureInstance):
	sprite.mouse_filter = Control.MOUSE_FILTER_STOP
	# For MVP, use input event
	sprite.z_index = 10

func _input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.pressed:
			_check_creature_click(event.position)

func _check_creature_click(pos: Vector2):
	for creature_id in creature_sprites:
		var sprite = creature_sprites[creature_id]
		var sprite_rect = Rect2(sprite.position - sprite.size / 2, sprite.size)
		if sprite_rect.has_point(pos):
			_show_creature_info(creature_id)
			return

func _show_creature_info(creature_id: String):
	var sanctuary_creatures = SanctuaryManager.get_sanctuary()
	for creature in sanctuary_creatures:
		if creature.creature_id == creature_id:
			print("Sanctuary: Viewing ", creature.species_id)
			print("  Level: ", creature.level)
			print("  Relationship: ", creature.relationship, "(", creature.get_relationship_stage(), ")")
			# Add relationship when viewing
			creature.add_relationship(5)
			print("  Relationship +5 (viewing)")
			# Transfer to party if party has space
			if PartyManager.party.size() < PartyManager.MAX_PARTY_SIZE:
				SanctuaryManager.transfer_from_party(creature)
				print("  Transferred to party!")
			break
