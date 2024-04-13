extends Panel

signal accepted

func show_item ( item: ForgeableItemData):
	$VLayout/Title.text = item.title
	$VLayout/Description.text = item.description
	show()

func _on_button_pressed():
	accepted.emit()
	hide()
