extends Node2D

@onready var gpu_particles_2d_2: GPUParticles2D = $GPUParticles2D2
@onready var gpu_particles_2d_3: GPUParticles2D = $GPUParticles2D3
@onready var strike_projectile: damager = $strikeProjectile
@onready var damage: Node2D = $damage
@onready var animation_player: AnimationPlayer = $bomb/AnimationPlayer
@onready var bomb: Node2D = $bomb

func _ready() -> void:
	await get_tree().create_timer(randf_range(0,1.5)).timeout
	animation_player.play("explode")
	await get_tree().create_timer(0.3).timeout
	visible=true
	bomb.visible=true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	gpu_particles_2d_2.emitting=true
	gpu_particles_2d_3.emitting=true
	damage.position.y=0
	await get_tree().create_timer(1.0).timeout
	queue_free()
