extends AnimatedSprite

# Declare member variables here. Examples:
onready var _animated_sprite = get_node('../charSprite')
var act_pos
var charS_act
var t = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	act_pos = (get_viewport().get_mouse_position() - self.position)
	charS_act = act_pos.y / 100
	
	#t+=1
	#if t == 60:
	#	print(charS_act)
	#	t=0
	
	
	if Input.is_action_pressed("ui_select") && charS_act < 3:
		_animated_sprite.play("fly")
		
	elif Input.is_action_pressed("ui_select") && charS_act > 6:
		_animated_sprite.play("slide")
		
	elif Input.is_action_pressed("ui_select") && charS_act < 6 && charS_act > 3 :
		_animated_sprite.play("cover")
		
	else:
		_animated_sprite.play("run")
