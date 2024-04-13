extends Panel

signal accepted

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_title(title : String):
	$VLayout/Title.text = title

func set_description(description : String):
	$VLayout/Description.text = description

func _on_button_pressed():
	accepted.emit()
	hide()
