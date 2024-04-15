extends Resource

class_name Mission

@export var challenges: Array[Challenge]
@export var name: String

func get_strength():
	return challenges.reduce( func(accum, challenge): return accum + challenge.strength, 0)
