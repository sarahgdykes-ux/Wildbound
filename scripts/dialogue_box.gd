extends Control

## Dialogue Box UI
## Displays dialogue with typing effect and continues on input

signal dialogue_finished

@onready var speaker_label: Label = $Panel/SpeakerLabel
@onready var dialogue_label: RichTextLabel = $Panel/DialogueLabel
@onready var continue_label: Label = $Panel/ContinueLabel

var dialogue_lines: Array = []
var current_line: int = 0
var is_typing: bool = false
var typing_speed: float = 0.02
var can_continue: bool = false

func _ready() -> void:
	visible = false
	continue_label.visible = false

func _input(event: InputEvent) -> void:
	if not visible:
		return

	if event.is_action_pressed("interact") or event.is_action_pressed("move_down"):
		if is_typing:
			# Skip typing animation
			_finish_typing()
		elif can_continue:
			# Continue to next line
			advance_dialogue()

## Start a new dialogue
func start_dialogue(speaker: String, lines: Array) -> void:
	dialogue_lines = lines
	current_line = 0
	speaker_label.text = speaker
	visible = true
	can_continue = false
	continue_label.visible = false
	_type_line(dialogue_lines[current_line])

## Type out the current line with animation
func _type_line(text: String) -> void:
	is_typing = true
	dialogue_label.text = ""
	for i in range(text.length()):
		dialogue_label.text += text[i]
		await get_tree().create_timer(typing_speed).timeout
	_finish_typing()

## Finish typing animation immediately
func _finish_typing() -> void:
	is_typing = false
	dialogue_label.text = dialogue_lines[current_line]
	can_continue = true
	continue_label.visible = true

## Advance to the next dialogue line
func advance_dialogue() -> void:
	current_line += 1
	if current_line < dialogue_lines.size():
		can_continue = false
		continue_label.visible = false
		_type_line(dialogue_lines[current_line])
	else:
		# Dialogue finished
		visible = false
		emit_signal("dialogue_finished")
