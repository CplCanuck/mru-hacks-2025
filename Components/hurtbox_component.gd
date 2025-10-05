extends Area2D
class_name Hurtbox

## Also a health component
@export var health : int = 0

signal health_depleted
signal take_knockback(direction, force)
# NOTE : Could have enemies recover from their vulnerable state too, but eh.

func damage(attack : Attack):
	health -= attack.damage
	if health <= 0 :
		health_depleted.emit()
	
	if attack.knockback_dir and attack.knockback :
		take_knockback.emit(attack.knockback_dir, attack.knockback)
