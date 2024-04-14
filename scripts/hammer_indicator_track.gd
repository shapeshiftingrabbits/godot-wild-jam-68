@tool

extends Node2D


@export var radius: float = 50.0:
	set(value):
		radius = value
		queue_redraw()

@export var thickness: float = 16.0:
	set(value):
		thickness = value
		queue_redraw()

@export var stroke_width: float = 4.0:
	set(value):
		stroke_width = value
		queue_redraw()

@export var fill_color: Color = Color.RED:
	set(value):
		fill_color = value
		queue_redraw()

@export var stroke_color: Color = Color.YELLOW:
	set(value):
		stroke_color = value
		queue_redraw()

@export var antialias: bool = true:
	set(value):
		antialias = value
		queue_redraw()

func _draw():
	draw_arc(Vector2(0, 0), radius, 0, TAU, roundi(radius), Color.YELLOW, thickness + stroke_width, antialias)
	draw_arc(Vector2(0, 0), radius, 0, TAU, roundi(radius), Color.RED, thickness, antialias)
