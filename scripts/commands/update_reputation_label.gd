extends Node

@onready var reputation_label = %ReputationLabel
@export var player_state: PlayerState


func _on_turn_in_state_exited():
	var reputation = player_state.reputation
	reputation_label.text = "Reputation: " + str(reputation)
