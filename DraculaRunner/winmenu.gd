extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var _animated_sprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_menu_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_exit_pressed():
	get_tree().quit()

#func _on_KinematicBody2D_ready():
#	_animated_sprite.play("default")
### Couldn't get the sprites to play ran out of time
