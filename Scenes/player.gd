extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DASH_LENGTH = 100
const ATTACK_TIME := 0.4

@export var attacking := false
var last_direction := Vector2.RIGHT

var dashing := false
var dash_start_pos := Vector2.ZERO
var dash_cooldown := 2.5
var dash_opacity := 153
@onready var dash_timer: Timer = $DashTimer


@onready var dash_shadow: Sprite2D = $DashShadow


@onready var interaction_range: Area2D = $InteractionRange
@onready var attack_timer : Timer = $AttackTimer

func _physics_process(_delta: float) -> void:
    # Get the input direction and handle the movement/deceleration.
    # As good practice, you should replace UI actions with custom gameplay actions.
    var direction := Input.get_vector("left", "right", "up", "down").normalized()
    if direction:
        last_direction = direction
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
    if Input.is_action_pressed("attack"):
        attacking = true
        attack_timer.start(ATTACK_TIME)
            
    # Dash
    if Input.is_action_just_pressed("dash"):
        pass

    move_and_slide()
    
    # fade
    dash_shadow.modulate.a8 = int(dash_opacity * (dash_timer.time_left / dash_cooldown))

    
func _input(event: InputEvent) -> void:
    if event.is_action_pressed('interact'):
        for object in interaction_range.get_overlapping_areas():
            if object.has_method("interact"):
                object.interact()
    
    if event.is_action_pressed("dash"):
        if dashing :
            # turn off physics
            position = dash_start_pos
        else :
            dash_start_pos = global_position
            dash_shadow.global_position = global_position
            dash_shadow.modulate.a8 = dash_opacity
            dash_timer.start(dash_cooldown)
            
        
        dashing = not dashing
        dash_shadow.visible = dashing

func end_attack() -> void:
    print("end_attack")
    attacking = false


func _on_attack_timer_timeout() -> void:
    end_attack()


func _on_dash_timer_timeout() -> void:
    dashing = false
    dash_shadow.visible = false
    dash_shadow.modulate.a8 = dash_opacity
    pass # Replace with function body.
