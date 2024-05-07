extends Node

signal big_project_updated

var ledger: Array[LedgerItem]

@export var big_projects_dialogue:DialogueData

func extract_ledger_from_dialogue():
	var big_project_id: String = ""
	if ( big_projects_dialogue.variables.has("big_project_id")):
		big_project_id = big_projects_dialogue.variables["big_project_id"]
	else:
		printerr("no big project id found in the dialogue")
	
	var big_project: BigProject = load("res://data/big_projects/%s" % big_project_id)
	ledger = big_project.loots.map(func (loot: Loot): LedgerItem.new(loot.loot_item, loot.amount))


func _on_run_dialogue_big_project_presented(big_project_dialogue):
	extract_ledger_from_dialogue()
