extends Node

signal variable_extracted(mission_name: String, character_name: int, challenge_capacity: int)
signal item_extracted(item_id: String)
signal reward_dialogue_created(reward_dialogue: DialogueData)
signal ended
signal big_project_presented(big_project_dialogue: DialogueData)

@export var dialogue_box: DialogueBox = null
@export var reward_dialogue: DialogueData = null

func _on_order_pool_popped(dialog_data: DialogueData):
	dialogue_box.set_data(dialog_data)
	DialogueHelper.assign_speaker(dialogue_box, dialog_data)
	dialogue_box.start("start")


func _on_dialogue_box_dialogue_ended():
	if ( DialogueHelper.is_regular_dialogue(dialogue_box)):
		_extract_variable()
	elif (DialogueHelper.is_big_project_dialogue(dialogue_box)): 
		big_project_presented.emit(dialogue_box.dialogue_data)
	else:
		ended.emit()


func _extract_variable():
	var mission_name = dialogue_box.get_variable("{{mission_name}}")
	var challenge_capacity: int = dialogue_box.get_variable("{{challenge_capacity}}")
	var item_id: String = dialogue_box.get_variable("{{item_id}}")
	var dialogue_node = DialogueHelper.get_dialogue_node(dialogue_box)
	var character_index = dialogue_node["speaker"]
	
	variable_extracted.emit(mission_name, character_index, challenge_capacity)
	item_extracted.emit(item_id)


func _on_run_mission_completed(mission_result: MissionResult):
	_set_variables_in_reward_dialogue(mission_result.character_index, mission_result.mission_score, mission_result.challenges)


## Assumes the same character list in the order and reward resources.
func _set_variables_in_reward_dialogue(character_index: int, mission_score: String, challenges: Array[Challenge]):
	dialogue_box.set_data(reward_dialogue)
	var rewards = get_loot_description(challenges)
	reward_dialogue.variables["reward"] = {"type":TYPE_STRING, "value": rewards}
	reward_dialogue.variables["mission_score"] = {"type":TYPE_STRING, "value": mission_score}
	reward_dialogue.variables["speaker"] = {"type":TYPE_INT, "value": character_index}
	
	reward_dialogue_created.emit(reward_dialogue)


func get_loot_description(challenges: Array[Challenge]):
	var results = []
	var loot_amount = {}
	for challenge in challenges:
		var amount = loot_amount[challenge.loot_item.name] if loot_amount.has(challenge.loot_item.name) else 0
		loot_amount[challenge.loot_item.name] =  amount + challenge.amount
	
	for loot in loot_amount:
		results.push_back( "%s : %d" % [ loot, loot_amount[loot]])
	
	var printed = ", ".join(results)
	print (printed)
	return printed
