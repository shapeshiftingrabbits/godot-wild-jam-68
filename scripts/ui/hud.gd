extends CanvasLayer

signal inventory_pressed
signal big_project_pressed


func _on_inventory_button_pressed():
	inventory_pressed.emit()
	


func _on_big_project_button_pressed():
	big_project_pressed.emit()
