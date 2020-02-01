extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal win
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Win_win():
	show()
	pass # Replace with function body.


func _on_Win_pressed():
	get_tree().change_scene("res://MainScreen.tscn")
	pass # Replace with function body.
