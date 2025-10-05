extends Node2D

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		attack()
func attack():
	if $rangearea.get_overlapping_areas(): # is hurtbox
		var direction = ($TimePiece.global_position - $rangearea.get_overlapping_areas()[0].global_position).normalized()
		#$TimePiece.linear_velocity += direction *200
		$TimePiece.apply_central_impulse(Vector2.ONE * 200 * direction)
		print("TRHOWwwww")
		
	pass
	
func hang_chain():
	$PinJointHOOK.set_node_b("chainlink6")
	$chainlink6.position = $PinJointHOOK.position
func release_chain():
	$PinJointHOOK.set_node_b(null)
