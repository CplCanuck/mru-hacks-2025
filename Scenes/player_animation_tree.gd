extends Node2D

@export var animation_tree: AnimationTree
@onready var player : CharacterBody2D = get_owner()

var last_facing_direction := Vector2(0, -1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	
	var idle = !player.velocity
	
	if !idle:
		last_facing_direction = player.velocity.normalized()
	
	animation_tree.set("parameters/Idle/blend_position", last_facing_direction)
	animation_tree.set("parameters/Run/blend_position", last_facing_direction)
	animation_tree.set("parameters/Attack/blend_position", last_facing_direction)
	animation_tree.set("parameters/Dash/blend_position", last_facing_direction)
