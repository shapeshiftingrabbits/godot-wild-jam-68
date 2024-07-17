extends Node

@onready var big_project_presenting_view: BigProjectPresentingView = %BigProjectPresentingView
@export var player_state: PlayerState
@onready var dialogue_box = %DialogueBox
@onready var state_chart: StateChart = %StateChart

var big_project_ledger: BigProjectLedger = null


func _on_present_big_project_state_entered():
	var dialogue = dialogue_box.dialogue_data
	big_project_ledger = BigProjectLedger.new()
	big_project_ledger.init_from_dialogue(dialogue)
	big_project_presenting_view.present(big_project_ledger, player_state.inventory)


func _on_big_project_presenting_view_big_project_accepted():
	player_state.track_big_project_ledger( big_project_ledger)
	state_chart.send_event("big_project_accepted")
