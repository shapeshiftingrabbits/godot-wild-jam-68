extends Resource

class_name BigProjectLedger

signal is_completed

@export var big_project: BigProject

var ledger: Array[LedgerItem]
var ledger_map: Dictionary
var completed: bool = false
var started: bool = false
var title: String: 
	get: 
		return big_project.title
var description: String: 
	get: 
		return big_project.description
var reward_description: String: 
	get: 
		return big_project.description

func init_from_dialogue( big_projects_dialogue: DialogueData):
	var big_project_id = big_projects_dialogue.variables["big_project_id"].value
	var loaded_big_project: BigProject = load("res://data/big_projects/%s.tres" % big_project_id)
	big_project = loaded_big_project
	create_ledger()
	#for ledger_item in ledger:
		#print(ledger_item.loot_item.name, ledger_item.current_amount, ledger_item.expected_amount)

func init_with_big_project():
	create_ledger()


func create_ledger():
	var ledger_items = big_project.loots.map(func (loot: Loot): return parse_leger_item(loot))
	ledger.assign(ledger_items)


func parse_leger_item(loot: Loot):
	var ledger_item = LedgerItem.new(loot.loot_item, loot.amount)
	ledger_map[loot.loot_item.name] = ledger_item
	return ledger_item
	

func update_ledger(name: String, amount: int):
	if (ledger_map.has(name)):
		ledger_map[name].current_amount = amount
		check_ledger()


func accept_big_project():
	started = true
	
	
func check_ledger():
	completed = ledger.all(func (item: LedgerItem): item.completed())
	if ( completed):
		is_completed.emit()
		
