extends Node2D

@onready var level_1_grave: Sprite2D = $Background/Graves/Level1Grave/Grave
@onready var level_1_gravestone: Gravestone = $Background/Graves/Level1Grave/Gravestone

@onready var level_2_broken: Sprite2D = $Background/Graves/Level2Grave/Broken
@onready var level_2_gravestone: Gravestone = $Background/Graves/Level2Grave/Gravestone


# Called when the node enters the scene tree for the first time.
func _ready():
    if GameManager.Graves_saved == 0:
        # Disable level 2 grave processing
        level_2_gravestone.get_child(0).monitorable = false
        
    elif GameManager.Graves_saved == 1:
        # Disable level 1 grave
        level_1_grave.visible = true
        level_1_gravestone.visible = false
        level_1_gravestone.get_child(0).monitorable = false
        
        # Enable level 2 grave
        level_2_broken.visible = false
        level_2_gravestone.visible = true
        level_2_gravestone.get_child(0).monitorable = true
