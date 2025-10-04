extends Area2D
class_name Signpost

@export var text:String  = ""

signal change_dialogue_box(text)
signal close_dialogue_box


var curr_showing : bool = false

func interact():
	if curr_showing :
		change_dialogue_box.emit()
	else :
		close_dialogue_box.emit()
		
	curr_showing = not curr_showing
	
