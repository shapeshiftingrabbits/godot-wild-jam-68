@tool

extends Node2D

@export var radius: float = 50.0:
	set(value):
		radius = value
		queue_redraw()

@export var thickness: float = 20.0:
	set(value):
		thickness = value
		queue_redraw()

@export var fill_color: Color = Color.WHITE:
	set(value):
		fill_color = value
		queue_redraw()

@export var antialias: bool = true:
	set(value):
		antialias = value
		queue_redraw()

@export_range(0.0, 1.0) var length = 0.1:
	set(value):
		length = value
		queue_redraw()

func _draw():
	var total_arc = TAU * length
	var start = -total_arc / 2
	var end = total_arc / 2

	draw_arc(Vector2(0, 0), radius, start, end, roundi(radius), fill_color, thickness, antialias)
