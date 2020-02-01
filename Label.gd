extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Label_game_over():
	show()
	pass # Replace with function body.


func _on_Win_win():
	pass # Replace with function body.
