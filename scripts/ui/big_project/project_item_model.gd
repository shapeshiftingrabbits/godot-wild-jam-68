extends CellModel

class_name ProjectItemModel

var _inventory: Inventory
var _ledger_item: LedgerItem

var item_name_description: String :
	get:
		return _ledger_item.loot_item.name

var item_key: String :
	get:
		return _ledger_item.loot_item.key

var expected_amount: int:
	get:
		return _ledger_item.expected_amount

var current_amount: int:
	get:
		return _ledger_item.current_amount

var available_amount: int:
	get:
		return _inventory.get_amount_for_item( item_key)
		
var is_completed: bool:
	get:
		return _ledger_item.completed()
		

var is_shippable: bool:
	get:
		return (available_amount + current_amount) > expected_amount


func _init(in_ledger_item: LedgerItem, in_inventory:Inventory):
	_ledger_item = in_ledger_item
	_inventory = in_inventory
	_inventory.inventory_updated.connect(_on_inventory_updated)


func _on_inventory_updated(in_item_key: String , amount: int):
	if (in_item_key == item_key):
		updated.emit()


func deliver_item():
	var success = _inventory.substract_to_inventory_item( item_key, expected_amount)
	if (success):
		_ledger_item.current_amount = expected_amount
		updated.emit()


