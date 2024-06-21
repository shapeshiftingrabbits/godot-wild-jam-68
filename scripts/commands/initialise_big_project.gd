extends Node



@onready var dialogue_box = %DialogueBox
@export var big_project_ledger: BigProjectLedger

func _initialise():
	var big_projects_dialogue: DialogueData = dialogue_box.dialogue_data
	if ( big_projects_dialogue.variables.has("big_project_id")):
		#print(big_project_id)
		big_project_ledger._initialiase_from_dialogue(big_projects_dialogue)
	else:
		printerr("no big project id found in the dialogue")


#Signals
func _on_present_big_project_state_entered():
	_initialise()

