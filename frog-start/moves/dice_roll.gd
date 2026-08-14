extends Node2D
var cycles:=2
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var strike_projectile_4: damager = $strikeProjectile4
@onready var places: Node2D = $places
@onready var targets: Node2D = $targets
@onready var place_1: Area2D = $places/place1
@onready var place_2: Area2D = $places/place2
@onready var place_3: Area2D = $places/place3
@onready var place_4: Area2D = $places/place4
@onready var place_5: Area2D = $places/place5
@onready var places_2: Node2D = $places2
@onready var place_12: Area2D = $places2/place12
@onready var place_22: Area2D = $places2/place22
@onready var place_32: Area2D = $places2/place32
@onready var place_42: Area2D = $places2/place42
@onready var targets_2: Node2D = $targets2

@export var multiplier:=1.0
var dice1r:=0
var dice2r:=0
var dice3r:=0
@onready var dice_1: AnimatedSprite2D = $dice1
@onready var dice_2: AnimatedSprite2D = $dice2
@onready var dice_3: AnimatedSprite2D = $dice3
@onready var labele: Label = $labele
@onready var strike_projectile: damager = $dice1/strikeProjectile
@onready var strike_projectile_2: damager = $dice2/strikeProjectile2
@onready var strike_projectile_3: damager = $dice3/strikeProjectile3
@onready var strike_projectile_5: damager = $strikeProjectile5
@onready var coins: Node2D = $coins

func diceAtEnem()->void:
	await get_tree().create_timer(0.1).timeout
	for i in places.get_children():
		if i.audio_bus_override:
			var targNew:=Marker2D.new()
			targNew.global_position=i.global_position
			targets.add_child(targNew)
	await get_tree().create_timer(0.6).timeout
	if targets.get_children().size()!=0:
		var specTarg=targets.get_children()[randi_range(0,targets.get_children().size()-1)]
		var tween = create_tween()
		tween.tween_property(dice_1,"global_position",specTarg.global_position,0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		await get_tree().create_timer(0.43).timeout
		var tween2 = create_tween()
		tween2.tween_property(dice_2,"global_position",specTarg.global_position,0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		await get_tree().create_timer(0.43).timeout
		var tween3 = create_tween()
		tween3.tween_property(dice_3,"global_position",specTarg.global_position,0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		await get_tree().create_timer(1.1).timeout
		animation_player.play("fadeOut")
		await get_tree().create_timer(0.6).timeout
		queue_free()
	
	
func diceAtParty()->void:
	await get_tree().create_timer(0.1).timeout
	for i in places_2.get_children():
		if i.audio_bus_override:
			var targNew:=Marker2D.new()
			targNew.global_position=i.global_position
			targets_2.add_child(targNew)
	await get_tree().create_timer(0.6).timeout
	if targets_2.get_children().size()!=0:
		var specTarg=targets_2.get_children()[randi_range(0,targets_2.get_children().size()-1)]
		var tween = create_tween()
		tween.tween_property(dice_1,"global_position",specTarg.global_position,0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		await get_tree().create_timer(0.43).timeout
		specTarg=targets_2.get_children()[randi_range(0,targets_2.get_children().size()-1)]
		var tween2 = create_tween()
		tween2.tween_property(dice_2,"global_position",specTarg.global_position,0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		await get_tree().create_timer(0.43).timeout
		specTarg=targets_2.get_children()[randi_range(0,targets_2.get_children().size()-1)]
		var tween3 = create_tween()
		tween3.tween_property(dice_3,"global_position",specTarg.global_position,0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
		await get_tree().create_timer(1.1).timeout
		animation_player.play("fadeOut")
		await get_tree().create_timer(0.6).timeout
		queue_free()



func _ready() -> void:
	
	await get_tree().create_timer(1.1).timeout
	dice1r=randi_range(1,6)

	if dice1r==1:
		dice_1.play("1")
	if dice1r==2:
		dice_1.play("2")
	if dice1r==3:
		dice_1.play("3")
	if dice1r==4:
		dice_1.play("4")
	if dice1r==5:
		dice_1.play("5")
	if dice1r==6:
		dice_1.play("6")
	await get_tree().create_timer(0.52).timeout
	dice2r=randi_range(1,6)
	
	if dice2r==1:
		dice_2.play("1")
	if dice2r==2:
		dice_2.play("2")
	if dice2r==3:
		dice_2.play("3")
	if dice2r==4:
		dice_2.play("4")
	if dice2r==5:
		dice_2.play("5")
	if dice2r==6:
		dice_2.play("6")
	await get_tree().create_timer(0.51).timeout
	dice3r=randi_range(1,6)
	#if dice1r==dice2r && dice1r==dice3r:
		#pass
	#else:
		#if dice1r==dice3r:
			#dice3r=randi_range(1,6)
	if dice3r==1:
		dice_3.play("1")
	if dice3r==2:
		dice_3.play("2")
	if dice3r==3:
		dice_3.play("3")
	if dice3r==4:
		dice_3.play("4")
	if dice3r==5:
		dice_3.play("5")
	if dice3r==6:
		dice_3.play("6")
	await get_tree().create_timer(0.5).timeout
	if dice1r==dice2r && dice1r==dice3r:
		if dice1r!=6:
			labele.text="JACKPOT"
			labele.self_modulate=Color(1.0, 0.769, 0.0, 1.0)
			strike_projectile_4.global_position.y=535.0
			await get_tree().create_timer(2.0).timeout
			animation_player.play("fadeOut")
			await get_tree().create_timer(2.0).timeout
			queue_free()
			
		else:
			labele.text="MEGA JACKPOT"
			labele.self_modulate=Color(1.0, 0.922, 0.0, 1.0)
			strike_projectile_4.global_position.y=535.0
			await get_tree().create_timer(22.0).timeout
			animation_player.play("fadeOut")
			await get_tree().create_timer(2.0).timeout
			queue_free()
			
	elif dice1r==dice2r:
		labele.text="MATCH"
		labele.self_modulate=Color(0.0, 0.769, 0.0, 1.0)
		strike_projectile.oneHit=false
		strike_projectile_2.oneHit=false
		strike_projectile_3.oneHit=false
		strike_projectile.damage=-1*dice1r*20
		strike_projectile_2.damage=-1*dice2r*20
		strike_projectile_3.damage=-1*dice3r*20
	elif dice2r==dice3r:
		labele.text="MATCH"
		labele.self_modulate=Color(0.0, 0.769, 0.0, 1.0)
		strike_projectile.oneHit=false
		strike_projectile_2.oneHit=false
		strike_projectile_3.oneHit=false
		strike_projectile.damage=-1*dice1r*20
		strike_projectile_2.damage=-1*dice2r*20
		strike_projectile_3.damage=-1*dice3r*20
	elif dice1r==dice3r:
		labele.text="MATCH"
		labele.self_modulate=Color(0.0, 0.769, 0.0, 1.0)
		strike_projectile.oneHit=false
		strike_projectile_2.oneHit=false
		strike_projectile_3.oneHit=false
		strike_projectile.damage=-1*dice1r*20
		strike_projectile_2.damage=-1*dice2r*20
		strike_projectile_3.damage=-1*dice3r*20
	elif dice1r+dice2r+dice3r>12:
		labele.text="HIGHROLL"
		labele.self_modulate=Color(0.0, 0.769, 1.0, 1.0)
		strike_projectile.damage=dice1r*20
		strike_projectile_2.damage=dice2r*20
		strike_projectile_3.damage=dice3r*20
		strike_projectile_3.defRev=10
		strike_projectile_3.spdRev=10
		strike_projectile_3.strRev=10
		if dice1r==6:
			strike_projectile.burn=150
		if dice1r==5:
			pass
		if dice1r==4:
			strike_projectile.stun=5
		if dice2r==3:
			strike_projectile.strRev=20
		if dice2r==6:
			strike_projectile_2.burn=150
		if dice2r==5:
			pass
		if dice2r==4:
			strike_projectile_2.stun=5
		if dice2r==3:
			strike_projectile_2.strRev=20
		if dice3r==6:
			strike_projectile_3.burn=150
		if dice3r==5:
			pass
		if dice3r==4:
			strike_projectile_3.stun=5
		if dice3r==3:
			strike_projectile_3.strRev=20
	elif dice1r+dice2r+dice3r>7:
		labele.text="HIT"
		labele.self_modulate=Color(1.0, 1.0, 1.0, 1.0)
		strike_projectile.damage=dice1r*20
		strike_projectile_2.damage=dice2r*20
		strike_projectile_3.damage=dice3r*20
		if dice1r==6:
			strike_projectile.burn=80
		if dice1r==5:
			pass
		if dice1r==4:
			strike_projectile.stun=2
		if dice2r==3:
			strike_projectile.strRev=10
		if dice2r==6:
			strike_projectile_2.burn=80
		if dice2r==5:
			pass
		if dice2r==4:
			strike_projectile_2.stun=2
		if dice2r==3:
			strike_projectile_2.strRev=10
		if dice3r==6:
			strike_projectile_3.burn=80
		if dice3r==5:
			pass
		if dice3r==4:
			strike_projectile_3.stun=2
		if dice3r==3:
			strike_projectile_3.strRev=10
	else:
		labele.text="BUST"
		labele.self_modulate=Color(1.0, 0.0, 0.0, 1.0)
		strike_projectile.damage=dice1r*50
		strike_projectile_2.damage=dice2r*50
		strike_projectile_3.damage=dice3r*50
	await get_tree().create_timer(1.4).timeout
	if labele.text=="HIT" || labele.text=="HIGHROLL":
		diceAtEnem()
	if labele.text=="BUST" || labele.text=="MATCH":
		diceAtParty()
		
		
		
		
		
	strike_projectile.damage*=multiplier
	strike_projectile_2.damage*=multiplier
	strike_projectile_3.damage*=multiplier
	strike_projectile_4.damage*=multiplier
	
	
func _physics_process(delta: float) -> void:
	if labele.text=="MEGA JACKPOT":
		coins.global_position.y+=500*delta






func _on_place_1_area_entered(area: Area2D) -> void:
	place_1.audio_bus_override=true



func _on_place_3_area_entered(area: Area2D) -> void:
	place_3.audio_bus_override=true



func _on_place_4_area_entered(area: Area2D) -> void:
	place_4.audio_bus_override=true



func _on_place_2_area_entered(area: Area2D) -> void:
	place_2.audio_bus_override=true


func _on_strike_projectile_3_area_entered(area: Area2D) -> void:
	dice_3.queue_free()


func _on_strike_projectile_2_area_entered(area: Area2D) -> void:
	dice_2.queue_free()


func _on_strike_projectile_area_entered(area: Area2D) -> void:
	dice_1.queue_free()


func _on_place_12_area_entered(area: Area2D) -> void:
	place_12.audio_bus_override=true


func _on_place_22_area_entered(area: Area2D) -> void:
	place_22.audio_bus_override=true


func _on_place_32_area_entered(area: Area2D) -> void:
	place_32.audio_bus_override=true


func _on_place_42_area_entered(area: Area2D) -> void:
	place_42.audio_bus_override=true


func _on_place_5_area_entered(area: Area2D) -> void:
	place_5.audio_bus_override=true
