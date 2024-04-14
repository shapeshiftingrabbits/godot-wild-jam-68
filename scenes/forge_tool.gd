extends Node2D
signal hit

@export var loop_time_seconds: float = 1.0
@export var difficulty: int = 5

var time: float = 0
var interactible = true
var hit_this_loop = false

func _process(delta):
	var mod_before = fmod(time, loop_time_seconds)

	time += delta

	%Current.rotation = fmod(time / loop_time_seconds, 1.0) * TAU
	# TODO: probably should be elsewhere
	%Target.difficulty = difficulty

	if fmod(time, loop_time_seconds) < mod_before:
		hit_this_loop = false

func _input(event):
	if interactible && event is InputEvent:
		if event.is_action_pressed("minigame_interact") && in_target_time():
			if not hit_this_loop:
				hit_this_loop = true
				hit.emit()

func in_target_time():
	var target_time_duration = loop_time_seconds / difficulty
	var start_time = loop_time_seconds * 3 / 4 - target_time_duration / 2
	var end_time = start_time + target_time_duration

	var normalized_time = fmod(time, loop_time_seconds)

	return normalized_time >= start_time && normalized_time <= end_time

func enable():
	interactible = true
	show()

func disable():
	interactible = false
	hide()

func reset():
	time = 0.0
