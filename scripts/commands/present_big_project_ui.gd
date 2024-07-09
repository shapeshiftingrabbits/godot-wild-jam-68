extends Node

@onready var big_project_presenting_view: BigProjectPresentingView = %BigProjectPresentingView
@export var player_state: PlayerState
@onready var dialogue_box = %DialogueBox
@onready var state_chart: StateChart = %StateChart


func _on_present_big_project_state_entered():
	var dialogue = dialogue_box.dialogue_data
	var ledger = BigProjectLedger.new()
	ledger.init_from_dialogue(dialogue)
	big_project_presenting_view.present(ledger, player_state)


func _on_big_project_presenting_view_big_project_accepted():
	state_chart.send_event("big_project_accepted")
