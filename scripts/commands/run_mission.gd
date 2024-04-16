extends RefCounted

class_name RunMission

## Calculate the success of the [param challenge_capacity] agains a list of [param challenges].
func do(challenge_capacity: int, challenges: Array[Challenge]):
	var current_challenge_capacity = challenge_capacity
	var beaten_challenge_loots = []
	var beaten_challenge_index = 0
	for i in challenges.size():
		var challenge = challenges[i]
		current_challenge_capacity -= challenge.strength
		if (current_challenge_capacity >= 0):
			beaten_challenge_index = i
			beaten_challenge_loots.push_back(challenge)
		else:
			break
	
	var result = {
		"mission_score": _get_score(beaten_challenge_index, challenges.size()),
		"loots": beaten_challenge_loots
	}
	return result

func _get_score(beaten_challenge_index: int, challenge_length: int):
	const nb_segments = 3
	var step_size = round(challenge_length / nb_segments)
	var scores = ["A", "B", "C"]
	var score = scores[round(beaten_challenge_index / step_size) - 1]
	return score