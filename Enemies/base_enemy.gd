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


# TODO unsure how to manage behaviour.
# maybe should have things defined in resources ?? idk

# for a simple state machine
enum {
	IDLE,
	CHASE
}

var state := IDLE

func _process(delta: float) -> void:
	print(state)
	match state :
		IDLE :
			idle_action()
		CHASE :
			chase_action(delta)
	
	if global_position.distance_to(post_position) < max_range :
		
		# would prob be simpler to do this at the parent.
		pass


func idle_action():
	# TODO detect player
	pass
	
func chase_action(delta):
	
	chase_position = player_node.global_position
	nav_agent.target_position = chase_position
	velocity = global_position.direction_to(nav_agent.get_next_path_position()) * move_speed * delta
	nav_agent.get_next_path_position()
	
	move_and_slide()
	
	pass


func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		player_node = body
		state = CHASE
	pass # Replace with function body.
