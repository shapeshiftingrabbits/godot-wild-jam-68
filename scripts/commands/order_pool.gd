extends Node

class_name OrderPool

@export var orders_in: Array[DialogueData]

var orders: Array[DialogueData]

func _ready():
	orders = orders_in


func insert_order(order: DialogueData):
	orders.push_back(order)


func get_order():
	return orders.pop_front()

