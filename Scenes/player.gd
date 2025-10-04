extends CharacterBody2D


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

    move_and_slide()
    
    
#func _input(event: InputEvent) -> void:
#    if event.is_action_pressed('ui_select'):
#        for object in interaction_range.get_overlapping_areas():
#            if object.has_method("interact"):
#                object.interact()
        
