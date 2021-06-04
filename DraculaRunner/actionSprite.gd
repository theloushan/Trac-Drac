extends Sprite


# Declare member variables here. Examples:
onready var _actionSprite = get_node('../actionSprite')
var action_fly = preload("res://assets/imgs/sprites/fly4.png")
var action_cover = preload("res://assets/imgs/sprites/cover4.png")
var action_slide = preload("res://assets/imgs/sprites/slide5.png")
var action_idle = preload("res://assets/imgs/sprites/standing.png")

var act_pos
var actS_act
#var t=0

# Called when the node enters the scene tree for the first time.
func _process(_delta: float) -> void:
	act_pos = (get_viewport().get_mouse_position() - self.position)
	actS_act = act_pos.y / 100 / 3
	
	#t+=1
	#if t == 60:
	#	print(actS_act)
	#	t=0	
	
	if actS_act < 1:
		_actionSprite.texture = action_fly
		
	elif actS_act > 2:
		_actionSprite.texture = action_slide
		
	elif actS_act > 1 && actS_act < 2:
		_actionSprite.texture = action_cover
		
	else:
		_actionSprite.texture = action_idle


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
