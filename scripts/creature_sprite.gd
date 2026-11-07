extends Area2D

## Wild creature sprite
## Can be encountered and tamed

signal encounter_started(creature_data: Dictionary)

@onready var trigger_area = $TriggerArea

var species_id: String = "mosskit"
var is_encountered: bool = false

func _ready():
	trigger_area.body_entered.connect(_on_body_entered)
	trigger_area.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D):
	if body.is_in_group("player") and not is_encountered:
		var creature_data = DataManager.get_creature(species_id)
		if not creature_data.is_empty():
			emit_signal("encounter_started", creature_data)

func _on_body_exited(body: Node2D):
	pass
