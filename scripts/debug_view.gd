extends CanvasLayer


@export var inventory: Inventory
@export var cell_template: PackedScene
@onready var debug_inventory_list = %DebugInventoryList

const LOOT_KEY = "loot"

func _ready():
	inventory.inventory_updated.connect(_update_item)
	fill_grid()
	

func fill_grid():
	var loots = inventory.loot_dictionary
	for loot in loots:
		var cell: EditCell = cell_template.instantiate()
		cell.set_values( loot, loots[loot])
		cell.set_meta(LOOT_KEY, loot)
		debug_inventory_list.add_child(cell)
		debug_inventory_list.set_meta(loot, cell)
		cell.inventory_item_changed.connect(_on_inventory_item_updated)


func update_grid():
	var cells = debug_inventory_list.get_children()
	for cell in cells:
		var cell_loot = cell.get_meta(LOOT_KEY)
		if (inventory.loot_dictionary.has(cell_loot)):
			var inventory_entry = inventory.loot_dictionary.get(cell_loot)
			cell.update_amount(inventory_entry)


func _on_inventory_item_updated(in_name: String, in_amount: int):
	inventory.update_inventory_item(in_name, in_amount)
	

func _update_item(in_name: String, in_amount: int):
	var cell = debug_inventory_list.get_meta(in_name)
	cell.update_amount(in_amount)
