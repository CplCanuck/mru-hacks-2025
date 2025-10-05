extends Area2D
class_name Hurtbox

## Also a health component
@export var health : int = 0
@export var take_knockback : bool = true

signal health_depleted
# NOTE : Could have enemies recover from their vulnerable state too, but eh.

func damage(attack : Attack):
	health -= attack.damage
	if health <= 0 :
		health_depleted.emit()
	
	if take_knockback :
		# TODO
		pass
	


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is Player:
		var attack = Attack.new()
		attack.damage = 30
		attack.knockback = 10
		body.take_damage()
	pass 
