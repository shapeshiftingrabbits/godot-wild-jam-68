extends CanvasLayer

class_name InventoryView

@export var inventory: Inventory
@export var cell_template: PackedScene
@onready var grid_container = %GridContainer

const LOOT_KEY = "loot"

func _ready():
	inventory.inventory_updated.connect(_update_item)
	hide()
	fill_grid()

func fill_grid():
	var loots = inventory.loot_dictionary
	for loot in loots:
		var cell: InventoryCell = cell_template.instantiate()
		cell.set_values( loot, loots[loot])
		cell.set_meta(LOOT_KEY, loot)
		grid_container.add_child(cell)
		grid_container.set_meta(loot, cell)


func update_grid():
	var cells = grid_container.get_children()
	for cell in cells:
		var cell_loot = cell.get_meta(LOOT_KEY)
		if (inventory.loot_dictionary.has(cell_loot)):
			var inventory_entry = inventory.loot_dictionary.get(cell_loot)
			cell.update_amount(inventory_entry)


func _update_item(in_name: String, in_amount: int):
	var cell = grid_container.get_meta(in_name)
	cell.update_amount(in_amount)


func _on_button_pressed():
	hide()

