extends Node2D
@onready var mass_stun: damager = $massStun

@onready var arrow_barrage_2: Node2D = $arrowBarrage2

func _ready() -> void:
	await get_tree().create_timer(2.2).timeout
	mass_stun.global_position.y-=2000
	await get_tree().create_timer(3.2).timeout
	queue_free()
