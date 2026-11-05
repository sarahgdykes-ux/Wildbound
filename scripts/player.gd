extends CharacterBody2D

## Player character controller
## Handles movement and basic player actions

const SPEED = 200.0

## Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	# Get the input direction
	var direction := Vector2.ZERO

	# Horizontal movement
	if Input.is_action_pressed("move_left"):
		direction.x -= 1.0
	if Input.is_action_pressed("move_right"):
		direction.x += 1.0

	# Vertical movement
	if Input.is_action_pressed("move_up"):
		direction.y -= 1.0
	if Input.is_action_pressed("move_down"):
		direction.y += 1.0

	# Normalize diagonal movement
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Set velocity
	velocity = direction * SPEED

	# Move the character
	move_and_slide()
