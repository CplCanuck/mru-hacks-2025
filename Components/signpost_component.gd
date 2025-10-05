extends Area2D
class_name Signpost

@export var text:String  = ""
@export var time:int = 5
@export var centered:bool = false

var dialogue_box : Control

signal change_dialogue_box(text, time)
signal clear_text(text)

var curr_showing : bool = false

func interact():
    
    if get_parent() is Gravestone :
        if dialogue_box and dialogue_box.text == text:
            GameManager.change_level(get_parent().level)
    #change_dialogue_box.emit(text, time, centered)
    if get_parent() is TP_NPC:
        if dialogue_box and dialogue_box.text == text:
            GameManager.change_level(get_parent().level)
    change_dialogue_box.emit(text, time, centered)
    


## Clears text when the player leaves the nearby area
func _on_ignore_range_body_exited(body: Node2D) -> void:
    if body is Player:
        clear_text.emit(text)
