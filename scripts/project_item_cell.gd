extends VBoxContainer

class_name ProjectItemCell

@onready var button = $Button

@onready var title_label = %TitleLabel
@onready var available_label = %AvailableLabel
@onready var required_label = %RequiredLabel

var inventory: Inventory
var ledger_item: LedgerItem


## Used to assign the values to the cell after instanciating the packed scene
func set_model():
	await self.ready
	_update_layout()


func _update_layout():
	var name = ledger_item.loot_item.name
	var amount = inventory.get_amount_for_item(name)
	#available_label.text = inventory.
	title_label.text = name
	required_label.text = str(ledger_item.loot_item.expected_amount)
	available_label.text = str(ledger_item.loot_item.current_amount)
	button.disabled = ledger_item.completed()


func _on_button_pressed():
	pass # Replace with function body.
