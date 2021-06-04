extends HBoxContainer

# Declare member variables here. Examples:
var t = 0

var health_healthy = preload("res://assets/imgs/health/Dracula Health - Healthy.png")

var health_burn1 = preload("res://assets/imgs/health/Dracula Health - Sun1.png")
var health_burn2 = preload("res://assets/imgs/health/Dracula Health - Sun2.png")
var health_burn3 = preload("res://assets/imgs/health/Dracula Health - Sun3.png")

var health_bump1 = preload("res://assets/imgs/health/Dracula Health - Bump1.png")
var health_bump2 = preload("res://assets/imgs/health/Dracula Health - Bump2.png")
var health_bump3 = preload("res://assets/imgs/health/Dracula Health - Bump3.png")

#functions
func update_health(value):
	for i in get_child_count():
		if value == 4:
			get_child(i).texture = health_healthy
		elif value == 3:
			get_child(i).texture = health_bump1
		elif value == 2:
			get_child(i).texture = health_bump2
		elif value == 1:
			get_child(i).texture = health_bump3
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	t +=1
	if t == 75:
		for i in get_child_count():
			if get_child(i).rect_rotation == 0:
				get_child(i).rect_rotation = 15
			else:
				get_child(i).rect_rotation = 0
		t = 0
