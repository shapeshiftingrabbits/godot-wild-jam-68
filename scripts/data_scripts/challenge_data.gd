extends Resource

class_name Challenge

@export var strength: int
@export var loot: Loot
@export var amount: int

func get_loot_description():
	return "%d %s" % [ amount, loot.name]
