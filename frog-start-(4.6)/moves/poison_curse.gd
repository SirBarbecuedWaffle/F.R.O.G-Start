extends Node2D
@onready var strike_projectile: damager = $strikeProjectile
var strikeVel:=30.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	strikeVel*=1.025
	strike_projectile.global_position.x-=strikeVel*delta
	if strike_projectile.global_position.x<-500:
		queue_free()
