extends CanvasLayer

signal inventory_pressed


func _on_inventory_button_pressed():
	inventory_pressed.emit()
