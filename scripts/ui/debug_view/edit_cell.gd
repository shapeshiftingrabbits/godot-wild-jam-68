extends ListCellView

class_name EditCell

signal inventory_item_changed( name:String, amount:int)

@onready var amount_line_edit = %AmountLineEdit
@onready var name_label = %NameLabel

var model: EditCellModel:
	get:
		return _model as EditCellModel

func update_amount(in_amount: int):
	amount_line_edit.text = str(in_amount)


func _on_amount_line_edit_text_submitted(new_text):
	inventory_item_changed.emit(name_label.text, new_text.to_int())


## Used to assign the values to the cell after instanciating the packed scene
func bind( in_model: CellModel):
	super.bind(in_model)
	await self.ready
	_update_layout()
	inventory_item_changed.disconnect(model._on_inventory_item_updated)
	inventory_item_changed.connect(model._on_inventory_item_updated)
	model.updated.disconnect(_update_layout)
	model.updated.connect(_update_layout)
	

func _update_layout():
	name_label.text = model.item_key
	update_amount(model.amount)
