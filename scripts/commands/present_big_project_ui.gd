extends Node

@onready var big_project_presenting_view: BigProjectPresentingView = %BigProjectPresentingView
@export var player_state: PlayerState
@onready var dialogue_box = %DialogueBox


func _on_present_big_project_state_entered():
	var dialogue = dialogue_box.dialogue_data
	var ledger = BigProjectLedger.new()
	ledger.init_from_dialogue(dialogue)
	big_project_presenting_view.present(ledger, player_state)
