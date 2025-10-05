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
	
