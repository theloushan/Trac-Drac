extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var path_follow = get_parent()

export (int) var speed = 150

func _physics_process(delta):
	MovementLoop(delta)

func MovementLoop(delta):
	path_follow.set_offset(path_follow.get_offset() + speed * delta)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
