extends Control

## Encounter UI
## Displays when player encounters a wild creature

signal encounter_started(creature_data: Dictionary)
signal encounter_ended
signal taming_attempted
signal taming_success(creature_id: String)
signal taming_failed

@onready var creature_name = $Panel/CreatureName
@onready var taming_method = $Panel/TamingMethod
@onready var instruction = $Panel/Instruction
@onready var cancel_button = $Panel/CancelButton

var current_creature: Dictionary = {}
var is_active: bool = false

func _ready():
	visible = false
	cancel_button.pressed.connect(_on_cancel_pressed)

func start_encounter(creature_data: Dictionary) -> void:
	current_creature = creature_data
	creature_name.text = creature_data.name
	taming_method.text = "Taming Method: " + creature_data.taming_method.type.capitalize()
	is_active = true
	visible = true
	emit_signal("encounter_started", creature_data)

func _input(event: InputEvent) -> void:
	if not is_active:
		return

	if event.is_action_pressed("interact"):
		attempt_taming()

func attempt_taming() -> void:
	emit_signal("taming_attempted")
	# Simple trust-based taming for now
	# In full implementation, this would check species-specific requirements
	var success = randi() % 2 == 0  # 50% chance for testing
	if success:
		show_success()
	else:
		instruction.text = "Taming Failed - Try Again!"

func _on_cancel_pressed():
	end_encounter()
	emit_signal("taming_failed")

func end_encounter() -> void:
	is_active = false
	visible = false
	emit_signal("encounter_ended")

func show_success() -> void:
	instruction.text = "Taming Successful!"
	cancel_button.text = "Continue"
	cancel_button.pressed.disconnect(_on_cancel_pressed)
	cancel_button.pressed.connect(_on_continue_pressed)

func _on_continue_pressed():
	emit_signal("taming_success", current_creature.species_id)
	end_encounter()
