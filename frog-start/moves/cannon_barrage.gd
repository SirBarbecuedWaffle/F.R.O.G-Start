extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var animated_sprite_2d_3: AnimatedSprite2D = $AnimatedSprite2D3
@export var multiplier:=1.0
func _ready() -> void:
	animated_sprite_2d.damageMulti=multiplier
	animated_sprite_2d_2.damageMulti=multiplier
	animated_sprite_2d_3.damageMulti=multiplier

func _on_timer_timeout() -> void:
	animation_player.play("fadeOut")
	await get_tree().create_timer(0.6).timeout
	queue_free()
