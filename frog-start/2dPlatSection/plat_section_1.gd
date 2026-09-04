extends Node2D
@onready var gpu_particles_2d_2: GPUParticles2D = $GPUParticles2D2
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var hack_detector: Area2D = $CharacterBody2D/Camera2D/hackDetector
@onready var hack_highlighter: Area2D = $CharacterBody2D/Camera2D/hackHighlighter
@onready var scanimator: AnimationPlayer = $CharacterBody2D/Camera2D/scanimator
@onready var hackables: Node2D = $CharacterBody2D/Camera2D/hackables
@onready var scanner_i: Node2D = $CharacterBody2D/Camera2D/scannerI
var hackTrigs=[]
var selected;
@onready var hack_space: Area2D = $CharacterBody2D/Camera2D/hackHighlighter/hackSpace


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		if hackTrigs!=[]:
			hack_space.position.y=0
	if Input.is_action_just_released("space"):
		if hackTrigs!=[]:
			hack_space.position.y=-5000
	
	if Input.is_action_just_pressed("left"):
		if hackTrigs.size()>1:
			var smlosest=hackTrigs[1]
			if smlosest==selected:
				smlosest=hackTrigs[0]
				print("WAZTHESAME")
			for f in hackTrigs:
				if f!=selected:
					if f.global_position.x<selected.global_position.x:
						if (selected.global_position.distance_to(f.global_position))<(selected.global_position.distance_to(smlosest.global_position)):
							print("CHABGEWD")
							smlosest=selected
			if smlosest==null:
				smlosest=hackTrigs[0]
				print("WAZTHESAME")
			if smlosest!=null:
				selected=smlosest
		if selected!=null && hackTrigs!=[]:
			hack_highlighter.global_position=selected.global_position

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
	if area is hackTrigger:
		hackTrigs.append(area)

	
	
	


func _on_scanimator_animation_finished(anim_name: StringName) -> void:
	if hackTrigs!=[]:
		character_body_2d.confirmScan()
		await get_tree().create_timer(0.25).timeout
		var closest=hackTrigs[0]
		for i in hackTrigs:
			if i.global_position.distance_to(character_body_2d.global_position)<closest.global_position.distance_to(character_body_2d.global_position):
				closest=i
		hack_highlighter.global_position=closest.global_position
		selected=closest
	else:
		character_body_2d.failScan()
