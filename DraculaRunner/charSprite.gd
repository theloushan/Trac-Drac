extends KinematicBody2D

# Declare member variables here. Examples:
onready var animated_sprite = $charSprite
var act_pos
var charS_act

signal health

export (int) var speed = 200
export (int) var current_health = 4

var upper_bound = 0
var lower_bound = 0
var y_boundary = 0

var mouse_pos = Vector2()
var running = false
var default_position = Vector2()

var current_state = "run"

func set_animation():
	animated_sprite.play(current_state)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	set_animation()
	get_boundaries()

func _input(event):
	mouse_pos = get_global_mouse_position()
	if event is InputEventKey:
		if event.is_pressed():
			if mouse_pos.y < upper_bound:
				current_state = "fly"
				running = false
				position = Vector2(default_position.x, upper_bound)
				#print("flying")
			elif mouse_pos.y > lower_bound:
				current_state = "slide"
				running = false
				position = Vector2(default_position.x, lower_bound + 100)
				#print("sliding")
			elif mouse_pos.y > upper_bound and mouse_pos.y < lower_bound and running == false:
				current_state = "run"
				running = true
				position = default_position
				#print("running")
			else:
				current_state = "cover"
				running = false
				position = default_position
				#print("covering")
			
			set_animation()

func get_boundaries():
	if y_boundary != get_viewport().size.y / 3:
		y_boundary = get_viewport().size.y / 3
		upper_bound = y_boundary
		lower_bound = y_boundary * 2
		default_position.y = lower_bound + 10

func _ready():
	default_position = position
	get_boundaries()
	print("start")

func health_update():
	current_health = current_health - 1
	emit_signal("health", current_health)

func _on_Area2D_body_entered(body):
	#print("in sunlight, out of if")
	if body.is_in_group("sunlight") and current_state != "cover":
		health_update()
	
	if body.is_in_group("obstacle"):
		health_update()
	
	if body.is_in_group("finish"):
		get_tree().change_scene("res://winscreen.tscn")
		#probably want to have a YOU WIN screen show up with like "press any button to go to main menu" or something
		#will need to write code for this AFTER the main menu is built
	
	if current_health == 0:
		get_tree().change_scene("res://gameover.tscn")
		#some kind of GAME OVER or YOU LOSE screen, have button press send player back to main menu
		#will need to write code for this AFTER the main menu is built
