extends Area2D
class_name Signpost

@export var text:String  = ""

signal change_dialogue_box(text)

var curr_showing : bool = false

func interact():
	change_dialogue_box.emit(text)
