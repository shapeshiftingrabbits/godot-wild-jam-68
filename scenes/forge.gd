extends Panel

signal forged

@onready var forgeable_item = $ForgeableItem

func start_process_with_object(current_object: ForgeableItemData):
	set_process_mode(PROCESS_MODE_INHERIT)
	forgeable_item.set_to_initial_state(current_object.spriteFrames)
	$Tool.show()
	show()

func disable():
	hide()
	set_process_mode(PROCESS_MODE_DISABLED)

func _on_tool_hit():
	forgeable_item.update_visible_sprite()

func _on_forgeable_item_done():
	$Tool.hide()
	forged.emit()
