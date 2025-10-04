extends StaticBody2D

@onready var signpost_component: Signpost = $SignpostComponent


@export var text : String = "":
	set(val) :
		text = val
		if signpost_component :
			signpost_component.text = val

func _ready():
	# triggers set
	text = text
