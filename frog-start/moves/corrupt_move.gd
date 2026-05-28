extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $strikeProjectile
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
@onready var timer: Timer = $Timer
var hits=400

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_strike_projectile_area_entered(area: Area2D) -> void:
	hits-=1
	if hits<0:
		queue_free()




func _on_animated_sprite_2d_animation_finished() -> void:
	strike_projectile.global_position=area_2d.global_position
	


func _on_timer_timeout() -> void:
	strike_projectile.global_position=places.get_children()[randi_range(0,3)].global_position
	strike_projectile.damage=randi_range(1,4)
