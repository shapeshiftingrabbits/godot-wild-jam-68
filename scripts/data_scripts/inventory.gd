extends Resource

class_name Inventory

signal inventory_updated(name: String, amount: int)

@export var loot_dictionary: Dictionary = {}


func update_inventory_item( name: String, amount: int):
	loot_dictionary[name] = amount
	inventory_updated.emit(name, amount)
