extends Node2D

@onready var forgeableItem = $ForgePanel/ForgeableItem
# Called when the node enters the scene tree for the first time.
func _ready():
	$DoneLabel.hide()
	$ForgePanel.hide()
	$IncomingOrder.set_title(forgeableItem.title)
	$IncomingOrder.set_description(forgeableItem.description)
	$IncomingOrder.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_tool_used():
	forgeableItem.update_visible_sprite()

func _on_forgeable_item_done():
	$ForgePanel.hide()
	$DoneLabel.show()

func _on_incoming_order_accepted():
	$IncomingOrder.hide()
	$ForgePanel.show()
