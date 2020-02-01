extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var type = 1
var taken = false
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Holes")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Hole_body_entered(body):
	if body.is_in_group ("RobotElement"):
		if (body.type == self.type and taken == false):
#			print("match")
#			body.snapper(body, position)
			taken = true
			body.emit_signal("snap_it", body, position)
		else:
			body.emit_signal("go_back", body)
#	body.get_parent().setActiveArea(self)

