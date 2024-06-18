extends HBoxContainer

class_name EditCell

signal inventory_item_changed(name:String,amount:int)

@onready var amount_line_edit = %AmountLineEdit
@onready var name_label = %NameLabel


## Used to assign the values to the cell after instanciating the packed scene
func set_values(in_name: String, in_amount: int):
	await self.ready
	name_label.text = in_name
	update_amount(in_amount)


func update_amount(in_amount: int):
	amount_line_edit.text = str(in_amount)


func _on_amount_line_edit_text_submitted(new_text):
	inventory_item_changed.emit(name_label.text, new_text.to_int())
