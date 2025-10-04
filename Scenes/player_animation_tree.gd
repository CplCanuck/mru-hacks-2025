extends Node2D

@export var animation_tree: AnimationTree
@onready var player : CharacterBody2D = get_owner()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
    
    var idle = !player.velocity
    
    animation_tree.set("parameters/conditions/idle", idle)
    animation_tree.set("parameters/conditions/run", !idle)
    
    animation_tree.set("parameters/Idle/blend_position", player.velocity.normalized())
    animation_tree.set("parameters/Run/blend_position", player.velocity.normalized())
