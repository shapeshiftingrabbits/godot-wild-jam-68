extends Node

signal popped(dialogue_data: DialogueData)
signal exhausted

@onready var order_pool: OrderPool = %OrderPool

func _ready():
	print("ready")

func _on_update_shop_state_ready_for_next_order():
	get_next_order() 


func get_next_order():
	var dialogue_data = order_pool.get_order()
	if (dialogue_data):
		popped.emit(dialogue_data)
	else:
		exhausted.emit()
