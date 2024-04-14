extends Node2D
signal hit

@export var loop_time_seconds: float = 1.0
@export var difficulty: int = 5

var time: float = 0

func _process(delta):
	time += delta

	%Current.rotation = fmod(time / loop_time_seconds, 1.0) * TAU
	%Target.difficulty = difficulty

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

func enable():
	set_process_mode(PROCESS_MODE_INHERIT)
	show()

func disable():
	hide()
	set_process_mode(PROCESS_MODE_DISABLED)
