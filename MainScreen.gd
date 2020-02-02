extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/BackgroundImage".set_background("waste")
	if $"/root/BGM".playing == false:
		$"/root/BGM".playing = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Levels/Level1Text.tscn")
	pass # Replace with function body.


func _on_Button2_pressed():
	get_tree().change_scene("res://Credits.tscn")
	pass # Replace with function body.
