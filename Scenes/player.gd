extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var interaction_range: Area2D = $InteractionRange


func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = direction * SPEED
	else:
		# Slow down player if not moving
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_select'):
		for object in interaction_range.get_overlapping_areas():
			if object.has_method("interact"):
				object.interact()
		
