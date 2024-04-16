extends RefCounted

class_name CreateReward

var characterNameToIndex: Dictionary = {}
var reward_dialogue: DialogueData = null
var dialogue_box: DialogueBox = null

func load_reward_dialogue(dialogue_box_in: DialogueBox, reward_dialogue_in: DialogueData):
	reward_dialogue = reward_dialogue_in
	dialogue_box = dialogue_box_in

	dialogue_box.set_data(reward_dialogue)
	var characters = load(reward_dialogue.characters)
	for i in characters.size():
		var character = characters[i]
		characterNameToIndex[character.name] = i

func do(character_name: String, mission: Mission, reward: Dictionary):
	var dialogue_node = reward_dialogue.nodes[1]
	dialogue_node["speaker"] = characterNameToIndex[character_name]
	dialogue_box.set_variable("reward", TYPE_STRING, "20 $")
