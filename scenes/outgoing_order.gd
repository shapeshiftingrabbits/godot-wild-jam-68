extends Panel

signal turned_in(reputation_gain)

const REPUTATION_GAIN = 1

func _on_button_pressed():
	turned_in.emit(REPUTATION_GAIN)
