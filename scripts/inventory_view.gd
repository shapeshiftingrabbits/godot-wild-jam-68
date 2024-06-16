extends Panel

class_name InventoryView

@export var inventory: Inventory
@onready var grid_container = %GridContainer

func show_inventory():
	for loot in inventory.loot_dictionary:
		pass
	pass

func disable():
	hide()





func _on_button_pressed():
	hide()
	pass # Replace with function body.
