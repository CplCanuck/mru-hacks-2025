extends Control


@onready var text_box: RichTextLabel = $VBoxContainer/Text


func _ready():
	# TODO : forget how to connect to signals
	for signpost : Signpost in get_tree().get_nodes_in_group("Signposts"):
		signpost.connect("change_dialogue_box", change_text)
		signpost.connect("close_dialogue_box", close)
	pass
	 

func change_text(text:String) :
	visible = true
	text_box.text = text
	return

func close():
	visible = false
