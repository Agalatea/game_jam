extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String, "waste", "oldCar", "scrap") var background

export var letter_timeout= .005
export var text_to_show ="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper fermentum ornare. Ut nibh risus, porttitor quis ante ut, suscipit mattis orci. Proin sit amet risus libero. "
export var next_scene = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/BackgroundImage").set_background(background)
	$Button.hide()
	printText(text_to_show)
	
	pass # Replace with function body.


func printText(text):

	#create a timer to print text like a typewriter
	var t = Timer.new()
	t.set_wait_time(letter_timeout)
	t.set_one_shot(true)
	self.add_child(t)

	for letter in text:
		t.start()
		$RichTextLabel.add_text(letter)
		yield(t, "timeout")
	$Button.show()

func _on_Timer_for_next_scene_timeout():
	
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Levels/"+next_scene+".tscn")
	pass # Replace with function body.
