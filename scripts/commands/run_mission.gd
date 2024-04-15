
func do (challenge_capacity: int, challenges: Array[Challenge]):
	var current_challenge_capacity = challenge_capacity
	var beaten_challenge_loots = []
	const nb_segments = 3
	var step_size = round(challenges.size() / nb_segments )
	var beaten_challenge_index = 0
	for i in challenges.size():
		var challenge = challenges[i]
		current_challenge_capacity -= challenge.strength
		if (current_challenge_capacity >= 0):
			beaten_challenge_index = i
			beaten_challenge_loots.push_back(challenge)
		else:
			break
	var scores = ["A","B","C"]
	var score = scores[ round(beaten_challenge_index/step_size) - 1 ]			
	var result = {
		"mission_score": score , 
		"loots": beaten_challenge_loots
	}
	return result
