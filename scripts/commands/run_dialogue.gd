extends Node

@onready var dialogue_box: DialogueBox = %DialogueBox
@onready var order_pool: OrderPool = %OrderPool
@onready var state_chart: StateChart = %StateChart

func do():
	var dialogue_data = order_pool.get_order()
	dialogue_box.set_data(dialogue_data)
	
	DialogueHelper.assign_speaker(dialogue_box, dialogue_data)
	_set_dialogue_type_for_expression_property()
	
	dialogue_box.start("start")
	
func _set_dialogue_type_for_expression_property():
	var dialogue_type = dialogue_box.get_variable("{{dialogue_type}}")
	state_chart.set_expression_property("dialogue_type", dialogue_type)

# Signals
func _on_get_next_dialogue_state_entered():
	do()
