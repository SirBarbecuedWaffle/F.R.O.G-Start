extends Node2D
var cycles:=2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var strike_projectile: damager = $strikeProjectile


func _ready() -> void:
	await get_tree().create_timer(2.0).timeout
	animated_sprite_2d.play("default")
	animation_player.play("flip")
func _process(delta: float) -> void:
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	if cycles>0:
		cycles-=1
		animated_sprite_2d.play("default")
	else:
		if randi_range(1,2)==1:
			animated_sprite_2d.play("heads")
			await get_tree().create_timer(0.3).timeout
			strike_projectile.global_position.y=520
			await get_tree().create_timer(0.7).timeout
			cycles=2
			animated_sprite_2d.play("default")
			strike_projectile.global_position.y=-665
			animation_player.play("flip")
		else:
			animated_sprite_2d.play("tails")
			await get_tree().create_timer(1.0).timeout
			animation_player.play("fadeOut")
			await get_tree().create_timer(0.5).timeout
			queue_free()
