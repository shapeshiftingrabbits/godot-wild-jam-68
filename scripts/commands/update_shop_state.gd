extends Node2D

signal ready_for_next_order

# Called when the node enters the scene tree for the first time.
func _ready():
	update_shop_state()
	

func update_shop_state():
	$OutgoingOrder.hide()
	$Forge.disable()
	ready_for_next_order.emit()


func _on_forge_forged():
	$OutgoingOrder.show()


func _on_outgoing_order_turned_in():
	update_shop_state()


func _on_run_dialogue_ended():
	update_shop_state()


func _on_track_big_project_completion_big_project_updated():
	update_shop_state()

