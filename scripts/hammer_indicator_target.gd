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

@export var difficulty: int = 6:
	set(value):
		difficulty = value
		queue_redraw()

func _draw():
	var width = TAU / difficulty

	draw_arc(Vector2(0, 0), radius, TAU - (width / 2), TAU + width / 2, roundi(radius), fill_color, thickness, antialias)
