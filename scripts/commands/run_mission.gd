extends RefCounted

class_name RunMission

## Calculate the success of the [param challenge_capacity] agains a list of [param challenges].
static func do(challenge_capacity: int, challenges: Array[Challenge]):
	var current_challenge_capacity = challenge_capacity
	var beaten_challenge_loots = []
	var beaten_challenge_nb = 0
	for i in challenges.size():
		var challenge = challenges[i]
		current_challenge_capacity -= challenge.strength
		if (current_challenge_capacity >= 0):
			beaten_challenge_nb += 1
			beaten_challenge_loots.push_back(challenge)
		else:
			break
	
	var result = {
		"mission_score": _get_score(beaten_challenge_nb, challenges.size()),
		"loots": beaten_challenge_loots
	}
	return result

static func _get_score(beaten_challenge_index: int, challenge_length: int):
	var scores = ["C", "B", "A"]
	var score_index = round(beaten_challenge_index * scores.size() / challenge_length) - 1
	var score = scores[score_index]
	return score
