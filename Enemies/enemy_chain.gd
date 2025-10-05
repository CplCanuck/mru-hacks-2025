extends Node2D

"""
The base point to which enemies are attached to.
Should be the parent.
"""


# TODO make this a chain, currently just a line.

## The max distance the enemy is allowed to go to
@export var enemy_max_range : int = 100

## The length of the chain. 
## Should be longer than enemy_max_range so it always droops a bit.
@export var chain_length : int = 120
@export var enemy: Enemy
var hurt_box: Hurtbox
var can_be_destroyed = false

@onready var chain_enemy_connection: Area2D = $ChainEnemyConnection

enum items {
	LOCKET,
	DOLL,
	WOODEN_HORSE,
	NECKLACE
}

var items_dict = {
	items.LOCKET : "locket" ,#.instantiate(),
	items.DOLL : "doll" ,#.instantiate(),
	items.WOODEN_HORSE : "wooden horse",#.instantiate(),
	items.NECKLACE : "necklace" #.instantiate(),
}

@export var item : items = items.LOCKET
@onready var signpost_component: Signpost = $Twinkle/SignpostComponent


func _ready() -> void:
	$chain/PinJoint2D10.set_node_b(enemy.get_path())
	hurt_box = enemy.get_node("HurtboxComponent")
	hurt_box.connect("health_depleted",health_depleted)
	
	# triggers set
	signpost_component.text = "\nYou find a + " \
		+  items_dict[item] \
		+  "on the ground. \n" \
		+  "It was very to them to have it tie their ghost down."
	signpost_component.centered = true
	
func health_depleted():
    $chain.set_modulate(Color(255,0,0,0.5))
    can_be_destroyed = true
    pass

func destroyed():
	enemy.queue_free()
	$chain.queue_free()
	$ChainEnemyConnection.queue_free()
	signpost_component.monitorable = true
	signpost_component.monitoring = true
	
func _physics_process(delta: float) -> void:
	if enemy:
		if Vector2.ZERO.distance_to(enemy.position) > enemy_max_range :
			enemy.position = enemy.position.normalized() * enemy_max_range
	
		chain_enemy_connection.get_child(0).shape.b = enemy.position
	
	
