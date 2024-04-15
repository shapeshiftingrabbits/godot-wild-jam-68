static func do(challenge_capacity: int, challenges: Array[Challenge]):
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
		"mission_score": get_score(beaten_challenge_index, challenges.size()),
		"loots": beaten_challenge_loots
	}
	return result

static func get_score(beaten_challenge_index: int, challenge_length: int):
	const nb_segments = 3
	var step_size = round(challenge_length / nb_segments)
	var scores = ["A", "B", "C"]
	var score = scores[round(beaten_challenge_index / step_size) - 1]
	return score
