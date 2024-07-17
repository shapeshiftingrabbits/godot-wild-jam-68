extends CanvasLayer

class_name BigProjectView

@export var cell_template: PackedScene
@export var player_state: PlayerState
## Assign via interface for testing
@export var big_project_ledger: BigProjectLedger
## Assign via interface for testing
@export var inventory: Inventory

@onready var list = %List

@onready var title = %Title
@onready var description = %Description
@onready var reward_description = %RewardDescription

var list_adapter: ListAdapter

func _ready():
	if (big_project_ledger):
		big_project_ledger.init_with_big_project()
		initialise()


func present():
	if (!_is_initialised()):
		if (player_state.current_big_project_ledger):
			big_project_ledger = player_state.current_big_project_ledger
			inventory = player_state.inventory

			initialise()
	show()


func _is_initialised():
	return list_adapter != null

func initialise():
	var models: Array = []
	for ledger in big_project_ledger.ledger:
		var model = ProjectItemModel.new(ledger, inventory)
		models.push_back(model)
	list_adapter = ListAdapter.new(models, list, cell_template)
	update_layout()


func update_layout():
	title.text = big_project_ledger.title
	description.text = big_project_ledger.description
	reward_description.text = big_project_ledger.reward_description


func _on_button_pressed():
	hide()
