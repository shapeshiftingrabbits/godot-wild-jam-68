extends Node2D

@onready var sprites = [$Sprite2D, $Sprite2D2,$Sprite2D3]
var index = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	for sprite in sprites:
		sprite.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_visible_sprite():
	iterate_over_animated_sprite()

func iterate_over_sprite_array():
	for sprite in sprites:
		sprite.hide()
	sprites[index].show()
	var nbOfSprites = sprites.size()
	index = (index + 1)% nbOfSprites
	
func iterate_over_animated_sprite():
	var animation =  $AnimatedSprite2D.animation
	var nbOfSprites = $AnimatedSprite2D.sprite_frames.get_frame_count(animation)
	index = (index + 1)% nbOfSprites
	$AnimatedSprite2D.frame = index
	
