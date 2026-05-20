extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $Node2D/strikeProjectile
@onready var strike_projectile_2: damager = $Node2D/strikeProjectile2
@onready var strike_projectile_3: damager = $Node2D/strikeProjectile3
@onready var node_2d: Node2D = $Node2D

@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
var curStrike=0
@export var multiplier:=1.0

func _ready() -> void:
	strike_projectile.damage*=multiplier
	strike_projectile_2.damage*=multiplier
	strike_projectile_3.damage*=multiplier

func _process(delta: float) -> void:
	if curStrike==0:
		if strike_projectile!=null:
			strike_projectile.global_position=places.get_children()[randi_range(0,3)].global_position
	if curStrike==1:
		if strike_projectile_2!=null:
			strike_projectile_2.global_position=places.get_children()[randi_range(0,3)].global_position
	if curStrike==2:
		if strike_projectile_3!=null:
			strike_projectile_3.global_position=places.get_children()[randi_range(0,3)].global_position


func _on_strike_projectile_area_entered(area: Area2D) -> void:
	if curStrike==0:
		strike_projectile.queue_free()
	if curStrike==1:
		strike_projectile_2.queue_free()
	if curStrike==2:
		strike_projectile_3.queue_free()
	await get_tree().create_timer(0.75).timeout	
	curStrike+=1
	if curStrike>2:
		queue_free()




func _on_animated_sprite_2d_animation_finished() -> void:
	strike_projectile.global_position=area_2d.global_position
	
