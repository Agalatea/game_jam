extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var held_object = null

func _ready():
	for node in get_tree().get_nodes_in_group("RobotElement"):
		node.connect("clicked", self, "_on_pickable_clicked")
	pass
func _on_pickable_clicked(object):
	if !held_object:
		held_object = object
		held_object.pickup()
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop()
			held_object = null
