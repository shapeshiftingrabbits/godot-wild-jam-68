extends Resource

class_name PlayerState

signal big_project_completed

@export var reputation: int = 0

# TODO This needs to be moved to the mission or crafted object later on
@export var reputation_gain = 1

@export var inventory: Inventory

var has_current_big_project: bool:
	get:
		return current_big_project_ledger != null

var big_project_ledgers: Array[BigProjectLedger]

var current_big_project_ledger: BigProjectLedger = null

func increment_reputation(input_reputation_gain: int = 1):
	reputation += reputation_gain 
	

func track_big_project_ledger(big_project_ledger: BigProjectLedger):
	current_big_project_ledger = big_project_ledger
	big_project_ledgers.push_back(big_project_ledger)


func complete_current_project():
	current_big_project_ledger = null
	big_project_completed.emit()
