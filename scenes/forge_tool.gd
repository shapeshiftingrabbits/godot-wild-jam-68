extends Node2D
signal used

func _on_button_pressed():
	used.emit()
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.play()
