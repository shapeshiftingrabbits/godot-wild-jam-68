extends Node2D

func _draw():

	var white : Color = Color.WHITE
	var top = (TAU / 4 * 3)

	draw_arc(Vector2(0, 0), 50, top - (TAU / 12), top + (TAU / 12), 360, white, 20, true)
