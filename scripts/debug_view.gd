extends CanvasLayer


@export var inventory: Inventory
@export var cell_template: PackedScene
@onready var debug_inventory_list = %DebugInventoryList
var list_adapter: ListAdapter


func _ready():
	list_adapter = ListAdapter.new(inventory.loot_dictionary, debug_inventory_list, cell_template, _bind_model )
	inventory.inventory_updated.connect(list_adapter.update_item)
	

func _bind_model(cell: Container, model_key: String , model: int):
	cell.set_values( model_key, model)
	cell.inventory_item_changed.disconnect(_on_inventory_item_updated)
	cell.inventory_item_changed.connect(_on_inventory_item_updated)


func _on_inventory_item_updated(in_name: String, in_amount: int):
	inventory.update_inventory_item(in_name, in_amount)
	
