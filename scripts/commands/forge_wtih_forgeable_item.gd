extends Node

@export var items: Array[ForgeableItemData] = []
@export var forge: Forge = null
@onready var dialogue_box = %DialogueBox
@onready var state_chart = %StateChart

func do():
	var item_id: String = dialogue_box.get_variable("{{item_id}}")
	print("_on_run_dialogue_item_extracted", item_id)
	var found_item = items.filter(func(item: ForgeableItemData): return item.id == item_id).pick_random()
	
	forge.start_process_with_object(found_item)


# Signals
func _on_craft_state_entered():
	do()


func _on_forge_forged():
	state_chart.send_event("crafted")
