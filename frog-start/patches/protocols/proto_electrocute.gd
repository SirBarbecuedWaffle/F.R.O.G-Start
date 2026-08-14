extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $strikeProjectile
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var multiplier:=1.0
@export var stunLength:=10
var type:=0
@onready var gpu_particles_2d_2: GPUParticles2D = $AnimatedSprite2D/GPUParticles2D2
@onready var gpu_particles_2d: GPUParticles2D = $AnimatedSprite2D/GPUParticles2D

func _ready() -> void:
	strike_projectile.damage*=multiplier
	strike_projectile.stun=stunLength
	if type==1:
		strike_projectile.burn+=100
		animated_sprite_2d.modulate=Color(18.892, 13.61, 0.0, 1.0)
	if type==2:
		var chance:=randi_range(1,20)
		if chance==1:
			strike_projectile.damage=99999
			animated_sprite_2d.modulate=Color(1.0, 0.0, 0.0, 1.0)
		else:
			strike_projectile.stun=0
			strike_projectile.burn+=25
			animated_sprite_2d.modulate=Color(0.0, 1.0, 1.0, 1.0)

func _process(delta: float) -> void:
	if animated_sprite_2d.frame==2 && type==2:
		if !gpu_particles_2d.emitting:
			gpu_particles_2d.emitting=true
			gpu_particles_2d_2.emitting=true
	if !area_2d.audio_bus_override:
		area_2d.global_position=places.get_children()[randi_range(0,4)].global_position
	if strike_projectile!=null:
		if animated_sprite_2d.frame==2:
			strike_projectile.global_position.x=animated_sprite_2d.global_position.x
			strike_projectile.global_position.y=animated_sprite_2d.global_position.y+325


func _on_strike_projectile_area_entered(area: Area2D) -> void:
	pass




func _on_animated_sprite_2d_animation_finished() -> void:
	await get_tree().create_timer(0.2).timeout
	queue_free()
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	area_2d.audio_bus_override=true
	animated_sprite_2d.global_position.x=area.global_position.x
	animated_sprite_2d.global_position.y=area.global_position.y-325
	animated_sprite_2d.play("default")

	
	
	

	
