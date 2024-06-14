extends Resource

class_name LedgerItem

@export var loot_item: LootItem
@export var current_amount: int = 0
@export var expected_amount: int = 0

func _init(p_loot_item: LootItem, p_expected_amount : int = 0):
	loot_item = p_loot_item
	current_amount = 0
	expected_amount = p_expected_amount
