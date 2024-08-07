extends Resource

class_name LedgerItem

signal completed

@export var loot_item: LootItem
@export var expected_amount: int = 0

var current_amount: int = 0:
	set(in_amount):
		current_amount = in_amount
		if (is_completed):
			completed.emit()

var is_completed:bool:
	get:
		return current_amount == expected_amount

func _init(in_loot_item: LootItem, in_expected_amount : int = 0):
	loot_item = in_loot_item
	expected_amount = in_expected_amount

