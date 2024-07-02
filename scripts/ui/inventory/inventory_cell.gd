extends ListCellView

class_name InventoryCell

@onready var name_label: Label = $Name
@onready var inventory_item_icon = %InventoryItemIcon
@onready var amount_label = %Amount


## Used to assign the values to the cell after instanciating the packed scene
func bind( in_model: CellModel):
	super(in_model)
	_update_layout()
	model.updated.disconnect(_update_layout)
	model.updated.connect(_update_layout)


func _update_layout():
	name_label.text = model.item_key
	update_amount(model.amount)


func update_amount(in_amount: int):
	amount_label.text = str(in_amount)
