extends Node2D

signal hit
signal missed
signal rejected
signal hit_ready_changed(hit_ready: bool)

var time = 0.0
var loop_time = 2.4 # seconds
var interactible = true
var currently_in_target = false
var hit_ready = true:
	set(value):
		var old_value = hit_ready
		hit_ready = value

		if old_value != value:
			hit_ready_changed.emit(value)

var target_times = [
	{ "from": 0.4, "to": 0.7 },
	{ "from": 1.35, "to": 1.65 },
	{ "from": 2.0, "to": 2.3 },
]

var RADIAN_TOP = -(TAU / 4)
var TARGET_SCRIPT = load("res://scripts/hammer_indicator_target.gd")

func _ready():
	for target_time in target_times:
		var target_length = absf(target_time["to"] - target_time["from"]) / loop_time
		var time_range_center = (target_time["to"] + target_time["from"]) / 2
		var target_rotation = RADIAN_TOP + TAU * (time_range_center / loop_time)

		var target = Node2D.new()
		target.set_script(TARGET_SCRIPT)
		target.rotation = target_rotation
		target.length = target_length

		add_child(target)

func _process(delta):
	if not interactible:
		return

	time += delta

	var was_in_target = currently_in_target
	currently_in_target = in_target_time()

	%Current.rotation = RADIAN_TOP + fmod(time / loop_time, 1.0) * TAU

	if was_in_target && not currently_in_target && not hit_ready:
		hit_ready = true
		var indicator = %Indicator as Sprite2D
		var texture = indicator.texture as AtlasTexture
		texture.region = Rect2(100, 300, 50, 50)

func _input(event):
	if not interactible:
		return

	if event is InputEvent && event.is_action_pressed("minigame_interact"):
		try_hit()

func in_target_time():
	var normalized_time = fmod(time, loop_time)

	for target_time in target_times:
		if normalized_time >= target_time["from"] && normalized_time <= target_time["to"]:
			return true

	return false

func try_hit():
	if not hit_ready:
		rejected.emit()
		return

	hit_ready = false

	if currently_in_target:
		hit.emit()
	else:
		missed.emit()

func enable():
	interactible = true
	show()

func disable():
	interactible = false
	hide()

func reset():
	time = 0.0
	currently_in_target = false
	hit_ready = true

func _on_hit_ready_changed(is_hit_ready: bool):
	var indicator = %Indicator as Sprite2D
	indicator.visible = is_hit_ready
