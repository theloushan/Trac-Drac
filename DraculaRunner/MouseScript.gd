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

var act_pos
var actS_act

# Called when the node enters the scene tree for the first time.
func get_input():
	target = get_global_mouse_position()
	velocity = Vector2()
	
func _on_Character_action(charS_act):
	actS_act = charS_act
	set_texture(actS_act)

func set_texture(actS_act):
	if actS_act < -1:
		actionSprite.texture = action_fly
		
	elif actS_act > 1:
		actionSprite.texture = action_slide
		
	elif actS_act > -1 && actS_act < 1:
		actionSprite.texture = action_cover
		
	else:
		actionSprite.texture = action_idle


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	get_input()
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		#position = position.clamped(160)
		velocity = move_and_slide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:	
	get_parent().get_node("Character").connect("action", self, "_on_Character_action")
	
