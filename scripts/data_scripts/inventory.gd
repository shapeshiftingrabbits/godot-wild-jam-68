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


## remove the amount given in parameter from the amont stored in the inventory,
## if the item is in the inventory, and if the substraction will return a positive number or 0.
## returns true if the operation was successful,
## false if not.
func substract_to_inventory_item( name: String, amount: int):
	if (!loot_dictionary.has(name)):
		return false
	var resource_number = loot_dictionary[name]
	var updated_amount =  resource_number - amount
	if (updated_amount < 0):
		return false
	update_inventory_item(name, updated_amount )
	return true


func get_amount_for_item( name: String):
	return loot_dictionary.get(name)
