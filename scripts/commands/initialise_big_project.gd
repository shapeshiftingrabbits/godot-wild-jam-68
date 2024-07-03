extends Node

@onready var dialogue_box = %DialogueBox
@export var big_project_view: BigProjectView

func _show_big_project_view():
	big_project_view.present(dialogue_box.dialogue_data)


#Signals
func _on_present_big_project_state_entered():
	_show_big_project_view()

