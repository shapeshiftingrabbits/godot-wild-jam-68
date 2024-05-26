extends Node

@onready var reputation_label = %ReputationLabel

func _on_update_player_state_reputation_changed(reputation):
	reputation_label.text = "Reputation: " + str(reputation)
