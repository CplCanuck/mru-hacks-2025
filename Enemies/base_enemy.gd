extends CharacterBody2D
class_name Enemy


@export var move_speed : int

## Position of the parent, won't move far from this.
# put here to have most of the controll here rather than at the post with a ton of signals or calls
var post_position : Vector2
## The max distance the enemy is allowed to go to
@export var max_range : int = 100

## The length of the chain. 
## Should be longer than enemy_max_range so it always droops a bit.
@export var chain_length : int = 120

var player_node : Node2D
var chase_position : Vector2 = global_position

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var hurtbox_component: Hurtbox = $HurtboxComponent

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# TODO unsure how to manage behaviour.
# maybe should have things defined in resources ?? idk

# for a simple state machine
enum {
	IDLE,
	CHASE
}

var state := IDLE

func _ready():
	hurtbox_component.take_knockback.connect(take_knockback)

func _process(delta: float) -> void:
	match state :
		IDLE :
			idle_action()
		CHASE :
			chase_action(delta)

func idle_action():
	pass
	
func chase_action(delta):
	
	chase_position = player_node.global_position
	nav_agent.target_position = chase_position
	velocity *= 0.7
	velocity += global_position.direction_to(nav_agent.get_next_path_position()) * move_speed * delta
	nav_agent.get_next_path_position()
	
	if velocity.x < 0 :
		animated_sprite_2d.scale.x = abs(animated_sprite_2d.scale.x) * -1
	elif velocity.x > 0 :
		animated_sprite_2d.scale.x = abs(animated_sprite_2d.scale.x)
	
	move_and_slide()
	
	pass

func take_knockback(direction : Vector2, force : int) :
	velocity += direction * force * 500

func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		player_node = body
		state = CHASE
	pass # Replace with function body.
