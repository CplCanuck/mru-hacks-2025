extends Node2D

@export var speed := 8000
@export var cooldown := 1
@onready var timer: Timer = $Timer
var can_hit = true
var knockback_time = 0.5
@onready var knockback_timer: Timer = $KnockbackTimer

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		attack()

func attack():
	if timer.time_left <= 0 :
		var direction = get_parent().last_direction 
		$TimePiece.apply_central_impulse(Vector2.ONE * speed * direction)
		timer.start(cooldown)
		 
		knockback_timer.start(knockback_time)
	
func hang_chain():
	$PinJointHOOK.set_node_b("chainlink6")
	$chainlink6.position = $PinJointHOOK.position
func release_chain():
	$PinJointHOOK.set_node_b(null)


func _on_hitbox_area_entered(area):
	print("Enemy hit!")
	if area is Hurtbox and can_hit:
		var attack_obj = Attack.new()
		attack_obj.damage = 4
		print("timer = " + str(knockback_timer.time_left))
		if knockback_timer.time_left > 0 :
			attack_obj.knockback = 4
			attack_obj.knockback_dir = (area.global_position - global_position).normalized()
		area.damage(attack_obj)
		can_hit = false
		$TimePiece/hitbox/canhittimer.start()
	pass # Replace with function body.


func _on_canhittimer_timeout():
	can_hit = true
