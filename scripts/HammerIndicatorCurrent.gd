extends Node2D

var time : float:
	set(value):
		time = value

func _process(_delta):
	time += _delta
	queue_redraw()

func _draw():
	var black : Color = Color.BLACK
	var start : float = fmod((time) * TAU, TAU)

	draw_arc(Vector2(0, 0), 50, start, start + TAU / 64, 10, black, 32, true)
