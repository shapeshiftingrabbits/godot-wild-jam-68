extends Resource

class_name Challenge

@export var strength: int
@export var loot_item: LootItem
@export var amount: int

func get_loot_description():
	return "%d %s" % [ amount, loot_item.name]
