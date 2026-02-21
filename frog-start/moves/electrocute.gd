extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $strikeProjectile
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if !area_2d.audio_bus_override:
		area_2d.global_position=places.get_children()[randi_range(0,3)].global_position
	if strike_projectile!=null:
		if animated_sprite_2d.frame==2:
			strike_projectile.global_position.x=animated_sprite_2d.global_position.x
			strike_projectile.global_position.y=animated_sprite_2d.global_position.y+325


func _on_strike_projectile_area_entered(area: Area2D) -> void:
	pass




func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	area_2d.audio_bus_override=true
	animated_sprite_2d.global_position.x=area.global_position.x
	animated_sprite_2d.global_position.y=area.global_position.y-325
	animated_sprite_2d.play("default")

	
	
	

	
