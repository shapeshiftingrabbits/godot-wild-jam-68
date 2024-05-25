extends Node

signal is_confirmed(big_project_dialogue: DialogueData)

@export var dialogue_box: DialogueBox = null

func _on_dialogue_box_dialogue_ended():
	if (DialogueHelper.is_big_project_dialogue(dialogue_box)): 
		is_confirmed.emit(dialogue_box.dialogue_data)
