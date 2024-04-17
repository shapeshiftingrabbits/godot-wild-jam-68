extends Node

class_name RunMission

signal completed(mission_result: MissionResult)

@export var missions: Array[Mission]

func _on_run_dialogue_variable_extracted(mission_name: String, character_index: int, challenge_capacity: int):
	var mission: Mission = missions.filter(func(item): return item.name == mission_name).pick_random() # Expect only 1 result
	var challenge_loots = _get_loots_from_running_mission(challenge_capacity, mission.challenges)
	var score = _get_score(challenge_loots.size(), mission.challenges.size())
	var result = _create_mission_result(character_index, challenge_loots, score)
	completed.emit(result)

## Calculate the success of the [param challenge_capacity] agains a list of [param challenges].
func _get_loots_from_running_mission(challenge_capacity: int, challenges: Array[Challenge]):
	var current_challenge_capacity = challenge_capacity
	var beaten_challenge_loots = []
	for i in challenges.size():
		var challenge = challenges[i]
		current_challenge_capacity -= challenge.strength
		if (current_challenge_capacity >= 0):
			beaten_challenge_loots.push_back(challenge)
		else:
			break
	return beaten_challenge_loots

func _create_mission_result(character_index: int, challenge_loots: Array[Loot], score: int):
	var result = MissionResult.new()
	result.mission_score = score
	result.loots = challenge_loots
	result.character_index = character_index
	return result

func _get_score(beaten_challenge_index: int, challenge_length: int):
	var scores = ["C", "B", "A"]
	var score_index = round(beaten_challenge_index * scores.size() / challenge_length) - 1
	var score = scores[score_index]
	return score
