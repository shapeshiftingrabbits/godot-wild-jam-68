extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	update_shop_state()
	

func update_shop_state():
	%OutgoingOrder.hide()
	%Forge.disable()


func _on_forge_forged():
	%OutgoingOrder.show()


func _on_present_big_project_ui_confirmed():
	update_shop_state()
