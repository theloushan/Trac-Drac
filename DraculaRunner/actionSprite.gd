extends Sprite


# Declare member variables here. Examples:
onready var actionSprite = $actionSprite
var action_fly = preload("res://assets/imgs/sprites/fly4.png")
var action_cover = preload("res://assets/imgs/sprites/cover4.png")
var action_slide = preload("res://assets/imgs/sprites/slide5.png")
var action_idle = preload("res://assets/imgs/sprites/standing.png")

var act_pos
var actS_act
var t=0

func _on_charSprite_action(charS_act):
	actS_act = charS_act
	print(actS_act, "Act")

func set_texture(actS_act):
	if actS_act < 1:
		actionSprite.texture = action_fly
		if t == 60:
			print(actS_act, "Fly")
	
		
	elif actS_act > 2:
		actionSprite.texture = action_slide
		
		if t == 60:
			print(actS_act, "Slide")
	
		
	elif actS_act > 1 && actS_act < 2:
		actionSprite.texture = action_cover
		
		if t == 60:
			print(actS_act, "Cover")
	
		
	else:
		actionSprite.texture = action_idle
		
		if t == 60:
			print(actS_act, "idle")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:	
	t+=1
	if t == 60:
		print(actS_act, "actS")
		t=0	
	
	get_parent().connect("action", self, "set_texture")
	




