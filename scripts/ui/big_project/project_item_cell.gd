extends ListCellView

class_name ProjectItemCell

@onready var ship_button = %ShipButton
@onready var shipping_layout = %ShippingLayout
@onready var shipped_layout = %ShippedLayout

@onready var title_label = %TitleLabel
@onready var available_label = %AvailableLabel
@onready var required_label = %RequiredLabel

var model: ProjectItemModel:
	get:
		return _model as ProjectItemModel


## Used to assign the values to the cell after instanciating the packed scene
func bind(model: CellModel):
	super(model)
	await self.ready
	model.updated.disconnect(_update_layout)
	model.updated.connect(_update_layout)
	_update_layout()


func _update_layout():
	title_label.text = model.item_name_description
	var required_format_string = "Required: %s."
	required_label.text = required_format_string % str(model.expected_amount)
	var available_format_string = "Available: %s."
	available_label.text = available_format_string % str(model.available_amount)
	shipping_layout.visible = !model.is_completed
	shipped_layout.visible = model.is_completed
	ship_button.disabled = !model.is_shippable
	

func _on_ship_button_pressed():
	model.deliver_item()

