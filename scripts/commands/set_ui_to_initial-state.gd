extends Node

@onready var forge = %Forge
@onready var outgoing_order = %OutgoingOrder

func _on_run_dialogue_state_entered():
	forge.hide()
	outgoing_order.hide()
