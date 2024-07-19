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
@onready var completed_view = %CompletedView

var list_adapter: ListAdapter

func _ready():
	_initalise_for_debugging()
	

func _initalise_for_debugging():
	if (big_project_ledger):
		big_project_ledger.init_with_big_project()
		_initialise()
	

func present():
	if (!_is_initialised()):
		if (player_state.current_big_project_ledger):
			big_project_ledger = player_state.current_big_project_ledger
			inventory = player_state.inventory
			_initialise()
	show()
	if (big_project_ledger.is_completed):
		_show_completed_view()
	else:
		completed_view.hide()


func _is_initialised():
	return list_adapter != null


func _initialise():
	_create_list_adapter()
	_update_layout()
	big_project_ledger.completed.connect(_show_completed_view)


func _create_list_adapter():
	var models: Array = []
	for ledger in big_project_ledger.ledger:
		var model = ProjectItemModel.new(ledger, inventory)
		models.push_back(model)
	list_adapter = ListAdapter.new(models, list, cell_template)


func _update_layout():
	title.text = big_project_ledger.title
	description.text = big_project_ledger.description
	reward_description.text = big_project_ledger.reward_description


func _show_completed_view():
	completed_view.show()


# Signals

func _on_ledger_complete():
	_show_completed_view()


func _on_button_pressed():
	hide()


func _on_complet_project_pressed():
	player_state.complete_current_project()
	hide()
