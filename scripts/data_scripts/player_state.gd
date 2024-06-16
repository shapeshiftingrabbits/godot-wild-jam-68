extends Resource

class_name PlayerState

@export var reputation: int = 0

# TODO This needs to be moved to the mission or crafted object later on
@export var reputation_gain = 1

@export var inventory: Inventory

func increment_reputation(input_reputation_gain: int = 1):
	reputation += reputation_gain 
