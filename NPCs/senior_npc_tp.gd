extends TP_NPC


func _process(delta):
	if (get_tree().get_nodes_in_group("enemies")).is_empty():
		switch_state("Safe")
	pass

func switch_state(state):
	match state:
		"Scared":
			$AnimatedSprite2D.play("hurt")
			print("ahh!")
			$SignpostComponent.process_mode = Node.PROCESS_MODE_DISABLED
			pass
		"Safe":
			$AnimatedSprite2D.play("idle")
			$SignpostComponent.process_mode = Node.PROCESS_MODE_INHERIT
			text = text
			signpost_component.centered = true
			pass
		"Mean":
			$AnimatedSprite2D.play("idle")
			$SignpostComponent.process_mode = Node.PROCESS_MODE_INHERIT

func _ready():
	setup = true

func _on_player_detector_body_entered(body):
	print("detexted player")
	if body is Player and setup:
		switch_state("Scared")
		print("switching state")
		setup = false
