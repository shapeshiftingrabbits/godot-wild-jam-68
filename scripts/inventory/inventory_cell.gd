extends VBoxContainer

class_name InventoryCell

@onready var texture_rect = $TextureRect
@onready var name_label: Label = $Name


func set_values(in_name: String, in_icon = null):
	await self.ready
	print("set_values : ", in_name)
	name_label.text = in_name
	
