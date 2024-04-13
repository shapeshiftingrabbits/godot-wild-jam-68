extends Node2D

@export var current_object: ForgeableItemData
# Called when the node enters the scene tree for the first time.
func _ready():
	set_to_initial_state()
	
func set_to_initial_state():
	$OutgoingOrder.hide()
	$Forge.hide()
	$IncomingOrder.show_item(current_object)

func _on_incoming_order_accepted():
	$IncomingOrder.hide()
	$Forge.start_process_with_object(current_object)

func _on_button_pressed():
	# todo: select next order
	set_to_initial_state()
	
func _on_forge_forged():
	$OutgoingOrder.show()
