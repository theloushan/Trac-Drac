extends Sprite


# Declare member variables here. Examples:
onready var _actionSprite = get_node('../actionSprite')
var action_fly = preload("res://assets/imgs/sprites/fly4.png")
var action_cover = preload("res://assets/imgs/sprites/cover4.png")
var action_slide = preload("res://assets/imgs/sprites/standing.png")

# Called when the node enters the scene tree for the first time.
func _process(_delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	if Input.is_action_pressed("ui_select") && mouse_pos.y > ((2/3) * get_viewport_rect().size.y):
		_actionSprite.texture = action_fly
		
	elif Input.is_action_pressed("ui_select") && mouse_pos.y < ((1/3) * get_viewport_rect().size.y):
		_actionSprite.texture = action_slide
		
	else:
		_actionSprite.texture = action_cover
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
