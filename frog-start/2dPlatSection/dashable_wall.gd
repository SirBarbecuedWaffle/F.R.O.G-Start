extends Node2D
@onready var tile_map_layer: TileMapLayer = $TileMapLayer

signal breakWall
@onready var animation_player: AnimationPlayer = $AnimationPlayer





func _on_area_2d_area_entered(area: Area2D) -> void:
	if tile_map_layer.collision_enabled:
		area.get_parent().magic=area.get_parent().maxMagic-0.1
		animation_player.play("break")
		tile_map_layer.collision_enabled=false
		await get_tree().create_timer(5.0).timeout
		animation_player.play_backwards("break")
		tile_map_layer.collision_enabled=true
