extends Node2D

signal done

var index = 0
@onready var animation =  $AnimatedSprite2D.animation
@onready var nbOfSprites = $AnimatedSprite2D.sprite_frames.get_frame_count(animation)

func update_visible_sprite():
	iterate_over_animated_sprite()

func iterate_over_animated_sprite():
	index = clamp( index + 1, 0, nbOfSprites - 1)
	$AnimatedSprite2D.frame = index
	if (index == nbOfSprites - 1 ):
		done.emit()

func set_to_initial_state(spriteFrames: SpriteFrames):
	index = 0
	$AnimatedSprite2D.sprite_frames = spriteFrames
	$AnimatedSprite2D.frame = index
