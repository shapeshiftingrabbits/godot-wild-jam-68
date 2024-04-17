extends Node

signal variable_extracted(mission_name: String, character_name: int, challenge_capacity: int)
signal item_extracted(item_id: String)
signal reward_dialogue_created(reward_dialogue: DialogueData)

@export var dialogue_box: DialogueBox = null
@export var reward_dialogue: DialogueData = null

func _on_order_pool_popped(dialog_data: DialogueData):
	dialogue_box.set_data(dialog_data)
	dialogue_box.start("start")


func _on_dialogue_box_dialogue_ended():
	_extract_variable()

func _extract_variable():
	var mission_name = dialogue_box.get_variable("{{mission_name}}")
	var challenge_capacity: int = dialogue_box.get_variable("{{challenge_capacity}}")
	var item_id: String = dialogue_box.get_variable("{{item_id}}")
	print(dialogue_box.dialogue_data.nodes)
	var dialogue_node = dialogue_box.dialogue_data.nodes[0]
	var character_index = dialogue_node["speaker"]
	
	variable_extracted.emit(mission_name, character_index, challenge_capacity)
	item_extracted.emit(item_id)


func _on_run_mission_completed(mission_result: MissionResult):
	_set_variables_in_reward_dialogue(mission_result.character_index, mission_result.mission_score)


## Assumes the same character list in the order and reward resources.
func _set_variables_in_reward_dialogue(character_index: int, mission_score: String):
	dialogue_box.set_data(reward_dialogue)
	var dialogue_node = reward_dialogue.nodes[1]
	dialogue_node["speaker"] = character_index
	dialogue_box.set_variable("reward", TYPE_STRING, "20 $")
	dialogue_box.set_variable("mission_score", TYPE_STRING, mission_score)
	reward_dialogue_created.emit(dialogue_box.dialogue_data)
