extends Node

class_name RunMission

signal completed(mission_result: MissionResult)

@export var missions: Array[Mission]

func _on_extract_variable_from_dialogue_done(mission_name: String, character_index: int, challenge_capacity: int, _item_id: String):
	var mission: Mission = missions.filter(func(item): return item.name == mission_name).pick_random() # Expect only 1 result
	var beaten_challenges: Array[Challenge] = _get_loots_from_running_mission(challenge_capacity, mission.challenges)
	var score = _get_score(beaten_challenges.size(), mission.challenges.size())
	var result = _create_mission_result(character_index, beaten_challenges, score)
	completed.emit(result)


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


func _create_mission_result(character_index: int, challenges: Array[Challenge], score: String):
	var result = MissionResult.new()
	result.mission_score = score
	result.challenges.assign(challenges)
	result.character_index = character_index
	return result
