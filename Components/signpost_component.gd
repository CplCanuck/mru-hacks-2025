extends Area2D
class_name Signpost

@export var text:String  = ""

signal change_dialogue_box(text)
#signal close_dialogue_box


var curr_showing : bool = false

func interact():
	change_dialogue_box.emit(text)
	#if curr_showing :
		
	#else :
	#	close_dialogue_box.emit()
		
	#curr_showing = not curr_showing
	
## TODO delete

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") :
		interact()
