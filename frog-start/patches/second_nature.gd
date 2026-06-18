extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $strikeProjectile
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
@export var multiplier:=1.0
@export var char:=""

func _ready() -> void:
	if char=="frog":
		strike_projectile.damage+=10
	if char=="steve":
		strike_projectile.poison=strike_projectile.damage
		strike_projectile.damage*=0.5
	if char=="mask":
		strike_projectile.strRev=7
	if char=="pink":
		strike_projectile.burn=strike_projectile.damage*2.5
		strike_projectile.damage=0
	if char=="robot":
		strike_projectile.burn=strike_projectile.damage*0.25
		strike_projectile.stun=1
		strike_projectile.spdRev=3
	if char=="joe":
		strike_projectile.burn=strike_projectile.damage*2
		strike_projectile.damage=0
		strike_projectile.defRev=3
	if char=="fox":
		strike_projectile.damage=randi_range(strike_projectile.damage-5,strike_projectile.damage*3)
	if char=="lizard":
		strike_projectile.poison=strike_projectile.damage
		strike_projectile.burn=strike_projectile.damage
	if char=="barrel":
		strike_projectile.damage*=0.75
		strike_projectile.regen=10
		strike_projectile.spdRev=4
		strike_projectile.defRev=4
		strike_projectile.strRev=4
		
func _process(delta: float) -> void:
	strike_projectile.global_position=places.get_children()[randi_range(0,3)].global_position


func _on_strike_projectile_area_entered(area: Area2D) -> void:
	queue_free()




func _on_animated_sprite_2d_animation_finished() -> void:
	strike_projectile.global_position=area_2d.global_position
	
