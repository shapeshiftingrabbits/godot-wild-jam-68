extends Node

class_name RunMission

@export var missions: Array[Mission]
@export var reward_dialogue: DialogueData = null
@onready var dialogue_box = %DialogueBox
@onready var order_pool: OrderPool = %OrderPool

func create_mission_result_dialogue():
	var mission_name = DialogueHelper.get_mission_name(dialogue_box)
	var mission: Mission = missions.filter(func(item): return item.name == mission_name).pick_random() # Expect only 1 result
	
	# Get score and encounters results.
	var challenge_capacity: int = dialogue_box.get_variable("{{challenge_capacity}}")
	var beaten_challenges: Array[Challenge] = _get_loots_from_running_mission(challenge_capacity, mission.challenges)
	var score = _get_score(beaten_challenges.size(), mission.challenges.size())
	
	# Get the speaker from the dialogue the dialogue
	var dialogue_node = DialogueHelper.get_dialogue_node(dialogue_box)
	var character_index = dialogue_node["speaker"]
	
	var fill_in_reward_dialogue = FillInRewardDialogue.new(dialogue_box, reward_dialogue)
	fill_in_reward_dialogue._set_variables_in_reward_dialogue(character_index,score,beaten_challenges)
	
	order_pool.insert_order(reward_dialogue)


## Calculate the success of the [param challenge_capacity] agains a list of [param challenges].
func _get_loots_from_running_mission(challenge_capacity: int, challenges: Array[Challenge]):
	var current_challenge_capacity = challenge_capacity
	var beaten_challenges: Array[Challenge] = []
	
	for i in challenges.size():
		var challenge = challenges[i]
		current_challenge_capacity -= challenge.strength
		if (current_challenge_capacity >= 0):
			beaten_challenges.push_back(challenge)
		else:
			break

	return beaten_challenges


func _get_score(beaten_challenge_index: int, challenge_length: int):
	var scores = ["C", "B", "A"]
	var score_index = round(beaten_challenge_index * scores.size() / challenge_length) - 1
	var score = scores[score_index]
	return score


# Signal
func _on_run_mission_state_entered():
	create_mission_result_dialogue()
