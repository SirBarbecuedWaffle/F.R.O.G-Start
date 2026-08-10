extends Node2D
@export var spawnLoca:Vector2
@onready var spawn_location: Marker2D = $spawnLocation
@onready var place_1: Area2D = $places/place1
@onready var place_2: Area2D = $places/place2
@onready var place_3: Area2D = $places/place3
@onready var place_4: Area2D = $places/place4
@onready var places: Node2D = $places
@onready var targets: Node2D = $targets
@onready var dice_1: AnimatedSprite2D = $Arrows/dice1
@onready var strike_projectile: damager = $Arrows/dice1/strikeProjectile
@onready var labele: Label = $Node2D/labele
@onready var node_2d: Node2D = $Node2D
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2
@onready var gpu_particles_2d_2: GPUParticles2D = $Arrows/dice1/GPUParticles2D2
@onready var gpu_particles_2d_3: GPUParticles2D = $Arrows/dice1/GPUParticles2D3



@onready var arrows: Node2D = $Arrows
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var multiplier:=1.0
@export var cripp:=false
var coordX:=0
var coordY:=0
var done:=false

var bone:=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_location.global_position=spawnLoca
	dice_1.global_position=spawn_location.global_position
	coordX=dice_1.global_position.x
	coordY=dice_1.global_position.y
	await get_tree().create_timer(0.1).timeout
	dice_1.visible=true
	var tween0 = create_tween()
	tween0.tween_property(self,"coordX",1013,1.4)
	var tween = create_tween()
	tween.tween_property(self,"coordY",100,0.75).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await tween.finished
	var tween2 = create_tween()
	tween2.tween_property(self,"coordY",560,0.75).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await tween2.finished
	var numb=randi_range(1,6)
	if bone==1:
		numb=randi_range(3,6)
	
	if numb==1:
		dice_1.play("1")
		strike_projectile.damage=20
		labele.text="TERRIBLE"
		node_2d.modulate=Color(1.0, 0.0, 0.0, 1.0)
	if numb==2:
		dice_1.play("2")
		strike_projectile.damage=40
		labele.text="BAD"
		node_2d.modulate=Color(1.0, 0.533, 0.0, 1.0)
	if numb==3:
		dice_1.play("3")
		strike_projectile.damage=60
		labele.text="OK"
		node_2d.modulate=Color(1.0, 1.0, 0.0, 1.0)
	if numb==4:
		dice_1.play("4")
		strike_projectile.damage=80
		labele.text="GOOD"
		node_2d.modulate=Color(0.0, 1.0, 0.0, 1.0)
		strike_projectile.strRev=6
	if numb==5:
		dice_1.play("5")
		strike_projectile.damage=100
		labele.text="GREAT"
		node_2d.modulate=Color(0.0, 1.0, 0.541, 1.0)
		strike_projectile.spdRev=6
		if bone==2:
			animation_player.play("blue")
			var bang=randi_range(1,4)
			gpu_particles_2d_2.emitting=true
			gpu_particles_2d_3.emitting=true
			if bang==1:
				strike_projectile.damage=99999
				animation_player.play("red")
				labele.text="CLEAVE"
				strike_projectile.spdRev=0
				node_2d.modulate=Color(0.61, 0.0, 0.0, 1.0)
		
	if numb==6:
		dice_1.play("6")
		labele.text="AMAZING"
		node_2d.modulate=Color(0.0, 1.0, 1.0, 1.0)
		strike_projectile.damage=120
		strike_projectile.defRev=6
		if bone==2:
			gpu_particles_2d_2.emitting=true
			gpu_particles_2d_3.emitting=true
			animation_player.play("blue")
			var bang=randi_range(1,4)
			if bang==1:
				strike_projectile.damage=99999
				animation_player.play("red")
				labele.text="CLEAVE"
				strike_projectile.defRev=0
				node_2d.modulate=Color(0.61, 0.0, 0.0, 1.0)
		
		
	await get_tree().create_timer(0.2).timeout
	animation_player_2.play("label")
	
	await get_tree().create_timer(1.0).timeout
	for i in places.get_children():
		if i.audio_bus_override:
			var targNew:=Marker2D.new()
			targNew.global_position=i.global_position
			targets.add_child(targNew)
	done=true
	await get_tree().create_timer(0.1).timeout
	var specTarg=targets.get_children()[randi_range(0,targets.get_children().size()-1)]
	var tween3 = create_tween()
	tween3.tween_property(dice_1,"global_position",specTarg.global_position,1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	await get_tree().create_timer(1.2).timeout
	animation_player.play("arrowFade")
	await get_tree().create_timer(0.4).timeout
	queue_free()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !done:
		dice_1.global_position.x=coordX
		dice_1.global_position.y=coordY


func _on_place_1_area_entered(area: Area2D) -> void:
	place_1.audio_bus_override=true


func _on_place_2_area_entered(area: Area2D) -> void:
	place_2.audio_bus_override=true


func _on_place_3_area_entered(area: Area2D) -> void:
	place_3.audio_bus_override=true


func _on_place_4_area_entered(area: Area2D) -> void:
	place_4.audio_bus_override=true


func _on_strike_projectile_area_entered(area: Area2D) -> void:
	if done:
		dice_1.queue_free()
