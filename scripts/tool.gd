extends Node2D

signal done

@export var title: String
@export var description: String

var index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_visible_sprite():
	iterate_over_animated_sprite()

func iterate_over_animated_sprite():
	var animation =  $AnimatedSprite2D.animation
	var nbOfSprites = $AnimatedSprite2D.sprite_frames.get_frame_count(animation)
	index = clamp( index + 1, 0, nbOfSprites - 1)
	$AnimatedSprite2D.frame = index
	if (index == nbOfSprites - 1 ):
		done.emit()

