extends Node


var ledger: Array[LedgerItem]

var big_projects_dialogue:DialogueData

func _on_check_if_dialogue_is_big_project_is_confirmed(p_big_project_dialogue: DialogueData):
	big_projects_dialogue = p_big_project_dialogue
	extract_ledger_from_dialogue()


func extract_ledger_from_dialogue():
	var big_project_id
	if ( big_projects_dialogue.variables.has("big_project_id")):
		big_project_id = big_projects_dialogue.variables["big_project_id"].value
		#print(big_project_id)
	else:
		printerr("no big project id found in the dialogue")
	
	var big_project: BigProject = load("res://data/big_projects/%s.tres" % big_project_id)
	var ledger_items = big_project.loots.map(func (loot: Loot): return LedgerItem.new(loot.loot_item, loot.amount))
	ledger.assign(ledger_items)
	#for ledger_item in ledger:
		#print(ledger_item.loot_item.name, ledger_item.current_amount, ledger_item.expected_amount)
