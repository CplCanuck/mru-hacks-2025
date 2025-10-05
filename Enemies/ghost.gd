extends Node2D

@onready var enemy_chain: Node2D = $EnemyChain

enum items {
	LOCKET,
	DOLL,
	WOODEN_HORSE,
	NECKLACE
}

@export var item : items = items.LOCKET : 
	set(val):
		item = val
		update_text()

func _ready() :
	update_text()
	
func update_text() :
	if get_tree():
		enemy_chain.item = item
