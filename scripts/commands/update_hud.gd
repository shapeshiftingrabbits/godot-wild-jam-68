extends Node

@onready var hud: HUD = %HUD

# Signals
func _on_big_project_accepted_state_entered():
	hud.update_layout()
