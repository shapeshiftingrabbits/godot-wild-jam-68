extends ListCellView

class_name ProjectItemSimpleCell

@onready var title_label = %TitleLabel
@onready var required_label = %RequiredLabel

var model: ProjectItemModel:
	get:
		return _model as ProjectItemModel


## Used to assign the values to the cell after instanciating the packed scene
func bind(model: CellModel):
	super(model)
	await self.ready
	_update_layout()


func _update_layout():
	title_label.text = model.item_name_description
	var required_format_string = "Required: %s."
	required_label.text = required_format_string % str(model.expected_amount)
