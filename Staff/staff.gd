extends Node2D

@export var speed := 8000
@export var cooldown := 1
@onready var timer: Timer = $Timer
var can_hit = true


func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		attack()

func attack():
	if timer.time_left <= 0 :
		var direction = get_parent().last_direction #($TimePiece.global_position - $rangearea.get_overlapping_areas()[0].global_position).normalized()
		#$TimePiece.linear_velocity += direction *200
		$TimePiece.apply_central_impulse(Vector2.ONE * speed * direction)
		timer.start(cooldown)
		 
	
func hang_chain():
	$PinJointHOOK.set_node_b("chainlink6")
	$chainlink6.position = $PinJointHOOK.position
func release_chain():
	$PinJointHOOK.set_node_b(null)


func _on_hitbox_area_entered(area):
	print("Enemy hit!")
	if area is Hurtbox and can_hit:
		var attack = Attack.new()
		attack.damage = 4
		attack.knockback = 4
		area.damage(attack)
		can_hit = false
		$TimePiece/hitbox/canhittimer.start()
	pass # Replace with function body.


func _on_canhittimer_timeout():
	can_hit = true
