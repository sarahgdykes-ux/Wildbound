extends Control

## Creature Encyclopedia UI
## Displays discovered creature information

@onready var close_button = $Panel/CloseButton
@onready var creature_list = $Panel/CreatureList
@onready var creature_name = $DetailsPanel/CreatureName
@onready var element_label = $DetailsPanel/ElementLabel
@onready var role_label = $DetailsPanel/RoleLabel
@onready var stats_label = $DetailsPanel/StatsLabel
@onready var abilities_label = $DetailsPanel/AbilitiesLabel

var discovered_species: Array = []

func _ready():
	visible = false
	close_button.pressed.connect(_on_close_pressed)
	_refresh_creature_list()

func _on_close_pressed():
	visible = false

func open():
	visible = true
	_refresh_creature_list()

func _refresh_creature_list():
	creature_list.clear()
	var creature_ids = DataManager.get_all_creature_ids()
	for id in creature_ids:
		creature_list.add_item(id.capitalize())

func show_creature_details(species_id: String):
	var data = DataManager.get_creature(species_id)
	if data.is_empty():
		return

	creature_name.text = data.name
	element_label.text = "Element: " + ", ".join(data.elements)
	role_label.text = "Role: " + data.role.capitalize()

	var stats = data.base_stats
	var stats_text = "HP %d, Atk %d, Def %d, Mag %d, Res %d, Spd %d" % [
		stats.hp, stats.attack, stats.defense, stats.magic, stats.resistance, stats.speed
	]
	stats_label.text = "Stats: " + stats_text

	abilities_label.text = "Abilities: " + ", ".join(data.abilities)
