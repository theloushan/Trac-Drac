extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var upper_bound = 200
export (int) var lower_bound = 400
export (int) var speed = 200

var mouse_pos = Vector2()
var in_air = false
var sliding = false
var default_position = Vector2()
#var current_position = Vector2()

func _input(event):
	mouse_pos = get_global_mouse_position()
	if event is InputEventKey:
		if event.is_pressed():
			if mouse_pos.y < upper_bound:
				in_air = true
				sliding = false
				position = Vector2(default_position.x, upper_bound)
				#current_position = position
			elif mouse_pos.y > lower_bound:
				in_air = false
				sliding = true
				position = Vector2(default_position.x, lower_bound + 100)
				#current_position = position
			else:
				in_air = false
				sliding = false
				position = default_position
				#current_position = default_position


# Called when the node enters the scene tree for the first time.
func _ready():
	default_position = position
	#current_position = default_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(_delta):
#	pass
