extends Node

signal done(mission_name: String, character_name: int, challenge_capacity: int, item_id: String)


@export var dialogue_box: DialogueBox = null

func _on_dialogue_box_dialogue_ended():
	if ( DialogueHelper.is_regular_dialogue(dialogue_box)):
		_extract_variable()



	
	done.emit(mission_name, character_index, challenge_capacity, item_id)
