extends Area2D
class_name Signpost

@export var text:String  = ""
@export var time:int = 5

signal change_dialogue_box(text)

var curr_showing : bool = false

func interact():
	change_dialogue_box.emit(text, time)
