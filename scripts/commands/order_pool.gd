extends Node

signal popped(dialogue_data: DialogueData)
signal exhausted

@export var orders_in: Array[DialogueData]

var orders: Array[DialogueData]

func _ready():
	orders = orders_in

func _insert_order(order: DialogueData):
	orders.push_back(order)

func _get_order():
	return orders.pop_front()

func _on_shop_ready_state():
	var dialogue_data = _get_order()
	if (dialogue_data):
		popped.emit(dialogue_data)
	else:
		exhausted.emit()


func _on_fill_in_reward_dialogue_reward_dialogue_created(reward_dialogue:DialogueData):
	_insert_order(reward_dialogue)
