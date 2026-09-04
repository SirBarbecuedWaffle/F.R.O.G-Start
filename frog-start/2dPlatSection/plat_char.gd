extends CharacterBody2D
@export var gravity:=700
@export var speed:=150.0
@export var jumpStrength:=130.0
@export var MaxjumpStrength:=2600.0
@export var push_force:=20
@onready var coyote_time: Timer = $coyoteTime
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
signal hackCheck

@onready var frog_anim: AnimatedSprite2D = $collisionbox/frogAnim
@onready var steve_anim: AnimatedSprite2D = $collisionbox/steveAnim
@onready var mask_anim: AnimatedSprite2D = $collisionbox/maskAnim
@onready var hood_anim: AnimatedSprite2D = $collisionbox/hoodAnim
@onready var robot_anim: AnimatedSprite2D = $collisionbox/robotAnim
@onready var joe_anim: AnimatedSprite2D = $collisionbox/joeAnim
@onready var fox_anim: AnimatedSprite2D = $collisionbox/foxAnim
@onready var lizard_anim: AnimatedSprite2D = $collisionbox/lizardAnim
@onready var barrel_anim: AnimatedSprite2D = $collisionbox/barrelAnim
@onready var shadow_char: CharacterBody2D = $shadowChar


@export var curChar:=1
@export var dashStrength:=300.0
var direction:=0
var direction2:=0
var jumpTime:=0.0
var canJump:=false
var dashing:=false
var scanning:=false
var magic:=10.0
var ghosting:=false
var frozen:=false
var changed:=false
@export var maxMagic:=10.0
var changeChar:=0
var dashTime:=0.0
@onready var mag_bar: Control = $magBar
@export var magicCount:=10.0
@onready var afterIm=preload("res://2dPlatSection/afterImDash.tscn")
@onready var jumpSp=preload("res://overworldPlayer/playerAssets/Ninja Frog/Jump (32x32).png")
@onready var frogF=preload("res://2dPlatSection/frogFrames.tres")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var stamina_bar: StaminaBar = $magBar/StaminaBar
@onready var regen_mag: Timer = $regenMag
@onready var open_animator: AnimationPlayer = $transitionAnim/openAnimator
@onready var close_animator: AnimationPlayer = $transitionAnim/closeAnimator
@onready var control_3: Control = $transitionAnim/Control3
@onready var color_rect: ColorRect = $transitionAnim/ColorRect

func _ready() -> void:
	#for f in CManager.charUnlocked:
		#maxMagic+=f*2.5
	stamina_bar.max_value=maxMagic
	magic=maxMagic
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
			stamina_bar.color=Color(0.333, 1.0, 0.0, 1.0)
	if curChar==3:
		if magic>=2.5:
			stamina_bar.color=Color(10.863, 0.0, 18.892, 1.0)
		else:
			stamina_bar.color=Color(0.333, 1.0, 0.0, 1.0)
	if Input.is_action_just_released("up"):
		canJump=false
	
func swapChars(charNum : int)->void:
	if curChar==1:
		close_animator.play_backwards("frog")
	if curChar==2:
		close_animator.play_backwards("steve")
	if curChar==3:
		close_animator.play_backwards("mask")
	if curChar==4:
		close_animator.play_backwards("hood")
	if curChar==5:
		close_animator.play_backwards("robot")
	if curChar==6:
		close_animator.play_backwards("joe")
	if curChar==7:
		close_animator.play_backwards("fox")
	if curChar==8:
		close_animator.play_backwards("lizard")
	if curChar==9:
		close_animator.play_backwards("barrel")
	
	
	changeChar=charNum
	
func confirmScan()->void:
	steve_anim.play("search")

func failScan()->void:
	steve_anim.play("idle")
	scanning=false
	frozen=false
	
func _physics_process(delta: float) -> void:
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is RigidBody2D:
			collision.get_collider().apply_central_impulse(-collision.get_normal() * push_force)
	if steve_anim.animation!=frog_anim.animation && !scanning:
		steve_anim.animation=frog_anim.animation
	if mask_anim.animation!=frog_anim.animation:
		mask_anim.animation=frog_anim.animation
	if hood_anim.animation!=frog_anim.animation:
		hood_anim.animation=frog_anim.animation
	if robot_anim.animation!=frog_anim.animation:
		robot_anim.animation=frog_anim.animation
	if joe_anim.animation!=frog_anim.animation:
		joe_anim.animation=frog_anim.animation
	if fox_anim.animation!=frog_anim.animation:
		fox_anim.animation=frog_anim.animation
	if lizard_anim.animation!=frog_anim.animation:
		lizard_anim.animation=frog_anim.animation
	if barrel_anim.animation!=frog_anim.animation:
		barrel_anim.animation=frog_anim.animation
	if !(regen_mag.time_left>0):
		if !ghosting:
			if magic<maxMagic:
				magic+=(maxMagic/5*delta)+(5*delta)
			else:
				magic=maxMagic
		else:
			if magic>0:
				magic-=(2.5*delta)
			else:
				var flippe=shadow_char.deactivate()
				animation_player.play("fade")
				await get_tree().create_timer(0.1).timeout
				global_position=shadow_char.global_position
				animation_player.play("RESET")
				frog_anim.flip_h=flippe
				frozen=false
				ghosting=false
				mask_anim.play("idle")
				regen_mag.start()
			
	if not is_on_floor():
		if !dashing:
			velocity.y+=gravity*delta
			if velocity.y>500:
				velocity.y=500
	else:
		
		coyote_time.start(0.0)
	direction=Input.get_axis("left","right")
	direction2=Input.get_axis("up","down")
	
	if Input.is_action_just_pressed("e"):
		if direction==0 && velocity.y==0 && !frozen:
			frozen=true
			if curChar<9:
				swapChars(curChar+1)
			else:
				swapChars(1)
			#swapChars(3)
	
	if !frozen:
		if !dashing:
			velocity.x=lerp(velocity.x,direction*speed,0.3)
		else:
			dashTime+=delta
			if dashTime>0.05:
				dashTime=0
				var insta=afterIm.instantiate()
				if frog_anim.flip_h:
					insta.scale.x*=-1
				insta.global_position=global_position
				get_parent().add_child(insta)
	else:
		velocity.x=0
	if direction!=0 && !ghosting && !scanning:
		frog_anim.flip_h=direction==-1
	steve_anim.flip_h=frog_anim.flip_h
	mask_anim.flip_h=frog_anim.flip_h
	hood_anim.flip_h=frog_anim.flip_h
	robot_anim.flip_h=frog_anim.flip_h
	joe_anim.flip_h=frog_anim.flip_h
	fox_anim.flip_h=frog_anim.flip_h
	if frog_anim.flip_h:
		lizard_anim.offset.x=25.0
	else:
		lizard_anim.offset.x=0.0
	lizard_anim.flip_h=frog_anim.flip_h
	barrel_anim.flip_h=frog_anim.flip_h
	if Input.is_action_just_pressed("space") :
		if curChar==2:
			if !scanning:
				scanning=true
				frozen=true
				steve_anim.play("scan")
				hackCheck.emit()
				await get_tree().create_timer(0.1).timeout
				if steve_anim.animation!="scan":
					steve_anim.play("scan")
		if curChar==3:
			if !ghosting:
				if !frozen && magic>=2.5:
					magic-=2.5
					shadow_char.global_position=global_position
					shadow_char.velocity=velocity
					frozen=true
					ghosting=true
					mask_anim.pause()
					shadow_char.activate(mask_anim.frame)
			else:
				var flippe=shadow_char.deactivate()
				animation_player.play("fade")
				await get_tree().create_timer(0.1).timeout
				global_position=shadow_char.global_position
				animation_player.play("RESET")
				frog_anim.flip_h=flippe
				frozen=false
				ghosting=false
				mask_anim.play("idle")
				regen_mag.start()
					
		if curChar==1 && !frozen:
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
					if frog_anim.flip_h:
						xVel*=-1
				var xTween=create_tween()
				xTween.tween_property(self,"velocity",Vector2(xVel,yVel),0.1)
				await xTween.finished
				var xTween2=create_tween()
				xTween2.tween_property(self,"velocity",Vector2(oldVelX/2,0),0.3)
				await xTween2.finished
				dashing=false
					


	if canJump && Input.is_action_pressed("up") && !dashing && !frozen:
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
	
	if Input.is_action_pressed("up") && !frozen:
		if coyote_time.time_left>0:
			velocity.y=-1*jumpStrength
			jumpTime=0.0
			coyote_time.stop()
			canJump=true
	
	if is_on_floor():
		if !(velocity.x<2 && velocity.x>-2):
			frog_anim.play("walking")
			steve_anim.play("walking")
		else:
			frog_anim.play("idle")
	else:
		if velocity.y>0:
			frog_anim.play("fall")
		elif velocity.y<0 || dashing:
			frog_anim.play("jump")
	
	
	move_and_slide()
	
	
	
func jump(force : int) -> void:
	velocity.y=-force

#
#func _on_open_animator_animation_finished(anim_name: StringName) -> void:
	#await get_tree().create_timer(0.3).timeout
	#if anim_name=="frog":
		#curChar=2
		#steve_anim.visible=true
		#frog_anim.visible=false
	#if curChar==2:
		#close_animator.play("steve")


func _on_close_animator_animation_finished(anim_name: StringName) -> void:
	if frozen && !changed:
		if anim_name=="frog":
			frog_anim.visible=false
		if anim_name=="steve":
			steve_anim.visible=false
		if anim_name=="mask":
			mask_anim.visible=false
		if anim_name=="hood":
			hood_anim.visible=false
		if anim_name=="robot":
			robot_anim.visible=false
		if anim_name=="joe":
			joe_anim.visible=false
		if anim_name=="fox":
			fox_anim.visible=false
		if anim_name=="lizard":
			lizard_anim.visible=false
		if anim_name=="barrel":
			barrel_anim.visible=false
		color_rect.visible=true
		await get_tree().create_timer(0.3).timeout
		changed=true
		control_3.visible=false
		close_animator.play("RESET")
		color_rect.visible=true
		if changeChar==1:
			close_animator.play("frog")
			curChar=1
			frog_anim.visible=true
		if changeChar==2:
			close_animator.play("steve")
			curChar=2
			steve_anim.visible=true
		if changeChar==3:
			close_animator.play("mask")
			curChar=3
			mask_anim.visible=true
		if changeChar==4:
			close_animator.play("hood")
			curChar=4
			hood_anim.visible=true
		if changeChar==5:
			close_animator.play("robot")
			curChar=5
			robot_anim.visible=true
		if changeChar==6:
			close_animator.play("joe")
			curChar=6
			joe_anim.visible=true
		if changeChar==7:
			close_animator.play("fox")
			curChar=7
			fox_anim.visible=true
		if changeChar==8:
			close_animator.play("lizard")
			curChar=8
			lizard_anim.visible=true
		if changeChar==9:
			close_animator.play("barrel")
			curChar=9
			barrel_anim.visible=true
		
	elif changed:	
		frozen=false
		changed=false

func disableShadow()->void:
	var flippe=shadow_char.deactivate()
	animation_player.play("fade")
	await get_tree().create_timer(0.1).timeout
	global_position=shadow_char.global_position
	animation_player.play("RESET")
	frog_anim.flip_h=flippe
	frozen=false
	ghosting=false
	mask_anim.play("idle")
	regen_mag.start()
