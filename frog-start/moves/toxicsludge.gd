extends Node2D

@onready var gpu_particles_2d_2: GPUParticles2D = $GPUParticles2D2
@onready var gpu_particles_2d_3: GPUParticles2D = $GPUParticles2D3
@onready var strike_projectile: damager = $damage/strikeProjectile
@onready var damage: Node2D = $damage
@onready var animation_player: AnimationPlayer = $bomb/AnimationPlayer
@onready var bomb: Node2D = $bomb
@export var multiplier:=1.0
var bubbleCount:=40

var bubbleInst:=preload("res://moves/bubble.tscn")

func spawnBubble()->void:
	if bubbleCount>0:
		var bubble=bubbleInst.instantiate()
		bomb.add_child(bubble)
		bubbleCount-=1
		await get_tree().create_timer(0.15).timeout
		spawnBubble()
	else:
		await get_tree().create_timer(3.0).timeout
		queue_free()

func _ready() -> void:
	spawnBubble()
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	gpu_particles_2d_2.emitting=true
	gpu_particles_2d_3.emitting=true
	damage.position.y=0
	await get_tree().create_timer(1.0).timeout
	queue_free()
