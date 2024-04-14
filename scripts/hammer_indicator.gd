extends Node
signal hit

@export var loop_time_seconds: float = 1.0
@export var difficulty: int = 5

@onready var current: Node2D = get_node("HammerIndicatorCurrent")
@onready var target: Node2D = get_node("HammerIndicatorTarget")

var time: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta

	current.rotation = fmod(time / loop_time_seconds, 1.0) * TAU
	target.rotation = TAU * 3 / 4
	target.difficulty = difficulty

func _input(event):
	if event is InputEvent:
		if event.is_action_pressed("minigame_interact"):
			if in_target_time():
				hit.emit()

func in_target_time():
	var target_time_duration = loop_time_seconds / difficulty
	var start_time = loop_time_seconds * 3 / 4 - target_time_duration / 2
	var end_time = start_time + target_time_duration

	var normalized_time = fmod(time, loop_time_seconds)

	return normalized_time >= start_time && normalized_time <= end_time
