extends Control

## Evolution Notification UI
## Displays when a creature evolves

@onready var title = $Panel/Title
@onready var message = $Panel/Message
@onready var ok_button = $Panel/OkButton

func _ready():
	visible = false
	ok_button.pressed.connect(_on_ok_pressed)

func show_evolution(species_name: String):
	title.text = species_name + " Evolved!"
	message.text = "Your creature has evolved!"
	visible = true

func _on_ok_pressed():
	visible = false
