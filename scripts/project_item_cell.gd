extends VBoxContainer

class_name ProjectItemCell

@onready var button = $Button

@onready var title_label = %TitleLabel
@onready var available_label = %AvailableLabel
@onready var required_label = %RequiredLabel

var model: ProjectItemModel


## Used to assign the values to the cell after instanciating the packed scene
func set_model():
	await self.ready
	_update_layout()


func _update_layout():
	title_label.text = model.item_name
	required_label.text = str(model.expected_amount)
	available_label.text = str(model.available_amount)
	button.disabled = model.is_completed


func _on_button_pressed():
	model.deliver_item()
