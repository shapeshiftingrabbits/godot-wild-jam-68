extends Resource

class_name BigProjectLedger

signal is_completed

var ledger: Array[LedgerItem]
var completed: bool = false
var started: bool = false

func _initialiase_from_dialogue( big_projects_dialogue: DialogueData):
	var big_project_id = big_projects_dialogue.variables["big_project_id"].value
	var big_project: BigProject = load("res://data/big_projects/%s.tres" % big_project_id)
	var ledger_items = big_project.loots.map(func (loot: Loot): return LedgerItem.new(loot.loot_item, loot.amount))
	ledger.assign(ledger_items)
	#for ledger_item in ledger:
		#print(ledger_item.loot_item.name, ledger_item.current_amount, ledger_item.expected_amount)

func accept_big_project():
	started = true
	
	
func check_ledger():
	completed = ledger.all(func (item: LedgerItem): item.completed())
	if ( completed):
		is_completed.emit()
		
