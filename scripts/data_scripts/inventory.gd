extends Resource

class_name Inventory

signal inventory_updated(name: String, amount: int)

@export var loot_dictionary: Dictionary = {}

func update_inventory_item( name: String, amount: int):
	loot_dictionary[name] = amount
	inventory_updated.emit(name, amount)


func add_to_inventory_item ( name: String, amount: int):
	if (!loot_dictionary.has(name)):
		loot_dictionary[name] = 0
	var resource_number = loot_dictionary[name]
	update_inventory_item(name, resource_number + amount )

func get_amount_for_item( name: String):
	return loot_dictionary.get(name)
