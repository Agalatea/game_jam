extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func set_background(background):
	$"/root/BackgroundImage".play(background)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
