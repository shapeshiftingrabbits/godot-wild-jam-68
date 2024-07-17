extends CanvasLayer

class_name InventoryView

@export var inventory: Inventory
@export var cell_template: PackedScene
@onready var grid_container = %GridContainer
var list_adapter: ListAdapter

func _ready():
	var models: Array = []
	for key in inventory.loot_dictionary:
		var model = _create_model_for_inventory_slot( key)
		models.push_back(model)
	list_adapter = ListAdapter.new(models, grid_container, cell_template )
	inventory.inventory_updated.connect(_on_inventory_update)


func _create_model_for_inventory_slot(key: String):
	return InventoryCellModel.new(inventory, key)


func _on_inventory_update(key: String, _amount: int):
	var model = _create_model_for_inventory_slot( key)
	list_adapter.update_item(model)

	
func _on_button_pressed():
	hide()
