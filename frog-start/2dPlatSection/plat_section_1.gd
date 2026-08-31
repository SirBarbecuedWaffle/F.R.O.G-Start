extends Node2D


func _ready() -> void:
	await get_tree().create_timer(0.01).timeout
	#parallax_2d_2.screen_offset.y=-62
	#parallax_2d_2.follow_viewport=true
	#parallax_2d_2.ignore_camera_scroll=false
