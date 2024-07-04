extends Resource

class_name LootItem

@export var name: String
var key: String = resource_name

func _ready():
	print(resource_name)
	print(resource_path)
