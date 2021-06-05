extends KinematicBody2D

# Declare member variables here. Examples:
onready var animated_sprite = $charSprite
var act_pos
var charS_act

signal action(charS_act)

func set_animation(charS_act):
	if Input.is_action_pressed("ui_select") && charS_act < -1:
		animated_sprite.play("fly")
		
	elif Input.is_action_pressed("ui_select") && charS_act > 1:
		animated_sprite.play("slide")
		
	elif Input.is_action_pressed("ui_select") && charS_act > -1 && charS_act < 1 :
		animated_sprite.play("cover")
		
	else:
		animated_sprite.play("run")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	act_pos = (get_viewport().get_mouse_position() - self.position)
	charS_act = act_pos.y / 100
	emit_signal("action", charS_act)
	set_animation(charS_act)
	
