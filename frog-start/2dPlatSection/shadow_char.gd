extends CharacterBody2D
@export var gravity:=0
@export var speed:=150.0
@export var jumpStrength:=130.0
@export var MaxjumpStrength:=2600.0
@onready var coyote_time: Timer = $coyoteTime
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var frog_anim: AnimatedSprite2D = $collisionbox/frogAnim
@onready var steve_anim: AnimatedSprite2D = $collisionbox/steveAnim
@onready var mask_anim: AnimatedSprite2D = $collisionbox/maskAnim
@onready var hood_anim: AnimatedSprite2D = $collisionbox/hoodAnim
@onready var robot_anim: AnimatedSprite2D = $collisionbox/robotAnim
@onready var joe_anim: AnimatedSprite2D = $collisionbox/joeAnim
@onready var fox_anim: AnimatedSprite2D = $collisionbox/foxAnim
@onready var lizard_anim: AnimatedSprite2D = $collisionbox/lizardAnim
@onready var barrel_anim: AnimatedSprite2D = $collisionbox/barrelAnim
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collisionbox: CollisionShape2D = $collisionbox


@export var curChar:=1
@export var dashStrength:=300.0
var direction:=0
var direction2:=0
var jumpTime:=0.0
@export var active:=false
var canJump:=false
var dashing:=false
var magic:=10.0
var ghosting:=false
var frozen:=false
var changed:=false

func deactivate()->bool:
	animation_player.play("fadeOut")
	active=false
	gravity=0
	velocity=Vector2.ZERO
	return mask_anim.flip_h
	await get_tree().create_timer(0.35).timeout
	visible=false

func activate(frame : int)->void:
	mask_anim.play("idle")
	mask_anim.frame=frame
	animation_player.play("fadeIn")
	active=true
	gravity=700
	visible=true

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	if Input.is_action_just_released("up"):
		canJump=false
	

	
	
func _physics_process(delta: float) -> void:
	frozen=!active
	
	collisionbox.disabled=!active
	
	#visible=active
	if not is_on_floor():
		if !dashing:
			velocity.y+=gravity*delta
			if velocity.y>500:
				velocity.y=500
	else:
		
		coyote_time.start(0.0)
	direction=Input.get_axis("left","right")
	direction2=Input.get_axis("up","down")
	
	if !frozen:
		if !dashing:
			velocity.x=lerp(velocity.x,direction*speed,0.3)
	else:
		velocity.x=0
	if direction!=0:
		mask_anim.flip_h=direction==-1

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
			mask_anim.play("walking")
			mask_anim.play("walking")
		else:
			mask_anim.play("idle")
	else:
		if velocity.y>0:
			mask_anim.play("fall")
		elif velocity.y<0 || dashing:
			mask_anim.play("jump")
	
	
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
