extends Resource

class_name PlayerState

@export var reputation: int = 0

# TODO This needs to be moved to the mission or crafted object later on
@export var reputation_gain = 1

@export var inventory: Inventory

var has_current_big_project: bool:
	get:
		return current_big_project_ledger != null

var big_project_ledgers: Array[BigProjectLedger]

var current_big_project_ledger: BigProjectLedger

func increment_reputation(input_reputation_gain: int = 1):
	reputation += reputation_gain 
	

func track_big_project_ledger(big_project_ledger: BigProjectLedger):
	current_big_project_ledger = big_project_ledger
	big_project_ledgers.push_back(big_project_ledger)
