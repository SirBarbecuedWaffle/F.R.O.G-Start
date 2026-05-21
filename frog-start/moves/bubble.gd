extends Node2D
@export var velocityY:=randf_range(1,5)
@export var velocityX:=randf_range(-250,300)
var bounce:=randi_range(0,1)==1
@onready var strike_projectile_2: damager = $strikeProjectile2
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	scale*=randf_range(0.7,1.7)
	var tween := create_tween()
	tween.tween_property(self, "velocityY", 0.0, 3.0)
	global_position.x+=velocityX

func _process(delta: float) -> void:
	#if bounce:
		#velocityX+=2*delta
		#if velocityX>velocityY:
			#bounce=false
	#else:
		#velocityX-=2*delta
		#if velocityX<-1*velocityY:
			#bounce=true
	
	global_position.y-=velocityY
	if sprite_2d.frame==89:
		if strike_projectile_2!=null:
			strike_projectile_2.global_position.y=sprite_2d.global_position.y


func _on_sprite_2d_animation_finished() -> void:
	queue_free()
