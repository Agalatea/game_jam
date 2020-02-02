extends Node2D


export var next_scene =""


# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = 9
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Win_pressed():
	get_tree().change_scene("res://Levels/"+next_scene+".tscn")
	pass # Replace with function body.


func _on_HUD_end_game():
	pass # Replace with function body.
