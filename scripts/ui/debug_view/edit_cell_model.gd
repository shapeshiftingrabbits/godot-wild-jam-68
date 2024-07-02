extends InventoryCellModel

class_name EditCellModel

func _on_inventory_item_updated( model_key: String , amount: int):
	inventory.update_inventory_item(model_key, amount)
