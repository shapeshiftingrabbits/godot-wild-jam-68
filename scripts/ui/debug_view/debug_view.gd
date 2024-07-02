extends CanvasLayer


@export var inventory: Inventory
@export var cell_template: PackedScene
@onready var debug_inventory_list = %DebugInventoryList
var list_adapter: ListAdapter


func _ready():
	var models: Array = []
	for key in inventory.loot_dictionary:
		var model = EditCellModel.new(inventory, key)
		models.push_back(model)
	list_adapter = ListAdapter.new(models, debug_inventory_list, cell_template )
