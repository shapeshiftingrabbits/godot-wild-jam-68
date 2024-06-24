extends CanvasLayer

class_name InventoryView

@export var inventory: Inventory
@export var cell_template: PackedScene
@onready var grid_container = %GridContainer
var list_adapter: ListAdapter

func _ready():
	hide()
	list_adapter = ListAdapter.new(inventory.loot_dictionary, grid_container, cell_template, _bind_model )
	inventory.inventory_updated.connect(list_adapter.update_item)


func _bind_model(cell: Container, model_key: String , model: int):
	cell.set_values( model_key, model)


func _on_button_pressed():
	hide()

