extends Node2D

var wait_time =1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var setup = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if wait_time < 0:
		$Path2D/PathFollow2D.progress += 150 * delta
	else:
		wait_time -= 1 *delta
	pass


func _on_fade_to_black_block_body_entered(body):
	print("Something hits box")
	if body is Player and setup:
		$AnimationPlayer.play("change")
		
	pass # Replace with function body.
func next_scene():
	GameManager.change_level(GameManager.levels.HUB)
