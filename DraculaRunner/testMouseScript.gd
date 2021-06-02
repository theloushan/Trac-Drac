extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speed = 200

var velocity = Vector2()
var target = Vector2()

func get_input():
	target = get_global_mouse_position()
	velocity = Vector2()

func _physics_process(_delta):
	get_input()
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		#position = position.clamped(160)
		velocity = move_and_slide(velocity)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
