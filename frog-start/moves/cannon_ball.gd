extends Node2D

func _process(delta: float) -> void:
	global_position.x-=2000*delta

func _on_strike_projectile_area_entered(area: Area2D) -> void:
	queue_free()
