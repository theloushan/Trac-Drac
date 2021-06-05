extends KinematicBody2D

# Declare member variables here. Examples:
onready var animated_sprite = $charSprite
var act_pos
var charS_act

export (int) var speed = 200

var upper_bound = 0
var lower_bound = 0
var y_boundary = 0

var mouse_pos = Vector2()
var in_air = false
var sliding = false
var covering = false
var default_position = Vector2()

signal action(charS_act)

func set_animation():
	if in_air == true:
		animated_sprite.play("fly")
	elif sliding == true:
		animated_sprite.play("slide")
	elif covering == true:
		animated_sprite.play("cover")
	else: animated_sprite.play("run")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	act_pos = (get_viewport().get_mouse_position() - self.position)
	charS_act = act_pos.y / 100
	emit_signal("action", charS_act)
	set_animation()

func _input(event):
	mouse_pos = get_global_mouse_position()
	if event is InputEventKey:
		if event.is_pressed():
			if mouse_pos.y < upper_bound:
				in_air = true
				sliding = false
				covering = false
				position = Vector2(default_position.x, upper_bound)
			elif mouse_pos.y > lower_bound:
				in_air = false
				sliding = true
				covering = false
				position = Vector2(default_position.x, lower_bound + 100)
			elif mouse_pos.y > upper_bound and mouse_pos.y < lower_bound and covering == false:
				in_air = false
				sliding = false
				covering = true
				position = default_position
			else:
				in_air = false
				sliding = false
				covering = false
				position = default_position
			
			set_animation()

func _ready():
	default_position = position
	y_boundary = get_viewport().size.y / 3
	upper_bound = y_boundary
	lower_bound = y_boundary * 2
