extends Node

signal is_confirmed

@export var dialogue_box: DialogueBox = null

func _on_dialogue_box_dialogue_ended():
	if ( DialogueHelper.is_reward_dialogue(dialogue_box)):
		is_confirmed.emit()
