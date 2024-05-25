extends Node

@export var dialogue_box: DialogueBox = null

func _on_get_next_order_from_order_pool_popped(dialogue_data: DialogueData):
	dialogue_box.set_data(dialogue_data)
	DialogueHelper.assign_speaker(dialogue_box, dialogue_data)
	dialogue_box.start("start")
