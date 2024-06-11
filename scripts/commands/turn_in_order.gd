extends Node

@export var player_state: PlayerState

func _on_turn_in_state_entered():
	%OutgoingOrder.show()


func _on_turn_in_state_exited():
	%OutgoingOrder.hide()
	%Forge.disable()


func _on_outgoing_order_turned_in():
	player_state.increment_reputation()
