extends Panel

class_name Forge

signal forged

@export var forgeable_item: Node2D


func disable():
	hide()
	set_process_mode(PROCESS_MODE_DISABLED)


func _on_tool_hit():
	forgeable_item.update_visible_sprite()


func _on_forgeable_item_done():
	$Tool.disable()
	forged.emit()


func start_process_with_object(item: ForgeableItemData):
	forgeable_item.set_to_initial_state(item.spriteFrames)
	set_process_mode(PROCESS_MODE_INHERIT)
	$Tool.reset()
	$Tool.enable()
	show()
