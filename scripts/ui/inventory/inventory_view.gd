extends CanvasLayer

class_name InventoryView

@export var inventory: Inventory
@export var cell_template: PackedScene
@onready var grid_container = %GridContainer
var list_adapter: ListAdapter

func _ready():
	var models: Array = []
	for key in inventory.loot_dictionary:
		var model = InventoryCellModel.new(inventory, key)
		models.push_back(model)
	list_adapter = ListAdapter.new(models, grid_container, cell_template )


func _on_button_pressed():
	hide()

