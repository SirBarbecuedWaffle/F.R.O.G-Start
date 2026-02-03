extends Node2D
@onready var health_bar: Sprite2D = $healthBar
@onready var turn_bar: Sprite2D = $turnBar
@onready var health_label: Label = $healthLabel
@onready var move_handler: Node2D = $moveHandler
@export var character:=""
@onready var hit_sprite: AnimatedSprite2D = $hitSprite
@onready var poison_dam: AnimatedSprite2D = $enemySpr1/poisonDam
@onready var poison_on: AnimatedSprite2D = $enemySpr1/poisonOn


var deathAnim=preload("res://2DAssets/deathAnimation.tscn")

var basicHit=preload("res://battles/battle_projectile.tscn")
var damageIcon=preload("res://damageIndicator.tscn")
@onready var party_handler: Node2D = $"../../partyHandler"

@export var health:=140.0:
	set(newHP):
		if newHP<health-1:
			hit_sprite.play("default")
		if defUp>0:
			newHP+=(health-newHP)/2
		if defDown>0:
			newHP-=(health-newHP)/2
		health=newHP
		
@export var maxHealth:=140.0
@export var moveProgress:=0.0
@export var poison:=0
@export var fire:=0
@export var atkDown:=20.0
@export var defDown:=10.0
@export var spdDown:=0.0
@export var atkUp:=20.0
@export var defUp:=20.0
@export var spdUp:=15.0
@export var stun:=0
@onready var enemy_spr_1: AnimatedSprite2D = $enemySpr1
var turnTime:=randi_range(470,700)
@onready var frog_layer: CanvasLayer = $"../.."
@onready var def_up_ind: Sprite2D = $arrowHandler/goodArrows/defUpInd
@onready var spd_up_ind: Sprite2D = $arrowHandler/goodArrows/spdUpInd
@onready var atk_up_ind: Sprite2D = $arrowHandler/goodArrows/atkUpInd
@onready var atk_down_ind: Sprite2D = $arrowHandler/badArrows/atkDownInd
@onready var def_down_ind: Sprite2D = $arrowHandler/badArrows/defDownInd
@onready var spd_down_ind: Sprite2D = $arrowHandler/badArrows/spdDownInd

@onready var def_time_lab: Label = $arrowHandler/goodArrows/defUpInd/defTimeLab
@onready var spd_time_lab: Label = $arrowHandler/goodArrows/spdUpInd/spdTimeLab
@onready var atk_time_lab: Label = $arrowHandler/goodArrows/atkUpInd/atkTimeLab
@onready var atk_down_lab: Label = $arrowHandler/badArrows/atkDownInd/atkDownLab
@onready var def_down_lab: Label = $arrowHandler/badArrows/defDownInd/defDownLab
@onready var spd_down_lab: Label = $arrowHandler/badArrows/spdDownInd/spdDownLab
@onready var poison_damage: Timer = $poisonDamage

@onready var attack_animator: AnimationPlayer = $attackAnimator

func _process(delta: float) -> void:
	poison_on.visible=poison>0
	poison_damage.paused=!poison>0
	atk_up_ind.visible=atkUp>1
	if atkUp>0:
		atkUp-=1*delta
		if atkUp<999:
			atk_time_lab.text=str(int(atkUp))
		else:
			atk_time_lab.text="∞"
	def_up_ind.visible=defUp>1
	if defUp>0:
		defUp-=1*delta
		if defUp<999:
			def_time_lab.text=str(int(defUp))
		else:
			def_time_lab.text="∞"
	spd_up_ind.visible=spdUp>1
	if spdUp>0:
		spdUp-=1*delta
		if spdUp<999:
			spd_time_lab.text=str(int(spdUp))
		else:
			spd_time_lab.text="∞"
	spd_down_ind.visible=spdDown>1
	if spdDown>0:
		spdDown-=1*delta
		if spdDown<999:
			spd_down_lab.text=str(int(spdDown))
		else:
			spd_down_lab.text="∞"
	def_down_ind.visible=defDown>1
	if defDown>0:
		defDown-=1*delta
		if defDown<999:
			def_down_lab.text=str(int(defDown))
		else:
			def_down_lab.text="∞"
	atk_down_ind.visible=atkDown>1
	if atkDown>0:
		atkDown-=1*delta
		if atkDown<999:
			atk_down_lab.text=str(int(atkDown))
		else:
			atk_down_lab.text="∞"
	
			
			
	if health>maxHealth:
		health=maxHealth
	health_label.text=str(int(health))
	if health>=1:
		health_label.modulate=Color(1.0, 1.0, 1.0, 1.0)
		health_bar.scale.x=(health/maxHealth)*-0.377
		if moveProgress<turnTime:
			moveProgress+=60*delta
			if spdUp>0:
				moveProgress+=30*delta
			if spdDown>0:
				moveProgress-=30*delta
		else:
			attack_animator.play("attack")
			moveProgress=0
			turnTime=randi_range(470,700)
			await get_tree().create_timer(0.36).timeout
			var hit=basicHit.instantiate()
			hit.damage=30
			hit.collision_layer=4
			hit.collision_mask=5
			hit.randomNumbers=true
			var alivePeople=party_handler.getAlivePlayers()
			if alivePeople==[0,0,0,0]:
				get_tree().quit()
			var numTargets=0
			for i in range(4):
				if alivePeople[i] is partyMember:
					numTargets+=1
			var target=randi_range(0,numTargets)
			while target==0:
				target=randi_range(0,numTargets)
			
			hit.global_position=party_handler.getAlivePlayers()[target-1].global_position
			print(hit.global_position)
			frog_layer.add_child(hit)
	else:
		if attack_animator.current_animation!="die":
			health_label.modulate=Color(1.0, 1.0, 1.0, 0.0)
			attack_animator.play("die")
			await get_tree().create_timer(0.1).timeout
			var deathThing=deathAnim.instantiate()
			frog_layer.add_child(deathThing)
			deathThing.global_position=global_position


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area is damager:
		health-=area.damage
		if area.damage!=0:
			if area.damage>0:
				if defUp>0:
					area.damage-=(area.damage)/2
				if defDown>0:
					area.damage+=(area.damage)/2
			var movie=damageIcon.instantiate()
			movie.damageAmount=area.damage
			movie.global_position=global_position
			if area.damage>3000:
				movie.damageType="cleaving"
			frog_layer.add_child(movie)
		poison+=area.poison
		stun+=area.stun
		fire+=area.burn
		
		#applies buffs
		if spdUp<area.spdBuf:
			spdUp=area.spdBuf
		else:
			spdUp+=(area.spdBuf/2)
		if atkUp<area.strBuf:
			atkUp=area.strBuf
		else:
			atkUp+=(area.strBuf/2)
		if defUp<area.spdBuf:
			defUp=area.defBuf
		else:
			defUp+=(area.defBuf/2)
			
		#applies debuffs
		if spdDown<area.spdRev:
			spdDown=area.spdRev
		else:
			spdDown+=(area.spdRev/2)
		if atkDown<area.strRev:
			atkDown=area.strRev
		else:
			atkDown+=(area.strRev/2)
		if defDown<area.defRev:
			defDown=area.defRev
		else:
			defDown+=(area.defRev/2)
		
		if area.oneHit:
			area.queue_free()


func _on_death_anim_animation_finished() -> void:
	queue_free()


func _on_attack_animator_animation_finished(anim_name: StringName) -> void:
	if anim_name=="die":
		queue_free()


func _on_poison_damage_timeout() -> void:
	var am=randi_range(6,10)
	var movie=damageIcon.instantiate()
	movie.damageAmount=am
	movie.global_position=global_position
	movie.damageType="poison"
	poison_dam.play("default")
	frog_layer.add_child(movie)
	health-=am
	poison-=am
	poison_damage.start(randi_range(1,5))
