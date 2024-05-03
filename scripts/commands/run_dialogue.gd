extends Node

signal variable_extracted(mission_name: String, character_name: int, challenge_capacity: int)
signal item_extracted(item_id: String)
signal reward_dialogue_created(reward_dialogue: DialogueData)
signal ended

@export var dialogue_box: DialogueBox = null
@export var reward_dialogue: DialogueData = null

func _on_order_pool_popped(dialog_data: DialogueData):
		# the node that interest us is 1_1
	#dialogue_box.set_variable("reward", TYPE_STRING, "20 $")
	#dialogue_box.set_variable("mission_score", TYPE_STRING, mission_score)
	dialogue_box.set_data(dialog_data)
	var dialogue_node = _get_dialogue_node()
	if ( dialog_data.variables.has("speaker")):
		dialogue_node["speaker"] = dialog_data.variables["speaker"]
	print(dialog_data.variables)
	dialogue_box.start("start")


func _on_dialogue_box_dialogue_ended():
	if ( is_reward_dialogue()):
		_extract_variable()
	else:
		ended.emit()


func is_reward_dialogue():
	var is_reward = dialogue_box.get_variable("{{mission_score}}")
	#This is from the dialogue box plugin code, default are set to 'undefined'
	return ( is_reward == 'undefined')


func _extract_variable():
	var mission_name = dialogue_box.get_variable("{{mission_name}}")
	var challenge_capacity: int = dialogue_box.get_variable("{{challenge_capacity}}")
	var item_id: String = dialogue_box.get_variable("{{item_id}}")
	var dialogue_node = _get_dialogue_node()
	var character_index = dialogue_node["speaker"]
	
	variable_extracted.emit(mission_name, character_index, challenge_capacity)
	item_extracted.emit(item_id)


func _get_dialogue_node():
	return dialogue_box.dialogue_data.nodes.get("1_1")


func _on_run_mission_completed(mission_result: MissionResult):
	_set_variables_in_reward_dialogue(mission_result.character_index, mission_result.mission_score, mission_result.challenges)


## Assumes the same character list in the order and reward resources.
func _set_variables_in_reward_dialogue(character_index: int, mission_score: String, challenges: Array[Challenge]):
	dialogue_box.set_data(reward_dialogue)
	var rewards = challenges.map(func (challenge): return challenge.get_loot_description())
	reward_dialogue.variables["reward"] = {"type":TYPE_STRING, "value": rewards}
	reward_dialogue.variables["mission_score"] = {"type":TYPE_STRING, "value": mission_score}
	reward_dialogue.variables["speaker"] = {"type":TYPE_INT, "value": character_index}
	
	reward_dialogue_created.emit(reward_dialogue)
