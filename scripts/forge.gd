extends Panel

signal forged

@export var forgeable_item: Node2D
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
	print("_on_run_dialogue_item_extracted", item_id)
	var found_item = items.filter(func(item: ForgeableItemData): return item.id == item_id).pick_random()
	forgeable_item.set_to_initial_state(found_item.spriteFrames)
	start_process_with_object()

func start_process_with_object():
	set_process_mode(PROCESS_MODE_INHERIT)
	$Tool.reset()
	$Tool.enable()
	show()
