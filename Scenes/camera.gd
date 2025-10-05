extends Camera2D

@export var follow_percentage_width := 0.2
@export var follow_percentage_height := 0.2

@onready var screen_scale := DisplayServer.screen_get_scale() 
@onready var screen_width = get_viewport().size.x#DisplayServer.screen_get_size().x / screen_scale
@onready var screen_height = get_viewport().size.y#DisplayServer.screen_get_size().y / screen_scale


@export var player : Player

func _physics_process(delta: float) -> void:
	if player :
		var player_pos := player.get_screen_transform().get_origin()
		
		# up
		if player_pos.y < screen_height * follow_percentage_height :
			print("camera up")
			position.y += player.velocity.y * delta
			
		# right
		if player_pos.x > screen_width * (1 - follow_percentage_width)  :
			print("camera right")
			position.x += player.velocity.x * delta
		
		# down
		if player_pos.y > screen_height * (1 - follow_percentage_height)  :
			print("camera up")
			position.y += player.velocity.y * delta
		
		# left
		if player_pos.x < screen_width * follow_percentage_width :
			print("camera left")
			position.x += player.velocity.x * delta
