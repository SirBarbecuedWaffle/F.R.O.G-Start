extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $strikeProjectile

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	strike_projectile.global_position=places.get_children()[randi_range(0,3)].global_position


func _on_strike_projectile_area_entered(area: Area2D) -> void:
	queue_free()
