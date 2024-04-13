extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$DoneLabel.hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_tool_used():
	$ForgeableItem.update_visible_sprite()

func _on_forgeable_item_done():
	$DoneLabel.show()
