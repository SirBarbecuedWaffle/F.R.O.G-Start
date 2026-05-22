extends Node2D
@export var velocityX:=randf_range(900,1200)
@export var velocityY:=randf_range(-400,400)
var bounce:=randi_range(0,1)==1
@onready var strike_projectile_2: damager = $strikeProjectile2
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	scale*=randf_range(0.7,1.7)
	var tweent := create_tween()
	tweent.tween_property(self, "velocityX", 0.0, 3.0)
	global_position.y+=velocityY

func _process(delta: float) -> void:
	global_position.x-=velocityX*delta
	if velocityX==0:
		sprite_2d.play("pop")


func _on_sprite_2d_animation_finished() -> void:
	if sprite_2d.animation=="spawn":
		sprite_2d.play("idle")
	if sprite_2d.animation=="pop":
		queue_free()


func _on_strike_projectile_area_entered(area: Area2D) -> void:
	if area.collision_mask==8:
		sprite_2d.play("pop")
		velocityX=0
