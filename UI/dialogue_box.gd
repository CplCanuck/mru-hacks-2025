extends Control


@onready var text_box: RichTextLabel = $VBoxContainer/PanelContainer/Text
@onready var timer: Timer = $Timer


func _ready():
	# TODO : forget how to connect to signals
	for signpost : Signpost in get_tree().get_nodes_in_group("Signposts"):
		signpost.change_dialogue_box.connect(change_text)
#		signpost.close_dialogue_box.connect(close)
	pass
	 

func change_text(text:String, time:int) :
	# hides on double interact
	# also stops empty signs from showing anything.
	if text == text_box.text :
		visible = false
		text_box.text = ""
	else :
		visible = true
		text_box.text = text
		timer.start(time)

func close():
	visible = false


func _on_timer_timeout() -> void:
	# bad practice
	visible = false
	text_box.text = ""
	
	pass # Replace with function body.
