extends Panel

signal turned_in

func _on_button_pressed():
	turned_in.emit()
