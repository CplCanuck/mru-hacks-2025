extends Node2D

"""
The base point to which enemies are attached to.
Should be the parent.
"""


# TODO make this a chain, currently just a line.

## The max distance the enemy is allowed to go to
@export var enemy_max_range : int = 100

## The length of the chain. 
## Should be longer than enemy_max_range so it always droops a bit.
@export var chain_length : int = 120

func _ready() -> void:
	for child in get_children():
		if child is Enemy :
			$PinJoint2D10.set_node_b(child.get_path())
			pass
			#child.post_position = global_position
	pass 
	
	
func _physics_process(delta: float) -> void:
	for child in get_children():
		if child is Enemy :
			# NOTE maybe move this to the enemy??
			if Vector2.ZERO.distance_to(child.position) > enemy_max_range :
				child.position = child.position.normalized() * enemy_max_range
				
			pass
	pass
