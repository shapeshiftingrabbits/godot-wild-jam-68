extends Node2D

signal order_turned_in
signal ready_state

var reputation: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	update_shop_state()
	

func update_shop_state():
	$OutgoingOrder.hide()
	$Forge.disable()
	$ReputationLabel.text = "Reputation: " + str(reputation)
	ready_state.emit()


func _on_forge_forged():
	$OutgoingOrder.show()


func _on_outgoing_order_turned_in(reputation_gain):
	reputation += reputation_gain
	update_shop_state()


func _on_run_dialogue_ended():
	update_shop_state()


func _on_track_big_project_completion_big_project_updated():
	update_shop_state()

