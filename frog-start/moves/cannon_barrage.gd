extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_timer_timeout() -> void:
	animation_player.play("fadeOut")
	await get_tree().create_timer(0.6).timeout
	queue_free()
