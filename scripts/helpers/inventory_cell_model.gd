extends CellModel

class_name InventoryCellModel

var inventory: Inventory
var item_key: String

var amount: int:
	get:
		return inventory.get_amount_for_item(item_key)

func _init(in_inventory: Inventory, in_item_key: String):
	inventory = in_inventory
	item_key = in_item_key
	inventory.inventory_updated.connect(_on_inventory_updated)


func _on_inventory_updated(in_item_key: String , amount: int):
	if (in_item_key == item_key):
		updated.emit()
