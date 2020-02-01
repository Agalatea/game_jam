extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var held_object = null
var no_of_holes = 0 
func _ready():
	for node in get_tree().get_nodes_in_group("RobotElement"):
		node.connect("clicked", self, "_on_pickable_clicked")
	for node in get_tree().get_nodes_in_group("Holes"):
		no_of_holes +=1
	
	
	
func process():
#	for i in get_children():
#		print (i)
#		if i.is_in_group("Holes"):
#			if i.overlaps_body($RobotElement):
#				print("dupa")
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
			var taken_holes = 0
			for node in get_tree().get_nodes_in_group("Holes"):
				if node.taken :
					taken_holes +=1
			if taken_holes==no_of_holes:
				$LevelTimer.stop()
				for node in get_tree().get_nodes_in_group("RobotElement"):
					node.drop()
					node.input_pickable = false
				$HUD/Win.emit_signal("win")


func _on_LevelTimer_timeout():
	print ("stooooop")
	for node in get_tree().get_nodes_in_group("RobotElement"):
		node.drop()
		node.input_pickable = false
		$HUD/GameOver.emit_signal("game_over")
	pass # Replace with function body.
