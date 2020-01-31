extends RigidBody2D


signal clicked

var held = false
var activeArea=null
var body=null

# Called when the node enters the scene tree for the first time.
func _ready():
	body=self
	body.add_to_group("RobotElement")
	set_physics_process(true)
	pass # Replace with function body.


func _process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()

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

func setActiveArea(area):
	activeArea=area
