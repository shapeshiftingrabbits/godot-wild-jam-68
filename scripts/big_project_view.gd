extends CanvasLayer

class_name BigProjectView

@export var cell_template: PackedScene
@export var player_state: PlayerState
@export var big_project_ledger: BigProjectLedger

@onready var list = %List

@onready var title = %Title
@onready var description = %Description
@onready var reward_description = %RewardDescription

var list_adapter: ListAdapter

func present(in_big_project_ledger: BigProjectLedger):
	big_project_ledger = in_big_project_ledger
		
	update_layout()


func update_layout():
	title.text = big_project_ledger.title
	description.text = big_project_ledger.description
	reward_description.text = big_project_ledger.reward_description


func assign_big_project_to_player():
	player_state.current_big_project_ledger = big_project_ledger
	player_state.big_project_ledgers.push_back(big_project_ledger)
	

func _on_button_pressed():
	pass # Replace with function body.
