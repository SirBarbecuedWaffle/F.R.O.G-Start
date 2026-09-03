extends Node2D
@onready var gpu_particles_2d_2: GPUParticles2D = $GPUParticles2D2
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var hack_detector: Area2D = $CharacterBody2D/Camera2D/hackDetector
@onready var hack_highlighter: Area2D = $CharacterBody2D/Camera2D/hackHighlighter
@onready var scanimator: AnimationPlayer = $CharacterBody2D/Camera2D/scanimator
@onready var hackables: Node2D = $CharacterBody2D/Camera2D/hackables
@onready var scanner_i: Node2D = $CharacterBody2D/Camera2D/scannerI

func _ready() -> void:
	await get_tree().create_timer(0.75).timeout
	gpu_particles_2d_2.emitting=false
	#parallax_2d_2.screen_offset.y=-62
	#parallax_2d_2.follow_viewport=true
	#parallax_2d_2.ignore_camera_scroll=false

#
#func _on_area_2d_body_exited(body: Node2D) -> void:
	#character_body_2d.disableShadow()


func _on_character_body_2d_hack_check() -> void:
	scanimator.play("scan")


func _on_hack_detector_area_entered(area: Area2D) -> void:
	hackables.add_child(area)
	print(hackables)
	
	


func _on_scanimator_animation_finished(anim_name: StringName) -> void:
	if hackables.get_children()==[]:
		pass
