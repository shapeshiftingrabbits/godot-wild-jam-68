extends Node

@onready var dialogue_box = %DialogueBox

@export var big_project_view: BigProjectView

func _initialise():
	var big_projects_dialogue: DialogueData = dialogue_box.dialogue_data
	if ( big_projects_dialogue.variables.has("big_project_id")):
		#print(big_project_id)
		var big_project_ledger = BigProjectLedger.new()
		big_project_ledger._initialiase_from_dialogue(big_projects_dialogue)
		_show_big_project_view(big_project_ledger)
	else:
		printerr("no big project id found in the dialogue")

func _show_big_project_view(big_project_ledger = BigProjectLedger):
	big_project_view.present(big_project_ledger)

#Signals
func _on_present_big_project_state_entered():
	_initialise()

