extends Node

signal reputation_changed(reputation: int)

@export var player_state: PlayerState

func _on_outgoing_order_turned_in(reputation_gain):
	player_state.reputation += reputation_gain
	reputation_changed.emit(player_state.reputation)
	
