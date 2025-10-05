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
		setup = false
		print("Player hits box")
		var tween = Tween.new()
		tween.tween_property($CanvasLayer/ColorRect, "modulate", Color(0,0,0,1), 3.0)
		await tween.finished
		var tween2 = Tween.new()
		tween2.tween_property($CanvasLayer/Container/Label, "modulate", Color(1,0,0,1), 3.0)
		await tween2.finished
		GameManager.change_level(GameManager.levels.HUB)
	pass # Replace with function body.
