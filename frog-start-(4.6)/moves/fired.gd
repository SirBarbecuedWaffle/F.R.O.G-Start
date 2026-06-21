extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $strikeProjectile
@onready var strike_projectile_2: damager = $strikeProjectile2

@onready var place: Area2D = $places/place
@onready var animated_sprite_2d: AnimatedSprite2D = $targe/AnimatedSprite2D


@onready var targets: Node2D = $targets

@onready var targe: Area2D = $targe

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	await get_tree().create_timer(0.1).timeout
	targe.global_position=place.global_position




func _on_targe_area_entered(area: Area2D) -> void:
	targe.audio_bus_override=true
	animated_sprite_2d.play("default")
	await get_tree().create_timer(1.3).timeout
	if randi_range(1,8)==1:
		await get_tree().create_timer(0.26).timeout
		strike_projectile.global_position=targe.global_position
		await get_tree().create_timer(2.0).timeout
		queue_free()
	else:
		strike_projectile_2.global_position=targe.global_position
		await get_tree().create_timer(2.0).timeout
		queue_free()
	
