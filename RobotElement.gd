extends RigidBody2D


signal clicked
signal snap_it(robo_body, pos)
signal go_back(robo_body)

export var type = ""
var held = false
var activeArea=null
var body=null
var start_pos
var returning = false
export var return_speed = 2000

# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = position 
	body=self
	body.add_to_group("RobotElement")
	set_physics_process(true)
	match (type):
		"R1LeftHand":
			$AnimatedSprite.play("R1LeftHand")
		"R1RightHand":
			$AnimatedSprite.play("R1RightHand")
		"R1RightLeg":
			$AnimatedSprite.play("R1RightLeg")
		"R1LeftLeg":
			$AnimatedSprite.play("R1LeftLeg")
		"R1WrongPart1":
			$AnimatedSprite.play("R1WrongPart1")
		"R1WrongPart2":
			$AnimatedSprite.play("R1WrongPart2")
		"R1WrongPart3":
			$AnimatedSprite.play("R1WrongPart3")
		"R1GoodEar":
			$AnimatedSprite.play("R1GoodEar")
		"R1GoodEar2":
			$AnimatedSprite.play("R1GoodEar2")
		"R1GoodHeart":
			$AnimatedSprite.play("R1GoodHeart")
		"R1BadHeart1":
			$AnimatedSprite.play("R1BadHeart1")
		_:
			$AnimatedSprite.play("default")
#		8:
#			$AnimatedSprite.play("3")
	pass # Replace with function body.


func _process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
	if (returning and position != start_pos):
		print("go back marty")
#		print (self.get_path_to()get_pos().distance_to(start_pos))
		var targetVector = (position - start_pos).normalized()
		print (targetVector)
		set_linear_velocity(targetVector * return_speed * delta)
	if (returning and position == start_pos):
		returning = false
		gravity_scale = 0
		input_pickable = true

func _physics_process(delta):
	if activeArea!=null:
		if (body.get_global_pos().distance_to(activeArea.get_global_pos()) < 10):
			print("Do my stuff here!")

func pickup():
	if held:
		return
#	mode = 
	held = true

func drop():
	if held:
#		mode = RigidBody2D.MODE_RIGID
#		apply_central_impulse(impulse)
		held = false

func _on_RobotElement_input_event(_viewport, event, _shape_idx):
	#print ("hit")
	if event is InputEventMouseButton:
	#	print ("mouse")
		if event.button_index == BUTTON_LEFT and event.pressed:
#			print ("emit")
			emit_signal("clicked", self)
	
	pass # Replace with function body.


func _on_RobotElement_snap_it(robo_body, pos):
#	print ("snap sig")
	if(self.body == robo_body):
		held=false
		position = pos
		sleeping = true
		input_pickable = false
		$MATCH_SOUND.play()
	pass # Replace with function body.


func _on_RobotElement_go_back(robo_body):
	if(self.body == robo_body):
		position = start_pos
		held = false
		$GO_BACK_SOUND.play()
#		gravity_scale = 10
#		input_pickable = false
#		returning = true
