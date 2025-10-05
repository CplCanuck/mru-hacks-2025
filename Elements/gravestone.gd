extends StaticBody2D
class_name Gravestone

@onready var signpost_component: Signpost = $SignpostComponent

enum levels {
    NONE,
    INTRO,
    HUB,
    ONE,
    TWO
}

@export var level : levels = levels.NONE

@export_multiline var text : String = "":
    set(val) :
        text = val
        if signpost_component :
            signpost_component.text = val

func _ready():
    # triggers set
    text = text
    signpost_component.centered = true
    
    
