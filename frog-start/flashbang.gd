extends Node2D
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var strike_projectile: damager = $strikeProjectile
@onready var strike_projectile_2: damager = $strikeProjectile2
@export var multiplier:=1.0

func _ready() -> void:
	strike_projectile.damage*=multiplier
	strike_projectile_2.damage*=multiplier
	await get_tree().create_timer(0.75).timeout
	strike_projectile.global_position.y+=2000
	strike_projectile_2.global_position.y+=2000

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
