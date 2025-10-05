extends Area2D
class_name Signpost

@export var text:String  = ""
var dialogue_box : Control

signal change_dialogue_box(text)

var curr_showing : bool = false

func interact():
	
	if get_parent() is Gravestone :
		if dialogue_box and dialogue_box.text == text:
			GameManager.change_level(get_parent().level)
	change_dialogue_box.emit(text)
