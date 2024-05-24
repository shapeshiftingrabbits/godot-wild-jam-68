extends Node

@export var items: Array[ForgeableItemData] = []
@export var forge: Forge = null

func _on_extract_variable_from_dialogue_done(mission_name: String, character_index: int, challenge_capacity: int, item_id: String):
	print("_on_run_dialogue_item_extracted", item_id)
	var found_item = items.filter(func(item: ForgeableItemData): return item.id == item_id).pick_random()
	
	forge.start_process_with_object(found_item)
