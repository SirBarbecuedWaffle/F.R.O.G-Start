extends Node2D
@onready var places: Node2D = $places
@onready var strike_projectile: damager = $Node2D/strikeProjectile
@onready var strike_projectile_2: damager = $Node2D/strikeProjectile2
@onready var strike_projectile_3: damager = $Node2D/strikeProjectile3
@onready var node_2d: Node2D = $Node2D

@onready var sl_1: AnimatedSprite2D = $sl1
@onready var sl_2: AnimatedSprite2D = $sl2
@onready var sl_3: AnimatedSprite2D = $sl3
@onready var trigger: Area2D = $trigger

@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
var curStrike=0
@export var multiplier:=1.0

func _ready() -> void:
	strike_projectile.damage*=multiplier
	strike_projectile_2.damage*=multiplier
	strike_projectile_3.damage*=multiplier
	findTarg()

func findTarg()->void:
	if curStrike%2==0 && trigger!=null:
		trigger.global_position=places.get_children()[randi_range(0,3)].global_position
		await get_tree().create_timer(0.05).timeout
		findTarg()
			

func _process(delta: float) -> void:
	if strike_projectile!=null:	
		if sl_1.frame==2:
			strike_projectile.global_position.x=sl_1.global_position.x-13
			strike_projectile.global_position.y=sl_1.global_position.y-104
	
	if strike_projectile_2!=null:	
		if sl_2.frame==2:
			strike_projectile_2.global_position.x=sl_2.global_position.x-13
			strike_projectile_2.global_position.y=sl_2.global_position.y-104
	
	if strike_projectile_3!=null:	
		if sl_3.frame==7:
			strike_projectile_3.global_position.x=sl_3.global_position.x+53
			strike_projectile_3.global_position.y=sl_3.global_position.y-126
	
	



func _on_strike_projectle_area_entered(area: Area2D) -> void:
	pass


	


func _on_sl_1_animation_finished() -> void:	
	await get_tree().create_timer(0.4).timeout
	curStrike+=1
	findTarg()
	if curStrike>5:
		await get_tree().create_timer(1.35).timeout	
		queue_free()


func _on_trigger_area_entered(area: Area2D) -> void:
	if curStrike==0:
		sl_1.global_position.x=trigger.global_position.x+13
		sl_1.global_position.y=trigger.global_position.y+104
		sl_1.play("default")
		curStrike+=1
	if curStrike==2:
		sl_2.global_position.x=trigger.global_position.x+13
		sl_2.global_position.y=trigger.global_position.y+104
		sl_2.play("default")
		curStrike+=1
	if curStrike==4:
		sl_3.global_position.x=trigger.global_position.x-53
		sl_3.global_position.y=trigger.global_position.y+104
		sl_3.play("default")
		curStrike+=1
		trigger.queue_free()
