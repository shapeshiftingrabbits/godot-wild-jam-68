extends Panel

class_name InventoryView

@export var inventory: Inventory
@onready var grid_container = %GridContainer
@export var cell_template: PackedScene

func show_inventory():
	for loot in inventory.loot_dictionary:
		var cell = cell_template.instantiate()
		
	pass

func disable():
	hide()





func _on_button_pressed():
	hide()
	pass # Replace with function body.
