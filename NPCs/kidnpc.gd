extends CharacterBody2D
class_name TP_NPC

enum levels {
	NONE,
	INTRO,
	HUB,
	ONE,
	TWO
}

var setup = true

func _process(_delta):
	if (get_tree().get_nodes_in_group("enemies")).is_empty():
		switch_state("Safe")
	pass

@export var level : levels = levels.HUB
@onready var signpost_component: Signpost = $SignpostComponent

func switch_state(state):
	match state:
		"Scared":
			$AnimatedSprite2D.play("hurt")
			$SignpostComponent.process_mode = Node.PROCESS_MODE_DISABLED
			pass
		"Safe":
			$AnimatedSprite2D.play("idle")
			$SignpostComponent.process_mode = Node.PROCESS_MODE_INHERIT
			text = text
			signpost_component.centered = true
			pass

@export_multiline var text : String = "":
	set(val) :
		text = val
		if signpost_component :
			signpost_component.text = val

func _on_player_detector_body_entered(body):
	if body is Player and setup:
		switch_state("Scared")
		setup = false
