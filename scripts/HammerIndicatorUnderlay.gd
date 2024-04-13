extends Node2D

func _process(_delta):
	queue_redraw()

func _draw():
	var white : Color = Color(255, 255, 255, 0.5)

	draw_arc(Vector2(0, 0), 50, 0, TAU, 360, white, 20, true)
