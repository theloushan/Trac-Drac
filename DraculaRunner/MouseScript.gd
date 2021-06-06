extends KinematicBody2D


# Declare member variables here. Examples:
export (int) var speed = 200

var velocity = Vector2()
var target = Vector2()

onready var actionSprite = $actionSprite
var action_fly = preload("res://assets/imgs/sprites/fly4.png")
var action_cover = preload("res://assets/imgs/sprites/cover4.png")
var action_slide = preload("res://assets/imgs/sprites/slide5.png")
var action_idle = preload("res://assets/imgs/sprites/standing.png")

var upper_bound = 0
var lower_bound = 0
var y_boundary = 0

# Called when the node enters the scene tree for the first time.
func get_input():
	target = get_global_mouse_position()
	velocity = Vector2()

func set_texture():
	if target.y < upper_bound:
		actionSprite.texture = action_fly
	elif target.y > lower_bound:
		actionSprite.texture = action_slide
	elif target.y > upper_bound and target.y < lower_bound:
		actionSprite.texture = action_cover
	else:
		actionSprite.texture = action_idle

func get_boundaries():
	if y_boundary != get_viewport().size.y / 3:
		y_boundary = get_viewport().size.y / 3
		upper_bound = y_boundary
		lower_bound = y_boundary * 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	get_input()
	get_boundaries()
	set_texture()
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		#position = position.clamped(160)
		velocity = move_and_slide(velocity)

func _ready():
	get_boundaries()
