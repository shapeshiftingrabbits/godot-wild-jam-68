extends CanvasLayer

class_name HUD

signal inventory_pressed
signal big_project_pressed

@export var inventory: Inventory
@export var player_state: PlayerState:
	set(value):
		player_state = value
		player_state.big_project_completed.connect(_on_big_project_complete)
		
@onready var inventory_button = %InventoryButton
@onready var big_project_button = %BigProjectButton


func _ready():
	update_layout()


func _on_big_project_complete():
	update_layout()


func update_layout():
	if (player_state):
		big_project_button.disabled = !player_state.has_current_big_project


func _on_inventory_button_pressed():
	inventory_pressed.emit()


func _on_big_project_button_pressed():
	big_project_pressed.emit()

