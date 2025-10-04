extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DASH_LENGTH = 100

var attacking := false
var dashing := false

func _physics_process(_delta: float) -> void:
    # Get the input direction and handle the movement/deceleration.
    # As good practice, you should replace UI actions with custom gameplay actions.
    var direction := Input.get_vector("left", "right", "up", "down").normalized()
    if direction:
        velocity = direction * SPEED

		# move interaction range node
		match direction : 
			Vector2.LEFT:
				interaction_range.rotation_degrees = 90
			Vector2.RIGHT:
				interaction_range.rotation_degrees = 270
			Vector2.UP:
				interaction_range.rotation_degrees = 180
			Vector2.DOWN:
				interaction_range.rotation_degrees = 0
    else:
        # Slow down player if not moving
        velocity.x = move_toward(velocity.x, 0, SPEED)
        velocity.y = move_toward(velocity.y, 0, SPEED)
        
    # Attacking
    if Input.is_action_pressed("attack"): # Change to is_action_just_pressed for implimented attack
        attacking = true
    else:
        attacking = false
        
    # Dash
    if Input.is_action_just_pressed("dash"):
        pass
@onready var interaction_range: Area2D = $InteractionRange
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_select'):
		for object in interaction_range.get_overlapping_areas():
			if object.has_method("interact"):
				object.interact()
		
