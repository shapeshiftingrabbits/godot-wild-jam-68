extends RefCounted

class_name DialogueHelper

static func is_regular_dialogue(dialogue_box: DialogueBox):
	return _check_variable_presence(dialogue_box, "{{mission_name}}")
	
	
static func is_reward_dialogue(dialogue_box: DialogueBox):
	return _check_variable_presence(dialogue_box, "{{reward}}")
	
	
static func is_big_project_dialogue(dialogue_box: DialogueBox):
	return _check_variable_presence(dialogue_box, "{{big_project_id}}")


static func _check_variable_presence(dialogue_box: DialogueBox, variable_name: String):
	var has_variable = dialogue_box.get_variable(variable_name)
	#This is from the dialogue box plugin code, default are set to 'undefined'
	return ( has_variable != 'undefined')


static func assign_speaker(dialogue_box: DialogueBox, dialog_data: DialogueData):
	var dialogue_node = get_dialogue_node(dialogue_box)
	if ( dialog_data.variables.has("speaker")):
		dialogue_node["speaker"] = dialog_data.variables["speaker"]
	print(dialog_data.variables)


static func get_dialogue_node(dialogue_box: DialogueBox):
	return dialogue_box.dialogue_data.nodes.get("1_1")
