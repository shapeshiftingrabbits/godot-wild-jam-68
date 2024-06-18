extends VBoxContainer

class_name InventoryCell

@onready var name_label: Label = $Name
@onready var inventory_item_icon = %InventoryItemIcon
@onready var amount = %Amount

## Used to assign the values to the cell after instanciating the packed scene
func set_values(in_name: String, in_amount: int, in_icon = null):
	await self.ready
	print("set_values : ", in_name)
	name_label.text = in_name
	update_amount(in_amount)


func update_amount(in_amount: int):
	amount.text = str(in_amount)
