extends CanvasLayer

class_name InventoryView

@export var inventory: Inventory
@export var cell_template: PackedScene
@onready var grid_container = %GridContainer

func _ready():
	show_inventory()

func show_inventory():
	var loots = inventory.loot_dictionary
	for loot in loots:
		var cell: InventoryCell = cell_template.instantiate()
		cell.set_values( loot, loots[loot])
		grid_container.add_child(cell)


func disable():
	hide()


func _on_button_pressed():
	hide()

