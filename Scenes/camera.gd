extends Camera2D

@export var follow_percentage_width := 0.333
@export var follow_percentage_height := 0.333

@onready var screen_scale := DisplayServer.screen_get_scale() 
@onready var screen_width = get_viewport().size.x#DisplayServer.screen_get_size().x / screen_scale
@onready var screen_height = get_viewport().size.y#DisplayServer.screen_get_size().y / screen_scale

var speed := 100

@export var player : Player

func _ready() :
	position = player.position

func _physics_process(delta: float) -> void:
	if player :
		var player_pos := player.get_screen_transform().get_origin()
		
		# up
		if player_pos.y < screen_height * follow_percentage_height :
			position.y -= abs(player.velocity.y * delta)
			if player_pos.y < screen_height * (follow_percentage_height / 1.5) :
				position.y += speed * delta
				
		# right
		if player_pos.x > screen_width * (1 - follow_percentage_width) :
			position.x += abs(player.velocity.x * delta)
			if player_pos.x > screen_width * (1 - (follow_percentage_width / 1.5))  :
				position.x += speed * delta
				
		# down
		if player_pos.y > screen_height * (1 - follow_percentage_height)  :
			print('down')
			position.y += abs(player.velocity.y * delta)
			if player_pos.y > screen_height * (1 - (follow_percentage_height / 1.5))  :
				position.y += speed * delta
		
		# left
		if player_pos.x < screen_width * follow_percentage_width :
			position.x -= abs(player.velocity.x * delta)
			if player_pos.x < screen_width * (follow_percentage_width /1.5) :
				position.x -= speed * delta
