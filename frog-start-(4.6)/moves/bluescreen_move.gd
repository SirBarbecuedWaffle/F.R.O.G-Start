extends Node2D
@onready var sprite_2d: Sprite2D = $CanvasLayer/Sprite2D
@onready var bomps: Node2D = $bomps

func _ready() -> void:
	bomps.global_position.y+=2000
	await get_tree().create_timer(randf_range(1.0,2.0)).timeout
	sprite_2d.visible=true
	await get_tree().create_timer(randf_range(1.0,2.0)).timeout
	sprite_2d.visible=false
	var bomts=bomps.get_children()
	for i in range(4):
		var f=randi_range(0,3)
		if f==0:
			bomts[i-1].global_position.y-=2000
	await get_tree().create_timer(0.1).timeout
	queue_free()
