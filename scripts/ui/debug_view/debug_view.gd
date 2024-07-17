extends CanvasLayer


@export var inventory: Inventory
@export var cell_template: PackedScene
@onready var debug_inventory_list = %DebugInventoryList
var list_adapter: ListAdapter


func _ready():
	var models: Array = []
	for key in inventory.loot_dictionary:
		var model = _create_model_for_inventory_slot( key)
		models.push_back(model)
	list_adapter = ListAdapter.new(models, debug_inventory_list, cell_template )
	inventory.inventory_updated.connect(_on_inventory_update)


func _on_inventory_update(key: String, amount: int):
	var model = _create_model_for_inventory_slot( key)
	list_adapter.update_item(model)


func _create_model_for_inventory_slot(key: String):
	return EditCellModel.new(inventory, key)
