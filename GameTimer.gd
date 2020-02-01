extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var timer_total = 15
var sum =0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time=.01 * timer_total
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$CenterContainer/VBoxContainer/TextureProgress.value +=1
	if $CenterContainer/VBoxContainer/TextureProgress.value == 100:
		$Timer.stop()
	
