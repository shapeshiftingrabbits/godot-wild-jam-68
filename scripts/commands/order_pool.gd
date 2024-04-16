extends RefCounted

class_name OrderPool

var orders: Array[DialogueData]

func load_orders(orders_in: Array[DialogueData]):
	orders = orders_in
	pass

func insert_order(order: DialogueData):
	orders.push_back(order)
	pass

func do():
	pass
