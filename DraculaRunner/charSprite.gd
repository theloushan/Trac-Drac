extends AnimatedSprite

# Declare member variables here. Examples:
onready var _animated_sprite = get_node('../charSprite')
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	if Input.is_action_pressed("ui_select") && mouse_pos.y > ((2/3) * get_viewport_rect().size.y):
		_animated_sprite.play("fly")
		
	elif Input.is_action_pressed("ui_select") && mouse_pos.y < ((1/3) * get_viewport_rect().size.y):
		_animated_sprite.play("slide")
		
	elif Input.is_action_pressed("ui_select") && mouse_pos.y > ((2/3) * get_viewport_rect().size.y) && mouse_pos.y < ((1/3) * get_viewport_rect().size.y):
		_animated_sprite.play("cover")
		
	else:
		_animated_sprite.play("run")
