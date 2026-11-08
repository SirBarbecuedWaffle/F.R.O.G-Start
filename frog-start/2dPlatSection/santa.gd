extends CharacterBody2D

enum State { CHASE, JUMP_TO_PLAYER, DROP_TO_PLAYER, FLEE, PANIC, DODGE, JUKE, JUMP_OVER }

@export var move_speed:=140.0
@export var scared_speed:=220.0
@export var panic_speed:=320.0
@export var dash_speed:=420.0
@export var jump_over_speed:=350.0
@export var acceleration:=1800.0
@export var jump_force:=-350.0
@export var gravity:=900.0

@export var scared:=false
@export var panic_distance:=140.0
@export var stomp_detection_width:=100.0
@export var player_fall_threshold:=75.0
@export var jump_over_distance:=80.0
@onready var damage_box: CollisionShape2D = $Damager2/damageBox

@export var player:CharacterBody2D

var state=State.CHASE
var desired_velocity_x:=0.0
var flee_direction:=1
var juke_timer:=0.0
var dodge_timer:=0.0
var panic_timer:=0.0
var corner_timer:=0.0
var direction_commit_timer:=0.0
var jump_over_timer:=0.0

@onready var animated_sprite_2d:AnimatedSprite2D=$AnimatedSprite2D
@onready var wall_ray:RayCast2D=$WallRay
@onready var back_wall_ray:RayCast2D=$BackWallRay
@onready var ledge_ray:RayCast2D=$LedgeRay
@onready var floor_ray:RayCast2D=$FloorRay
@onready var dashdetector: Area2D = $dashdetector
@onready var dash_col: CollisionShape2D = $dashdetector/dashCol
@onready var yellowmator: AnimationPlayer = $yellowmator
@onready var damager_2: Area2D = $Damager2

@export var yellow:=false

@export var health:=3
@onready var yellow_timer: Timer = $yellowTimer


func _ready():
	randomize()

func toggleYellow():
	yellow_timer.start()
	yellow=!yellow
	scared=yellow
	
	if yellow:
		yellowmator.play("yellow")
	else:
		yellowmator.play_backwards("yellow")
	if yellow:
		await get_tree().create_timer(1.0).timeout
		damage_box.global_position.y-=1000
	else:
		damage_box.global_position.y+=1000
func _physics_process(delta):


	if !is_on_floor():
		velocity.y+=gravity*delta

	juke_timer-=delta
	dodge_timer-=delta
	panic_timer-=delta
	direction_commit_timer-=delta
	jump_over_timer-=delta

	update_state()
	move_ai()
	detect_corner(delta)

	velocity.x=move_toward(velocity.x,desired_velocity_x,acceleration*delta)

	update_animation()
	move_and_slide()

func update_state():

	if player==null:
		return

	var distance_to_player=global_position.distance_to(player.global_position)

	if scared:

		var incoming_stomp=player.global_position.y<global_position.y-8 and abs(player.global_position.x-global_position.x)<90 and player.velocity.y>60

		if incoming_stomp:
			state=State.DODGE
			dodge_timer=0.35
			return

		var jump_threat=player.global_position.y<global_position.y-16 and player.velocity.y>40 and abs(player.global_position.x-global_position.x)<120

		var dodge_chance:=0.5

		if distance_to_player<panic_distance:
			dodge_chance=1.0

		if jump_threat and randf()<dodge_chance:
			state=State.DODGE
			dodge_timer=0.5
			return

		var close_horizontal=abs(player.global_position.x-global_position.x)<jump_over_distance
		var same_level=abs(player.global_position.y-global_position.y)<32
		var player_running=abs(player.velocity.x)>90 and abs(player.velocity.y)<20

		if close_horizontal and same_level and player_running and is_on_floor():
			state=State.JUMP_OVER
			jump_over_timer=0.6
			return

		if distance_to_player<panic_distance:
			state=State.PANIC
			panic_timer=0.75
			return

		state=State.FLEE
		return

	var calm_jump_threat=player.global_position.y<global_position.y-16 and player.velocity.y>40 and abs(player.global_position.x-global_position.x)<120

	if calm_jump_threat and randf()<0.5:
		state=State.DODGE
		dodge_timer=0.35
		return

	var y_diff=player.global_position.y-global_position.y

	if y_diff<-48:
		state=State.JUMP_TO_PLAYER
	elif y_diff>64:
		state=State.DROP_TO_PLAYER
	else:
		state=State.CHASE

func move_ai():

	match state:
		State.CHASE: chase_player()
		State.JUMP_TO_PLAYER: jump_to_player()
		State.DROP_TO_PLAYER: drop_to_player()
		State.FLEE: flee_player()
		State.PANIC: panic()
		State.DODGE: dodge()
		State.JUKE: juke()
		State.JUMP_OVER: jump_over_player()

func chase_player():

	var dir=sign(player.global_position.x-global_position.x)
	if dir==0: dir=1

	desired_velocity_x=dir*move_speed

	if wall_ray.is_colliding() and is_on_floor():
		velocity.y=jump_force

func jump_to_player():

	var dir=sign(player.global_position.x-global_position.x)
	if dir==0: dir=1

	desired_velocity_x=dir*move_speed

	if is_on_floor():

		if wall_ray.is_colliding():
			velocity.y=jump_force
		elif player.global_position.y<global_position.y-32:
			velocity.y=jump_force

func drop_to_player():

	var dir=sign(player.global_position.x-global_position.x)
	if dir==0: dir=1

	desired_velocity_x=dir*move_speed

	if wall_ray.is_colliding() and is_on_floor():
		velocity.y=jump_force

func flee_player():

	var trapped=wall_ray.is_colliding() and global_position.distance_to(player.global_position)<120

	if trapped:
		state=State.DODGE
		dodge_timer=0.5
		return

	var distance=global_position.distance_to(player.global_position)
	var fear=clamp(1.0-(distance/300.0),0.0,1.0)
	var escape_speed=lerp(scared_speed,panic_speed,fear)

	if direction_commit_timer<=0:

		flee_direction=-sign(player.global_position.x-global_position.x)

		if flee_direction==0:
			flee_direction=[-1,1].pick_random()

		var jdistance=global_position.distance_to(player.global_position)
		var juke_chance:=0.08

		if jdistance<panic_distance:
			juke_chance=0.20

		if abs(player.velocity.x)>120 and randf()<juke_chance:
			state=State.JUKE
			juke_timer=randf_range(0.4,0.8)
			return

		direction_commit_timer=randf_range(0.4,1.0)

	if wall_ray.is_colliding():

		if back_wall_ray.is_colliding():
			corner_escape()
			return

		if is_on_floor():
			velocity.y=jump_force

		flee_direction*=-1
		direction_commit_timer=1.0

	if !ledge_ray.is_colliding():

		if player.global_position.y>global_position.y+48:
			pass
		elif randf()>0.35:
			flee_direction*=-1

	desired_velocity_x=flee_direction*escape_speed

func panic():

	var distance=global_position.distance_to(player.global_position)
	var panic_strength=clamp(1.0-(distance/panic_distance),0.0,1.0)

	flee_direction=-sign(player.global_position.x-global_position.x)

	if flee_direction==0:
		flee_direction=[-1,1].pick_random()

	desired_velocity_x=flee_direction*lerp(scared_speed,panic_speed,panic_strength)

	var hop_chance=0.02+(panic_strength*0.10)

	if is_on_floor() and randf()<hop_chance:
		velocity.y=jump_force

	if wall_ray.is_colliding():

		if back_wall_ray.is_colliding():
			corner_escape()
			return

		if is_on_floor():
			velocity.y=jump_force

		flee_direction*=-1
		desired_velocity_x=flee_direction*panic_speed

	if !ledge_ray.is_colliding():

		if is_on_floor():
			velocity.y+=100

	if panic_timer<=0:
		state=State.FLEE

func dodge():

	if player.global_position.x<global_position.x:
		desired_velocity_x=dash_speed
		flee_direction=1
	else:
		desired_velocity_x=-dash_speed
		flee_direction=-1

	if scared and is_on_floor() and abs(player.global_position.x-global_position.x)<90 and randf()<0.08:
		velocity.y=jump_force*0.6

	if dodge_timer<=0:
		if scared:
			state=State.PANIC
		else:
			state=State.CHASE

func juke():

	if player.global_position.x<global_position.x:
		desired_velocity_x=panic_speed
	else:
		desired_velocity_x=-panic_speed

	if is_on_floor() and randf()<0.1:
		velocity.y=jump_force

	if juke_timer<=0:
		state=State.FLEE

func jump_over_player():

	if jump_over_timer>0.45:

		if is_on_floor():

			velocity.y=jump_force*1.25

			if player.global_position.x<global_position.x:
				flee_direction=-1
				desired_velocity_x=-jump_over_speed
			else:
				flee_direction=1
				desired_velocity_x=jump_over_speed

	if jump_over_timer<=0:
		flee_direction*=-1
		state=State.PANIC

func detect_corner(delta):

	var boxed_in=wall_ray.is_colliding() and back_wall_ray.is_colliding()
	var trapped_against_wall=wall_ray.is_colliding() and global_position.distance_to(player.global_position)<120

	if boxed_in:
		corner_timer+=delta*2.0
	elif trapped_against_wall:
		corner_timer+=delta
	else:
		corner_timer=0.0

	if corner_timer>0.3:
		corner_escape()
		corner_timer=0.0

func corner_escape():

	flee_direction*=-1

	if is_on_floor():
		velocity.y=jump_force*1.2
	elif velocity.y>0:
		velocity.y+=300

	desired_velocity_x=flee_direction*(panic_speed*1.25)

	state=State.DODGE
	dodge_timer=0.6

func update_animation():

	if velocity.x<0:
		animated_sprite_2d.flip_h=true
	elif velocity.x>0:
		animated_sprite_2d.flip_h=false

	if velocity.y>0:
		animated_sprite_2d.play("fallloop")
	elif velocity.y<0:
		if animated_sprite_2d.animation!="jump":
			animated_sprite_2d.play("jump")
	else:
		if abs(velocity.x)>5:
			animated_sprite_2d.play("walk")
		else:
			animated_sprite_2d.play("idle")


func _on_dashdetector_area_entered(area: Area2D) -> void:
	if yellow:
		toggleYellow()




func _on_yellow_timer_timeout() -> void:
	toggleYellow()


func _on_iciclehit_area_entered(area: Area2D) -> void:
	if !yellow:
		toggleYellow()
