extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hole_body_entered(body):
#	if body.is_in_group ("RobotElement"):
	print ("entered")
	body.get_parent().setActiveArea(self)


func _on_Hole_area_shape_entered(area_id, area, area_shape, self_shape):
	print ("entered shape")
#	body.get_parent().setActiveArea(self)


func _on_Hole_body_shape_entered(body_id, body, body_shape, area_shape):
	print ("_on_Hole_body_shape_entered")
	body.get_parent().setActiveArea(self)


func _on_Hole_area_entered(area):
	print ("_on_Hole_area_entered")
