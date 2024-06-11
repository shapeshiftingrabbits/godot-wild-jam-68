extends RefCounted

class_name FillInRewardDialogue

var dialogue_box: DialogueBox = null
var reward_dialogue: DialogueData = null


func _on_run_mission_completed(mission_result: MissionResult):
	_set_variables_in_reward_dialogue(mission_result.character_index, mission_result.mission_score, mission_result.challenges)

func _init(in_dialogue_box: DialogueBox, in_reward_dialogue: DialogueData):
	dialogue_box = in_dialogue_box
	reward_dialogue = in_reward_dialogue

## Assumes the same character list in the order and reward resources.
func _set_variables_in_reward_dialogue(character_index: int, mission_score: String, challenges: Array[Challenge]):
	dialogue_box.set_data(reward_dialogue)
	var rewards = get_loot_description(challenges)
	reward_dialogue.variables["reward"] = {"type":TYPE_STRING, "value": rewards}
	reward_dialogue.variables["mission_score"] = {"type":TYPE_STRING, "value": mission_score}
	reward_dialogue.variables["speaker"] = {"type":TYPE_INT, "value": character_index}
	


func get_loot_description(challenges: Array[Challenge]):
	var results = []
	var loot_amount = {}
	for challenge in challenges:
		var amount = loot_amount[challenge.loot_item.name] if loot_amount.has(challenge.loot_item.name) else 0
		loot_amount[challenge.loot_item.name] =  amount + challenge.amount
	
	for loot in loot_amount:
		results.push_back( "%s : %d" % [ loot, loot_amount[loot]])
	
	var printed = ", ".join(results)
	return printed
