extends CanvasLayer

class_name BigProjectPresentingView

signal big_project_accepted

@export var cell_template: PackedScene
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


func present(in_big_project_ledger: BigProjectLedger, in_inventory: Inventory):
	if (in_big_project_ledger):
		big_project_ledger = in_big_project_ledger
		inventory = in_inventory
	initialise()
	show()


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
	big_project_accepted.emit()
	hide()
