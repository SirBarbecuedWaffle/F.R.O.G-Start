extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var waitTime:=1.0
@export var moving:=true
@export var speed:=20
@onready var floor_detector: RayCast2D = $"floor detector"
@onready var walldetector: RayCast2D = $walldetector
var goingleft:=false
@onready var yellow_maker: AnimationPlayer = $YellowMaker
@onready var damager_3: Area2D = $Damager3
@onready var dash_col: CollisionShape2D = $hitBox/dashCol
@onready var damage_col: CollisionShape2D = $Damager3/damageCol
var heart=preload("res://2dPlatSection/healthpack.tscn")

func flipAndMove()->void:
	if moving:
		yellow_maker.play("yellow")
		scale.x*=-1
		dash_col.disabled=false
		moving=false
		goingleft=!goingleft
		velocity.x=0
		await get_tree().create_timer(waitTime).timeout
		if animated_sprite_2d.animation!="death":
			moving=true
			dash_col.disabled=true
			animated_sprite_2d.play("move")
			animated_sprite_2d.global_position.y-=2
	
func _process(delta: float) -> void:
	print(scale.x)
	if !floor_detector.is_colliding():
		flipAndMove()
	elif walldetector.is_colliding():
		flipAndMove()
	else:
		velocity.y+=9.8
		if moving:
			if goingleft:
				velocity.x=1*speed
			else:
				velocity.x=-1*speed
	move_and_slide()




func _on_animated_sprite_2d_animation_looped() -> void:
	if !moving && animated_sprite_2d.animation=="move":
		animated_sprite_2d.play("idle")
		animated_sprite_2d.global_position.y+=2


func _on_hit_box_area_entered(area: Area2D) -> void:
	animated_sprite_2d.play("death")
	yellow_maker.stop()
	modulate=Color(1.0, 1.0, 1.0, 1.0)
	z_index=5
	damager_3.global_position.y+=1000
	moving=false
	velocity.x=0
	await get_tree().create_timer(0.3).timeout
	var heartSpawn=heart.instantiate()
	heartSpawn.global_position=global_position
	heartSpawn.global_position.y-=40
	get_parent().add_child(heartSpawn)
	await get_tree().create_timer(0.4).timeout
	
	queue_free()
