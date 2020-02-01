extends Node


var current_scene = null

func _ready():
		get_viewport().connect("size_changed", self, "on_window_resize")
		get_viewport().set_size_override ( true, Vector2( 1024, 600 ), Vector2( 0, 0 ) )
		
func on_window_resize():
	
	get_viewport().set_size_override ( true, Vector2( 1024, 600 ), Vector2( 0, 0 ) )
