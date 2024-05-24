extends Node

signal done(mission_name: String, character_name: int, challenge_capacity: int, item_id: String)


@export var dialogue_box: DialogueBox = null

func _on_dialogue_box_dialogue_ended():
	if ( DialogueHelper.is_regular_dialogue(dialogue_box)):
		_extract_variable()


func _extract_variable():
	var mission_name = dialogue_box.get_variable("{{mission_name}}")
	var challenge_capacity: int = dialogue_box.get_variable("{{challenge_capacity}}")
	var item_id: String = dialogue_box.get_variable("{{item_id}}")
	var dialogue_node = DialogueHelper.get_dialogue_node(dialogue_box)
	var character_index = dialogue_node["speaker"]
	
	done.emit(mission_name, character_index, challenge_capacity, item_id)
