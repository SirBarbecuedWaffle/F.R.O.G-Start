extends Node2D
@onready var gpu_particles_2d_2: GPUParticles2D = $GPUParticles2D2


func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	gpu_particles_2d_2.emitting=false
	#parallax_2d_2.screen_offset.y=-62
	#parallax_2d_2.follow_viewport=true
	#parallax_2d_2.ignore_camera_scroll=false
