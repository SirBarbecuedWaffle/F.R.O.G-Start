extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $strikeProjectile
@onready var gpu_particles_2d: GPUParticles2D = $targe/GPUParticles2D
@onready var gpu_particles_2d_2: GPUParticles2D = $targe/GPUParticles2D2

@onready var targe: Area2D = $targe

func _ready() -> void:
	pass
		

func _process(delta: float) -> void:
	if !targe.audio_bus_override:
		targe.global_position=places.get_children()[randi_range(0,3)].global_position




func _on_targe_area_entered(area: Area2D) -> void:
	targe.audio_bus_override=true
	gpu_particles_2d.emitting=true
	gpu_particles_2d_2.emitting=true
	await get_tree().create_timer(1.0).timeout
	if randi_range(1,4)==1:
		strike_projectile.global_position=targe.global_position
	else:
		queue_free()
	
