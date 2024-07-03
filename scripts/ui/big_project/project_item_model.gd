extends CellModel

class_name ProjectItemModel

var _inventory: Inventory
var _ledger_item: LedgerItem

var item_name: String :
	get:
		return _ledger_item.loot_item.name
		
var expected_amount: int:
	get:
		return _ledger_item.expected_amount

var available_amount: int:
	get:
		return _inventory.get_amount_for_item( item_name)
		
var is_completed: bool:
	get:
		return _ledger_item.completed()


func _init(in_ledger_item: LedgerItem, in_inventory:Inventory):
	_ledger_item = in_ledger_item
	_inventory = in_inventory


func deliver_item():
	_inventory.substract_to_inventory_item( item_name, expected_amount)


