extends Node

signal ended

@export var dialogue_box: DialogueBox = null

func _on_order_pool_popped(dialog_data: DialogueData):
	dialogue_box.set_data(dialog_data)
	DialogueHelper.assign_speaker(dialogue_box, dialog_data)
	dialogue_box.start("start")


func _on_dialogue_box_dialogue_ended():
	if ( DialogueHelper.is_reward_dialogue(dialogue_box)):
		ended.emit()
