extends VBoxContainer

class_name InventoryCell

@onready var texture_rect = $TextureRect
@onready var name_label: Label = $Name


func _init(in_name: String, in_icon):
	name_label.text = in_name
	
