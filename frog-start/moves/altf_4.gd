extends Node2D
@onready var places: Node2D = $places
@onready var gpu_particles_2d: GPUParticles2D = $targe/GPUParticles2D
@onready var gpu_particles_2d_2: GPUParticles2D = $targe/GPUParticles2D2
@onready var place_1: Area2D = $places/place1
@onready var place_2: Area2D = $places/place2
@onready var place_3: Area2D = $places/place3
@onready var place_4: Area2D = $places/place4
@onready var targets: Node2D = $targets
@onready var strike_projectile: damager = $strikeProjectile

@onready var targe: Area2D = $targe

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	await get_tree().create_timer(0.1).timeout
	if targets.get_children()==[]:
		for i in places.get_children():
			if i.audio_bus_override:
				var targNew:=Marker2D.new()
				targNew.global_position=i.global_position
				targets.add_child(targNew)
	if !targe.audio_bus_override:
		if targets.get_children().size()!=0:
			targe.global_position=targets.get_children()[randi_range(0,targets.get_children().size()-1)].global_position
		else:
			targe.visible=false




func _on_targe_area_entered(area: Area2D) -> void:
	targe.audio_bus_override=true
	gpu_particles_2d.emitting=true
	gpu_particles_2d_2.emitting=true
	await get_tree().create_timer(1.0).timeout
	if randi_range(1,5)==1:
		await get_tree().create_timer(0.26).timeout
		if strike_projectile!=null:
			strike_projectile.global_position=targe.global_position
		await get_tree().create_timer(2.0).timeout
		queue_free()
	else:
		await get_tree().create_timer(2.0).timeout
		queue_free()
	


func _on_place_1_area_entered(area: Area2D) -> void:
	place_1.audio_bus_override=true


func _on_place_2_area_entered(area: Area2D) -> void:
	place_2.audio_bus_override=true


func _on_place_3_area_entered(area: Area2D) -> void:
	place_3.audio_bus_override=true


func _on_place_4_area_entered(area: Area2D) -> void:
	place_4.audio_bus_override=true
