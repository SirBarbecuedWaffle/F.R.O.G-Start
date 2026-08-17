extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $strikeProjectile
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
@export var multiplier:=1.0
@export var slowSpd:=false

func _ready() -> void:
	strike_projectile.damage*=multiplier
	if slowSpd:
		strike_projectile.spdRev=11
	await get_tree().create_timer(0.3).timeout
	queue_free()

func _process(delta: float) -> void:
	pass




func _on_animated_sprite_2d_animation_finished() -> void:
	strike_projectile.global_position=area_2d.global_position
	
