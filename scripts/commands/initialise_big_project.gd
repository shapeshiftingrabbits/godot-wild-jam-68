extends Node

var ledger: Array[LedgerItem]

@onready var dialogue_box = %DialogueBox

func _initialise():
	var big_projects_dialogue: DialogueData = dialogue_box.dialogue_data
	if ( big_projects_dialogue.variables.has("big_project_id")):
		#print(big_project_id)
		_assign_ledger_from_dialogue(big_projects_dialogue)
	else:
		printerr("no big project id found in the dialogue")


func _assign_ledger_from_dialogue( big_projects_dialogue: DialogueData):
	var big_project_id = big_projects_dialogue.variables["big_project_id"].value
	var big_project: BigProject = load("res://data/big_projects/%s.tres" % big_project_id)
	var ledger_items = big_project.loots.map(func (loot: Loot): return LedgerItem.new(loot.loot_item, loot.amount))
	ledger.assign(ledger_items)
	#for ledger_item in ledger:
		#print(ledger_item.loot_item.name, ledger_item.current_amount, ledger_item.expected_amount)


#Signals
func _on_present_big_project_state_entered():
	_initialise()

