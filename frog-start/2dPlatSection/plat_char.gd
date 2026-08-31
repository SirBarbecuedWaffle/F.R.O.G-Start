extends CharacterBody2D
@export var gravity:=700
@export var speed:=150.0
@export var jumpStrength:=130.0
@export var MaxjumpStrength:=2600.0
@onready var coyote_time: Timer = $coyoteTime
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var curChar:=1
@export var dashStrength:=300.0
var direction:=0
var direction2:=0
var jumpTime:=0.0
var canJump:=false
var dashing:=false
var magic:=10.0
@export var maxMagic:=10.0
var dashTime:=0.0
@onready var mag_bar: Control = $magBar
@export var magicCount:=10.0
@onready var afterIm=preload("res://2dPlatSection/afterImDash.tscn")
@onready var jumpSp=preload("res://overworldPlayer/playerAssets/Ninja Frog/Jump (32x32).png")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var stamina_bar: StaminaBar = $magBar/StaminaBar
@onready var regen_mag: Timer = $regenMag

func _ready() -> void:
	stamina_bar.max_value=maxMagic
func _process(delta: float) -> void:
	stamina_bar.value=magic
	if !(magic<maxMagic):
		if mag_bar.modulate==Color(1.0, 1.0, 1.0, 1.0):
			var mTween=create_tween()
			mTween.tween_property(mag_bar,"modulate",Color(1.0, 1.0, 1.0, 0.0),0.25)
	else:
		if mag_bar.modulate==Color(1.0, 1.0, 1.0, 0.0):
			var mTween=create_tween()
			mTween.tween_property(mag_bar,"modulate",Color(1.0, 1.0, 1.0, 1.0),0.25)		
	if curChar==1:
		if magic>=7.5:
			stamina_bar.color=Color(18.892, 18.892, 0.0, 1.0)
		else:
			stamina_bar.color=Color(0.0, 1.0, 0.0, 1.0)
	if Input.is_action_just_released("up"):
		canJump=false
	
	
func _physics_process(delta: float) -> void:
	if !(regen_mag.time_left>0):
		if magic<maxMagic:
			magic+=(maxMagic/5*delta)+(5*delta)
		else:
			magic=maxMagic
			
	if not is_on_floor():
		if !dashing:
			velocity.y+=gravity*delta
			if velocity.y>500:
				velocity.y=500
	else:
		
		coyote_time.start(0.0)
	direction=Input.get_axis("left","right")
	direction2=Input.get_axis("up","down")
	if !dashing:
		velocity.x=lerp(velocity.x,direction*speed,0.3)
	else:
		dashTime+=delta
		if dashTime>0.05:
			dashTime=0
			var insta=afterIm.instantiate()
			if animated_sprite_2d.flip_h:
				insta.scale.x*=-1
			insta.global_position=global_position
			get_parent().add_child(insta)
	if direction!=0:
		animated_sprite_2d.flip_h=direction==-1
	if Input.is_action_just_pressed("space"):
		if curChar==1:
			if magic>=7.5 && !dashing:
				magic-=7.5
				regen_mag.start()
				var oldVelX:=velocity.x
				var oldVelY=velocity.y
				if oldVelY>0:
					velocity.y=0
				animation_player.play("dash")
				dashing=true
				var xVel=dashStrength*direction
				var yVel=dashStrength*direction2
				if xVel==0 && yVel==0:
					xVel=dashStrength
					if animated_sprite_2d.flip_h:
						xVel*=-1
				var xTween=create_tween()
				xTween.tween_property(self,"velocity",Vector2(xVel,yVel),0.1)
				await xTween.finished
				var xTween2=create_tween()
				xTween2.tween_property(self,"velocity",Vector2(oldVelX/2,0),0.3)
				await xTween2.finished
				dashing=false
					


	if canJump && Input.is_action_pressed("up") && !dashing:
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
		elif velocity.y<0 || dashing:
			animated_sprite_2d.play("jump")
	
	
	move_and_slide()
	
	
	
func jump(force : int) -> void:
	velocity.y=-force
