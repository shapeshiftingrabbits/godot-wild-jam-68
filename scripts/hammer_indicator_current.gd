@tool

extends Node2D

@export var fill: Color = Color.BLACK:
	set(value):
		fill = value
		queue_redraw()

@export var radius: float = 50.0:
	set(value):
		radius = value
		queue_redraw()

@export var thickness: float = 24.0:
	set(value):
		thickness = value
		queue_redraw()

@export var antialias: bool = true:
	set(value):
		antialias = value
		queue_redraw()


func _process(_delta):
	queue_redraw()

func _draw():
	var width = TAU / 64

	draw_arc(Vector2(0, 0), radius, TAU - width / 2, TAU + width / 2, roundi(thickness), fill, thickness, antialias)
