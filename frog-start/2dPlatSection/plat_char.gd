extends CharacterBody2D
@export var gravity:=700
@export var speed:=150.0
@export var jumpStrength:=130.0
@export var MaxjumpStrength:=2600.0
@onready var coyote_time: Timer = $coyoteTime
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var direction:=0
var direction2:=0
var jumpTime:=0.0
var canJump:=false
func _process(delta: float) -> void:
	if Input.is_action_just_released("up"):
		canJump=false
	
	
func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y+=gravity*delta
		if velocity.y>500:
			velocity.y=500
	else:
		coyote_time.start(0.0)
	direction=Input.get_axis("left","right")
	direction2=Input.get_axis("up","down")
	velocity.x=lerp(velocity.x,direction*speed,0.3)
	if direction!=0:
		animated_sprite_2d.flip_h=direction==-1
	


	if canJump && Input.is_action_pressed("up"):
		jumpTime += delta
		if jumpTime<0.2:
			var t := jumpTime / 0.2
			var boost:=0.0
			boost=lerp(-1*MaxjumpStrength, 0.0, t) 
			velocity.y+=boost*delta
		#if jumpTime < 0.5:
			#velocity.y += -1*MaxjumpStrength * delta
		#else:
			#canJump=false
	
	if Input.is_action_pressed("up"):
		if coyote_time.time_left>0:
			velocity.y=-1*jumpStrength
			jumpTime=0.0
			coyote_time.stop()
			canJump=true
	
	if is_on_floor():
		if !(velocity.x<2 && velocity.x>-2):
			animated_sprite_2d.play("walking")
		else:
			animated_sprite_2d.play("idle")	
	else:
		if velocity.y>0:
			animated_sprite_2d.play("fall")
		elif velocity.y<0:
			animated_sprite_2d.play("jump")
	
	
	move_and_slide()
	
	
	
func jump(force : int) -> void:
	velocity.y=-force
