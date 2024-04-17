extends Panel

signal forged

var forgeable_item
@export var items: Array[ForgeableItemData]

func disable():
	hide()
	set_process_mode(PROCESS_MODE_DISABLED)

func _on_tool_hit():
	forgeable_item.update_visible_sprite()

func _on_forgeable_item_done():
	$Tool.disable()
	forged.emit()

func _on_run_dialogue_item_extracted(item_id: String):
	var item = items.filter(func(item: ForgeableItemData): return item.id == item_id).pick_random()
	forgeable_item.set_to_initial_state(item.spriteFrames)
	start_process_with_object()

func start_process_with_object():
	set_process_mode(PROCESS_MODE_INHERIT)
	$Tool.reset()
	$Tool.enable()
	show()
