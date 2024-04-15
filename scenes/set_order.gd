extends Control

signal accepted

func show_item ( item: ForgeableItemData):
	$DialogueBox.start("1")

func _on_dialogue_box_dialogue_ended():
	accepted.emit()
