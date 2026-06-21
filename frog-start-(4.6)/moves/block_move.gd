extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $strikeProjectile

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if get_children()==[]:
		queue_free()
