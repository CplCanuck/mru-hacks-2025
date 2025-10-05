extends Control


@onready var text_box: RichTextLabel = $VBoxContainer/PanelContainer/Text


func _ready():
	# TODO : forget how to connect to signals
	for signpost : Signpost in get_tree().get_nodes_in_group("Signposts"):
		signpost.change_dialogue_box.connect(change_text)
		signpost.dialogue_box = text_box
#		signpost.close_dialogue_box.connect(close)
	pass
	 

func change_text(text:String) :
	# hides on double interact
	# also stops empty signs from showing anything.
	if text == text_box.text :
		visible = false
		text_box.text = ""
	else :
		visible = true
		text_box.text = text

func close():
	visible = false
