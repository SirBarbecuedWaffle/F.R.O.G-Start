extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $strikeProjectile
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D/AnimatedSprite2D2
@export var multiplier:=1.0
@export var defDown:=15


func _ready() -> void:
	strike_projectile.damage*=multiplier
	strike_projectile.defRev=defDown

func _process(delta: float) -> void:
	if !area_2d.audio_bus_override:
		area_2d.global_position=places.get_children()[randi_range(0,3)].global_position
	if strike_projectile!=null:
		if animated_sprite_2d.frame==7:
			strike_projectile.global_position=animated_sprite_2d.global_position


func _on_strike_projectile_area_entered(area: Area2D) -> void:
	pass




func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	area_2d.audio_bus_override=true
	animated_sprite_2d.global_position=area.global_position
	animated_sprite_2d.play("default")
	animated_sprite_2d_2.play("default")

	
	
	

	
