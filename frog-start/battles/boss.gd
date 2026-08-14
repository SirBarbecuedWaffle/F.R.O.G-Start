extends Node2D
@onready var health_bar: Sprite2D = $healthBar
@onready var health_label: Label = $healthLabel
@export var character:=""
@onready var hit_sprite: AnimatedSprite2D = $hitSprite

@onready var enemy_body: Node2D = $enemyBody
@onready var enemy_spr_1: AnimatedSprite2D = $enemyBody/enemySpr1
@onready var enemy_spr_2: AnimatedSprite2D = $enemyBody/enemySpr2
@onready var enemy_spr_3: AnimatedSprite2D = $enemyBody/enemySpr3
@onready var poison_dam: AnimatedSprite2D = $enemyBody/poisonDam
@onready var fire_on: AnimatedSprite2D = $enemyBody/fireOn
@onready var poison_on: AnimatedSprite2D = $enemyBody/poisonOn
@onready var stun_anim: AnimatedSprite2D = $enemyBody/stunAnim
@onready var node_2d: Node2D = $"../../Node2D"
@onready var turn_bar: Sprite2D = $turnBar


var deathAnim=preload("res://2DAssets/deathAnimation.tscn")

var basicHit=preload("res://battles/battle_projectile.tscn")
var damageIcon=preload("res://damageIndicator.tscn")
@onready var party_handler: Node2D = $"../../partyHandler"
signal perished

@export var health:=999.0:
	set(newHP):
		if defUp>0:
			newHP+=(health-newHP)/2
		if defDown>0:
			newHP-=(health-newHP)/2
		health=newHP
		
@export var maxHealth:=999.0
@export var moveProgress:=0.0
@export var bmoveProgress:=0.0
@export var poison:=0
@export var fire:=0.0
@export var atkDown:=20.0
@export var defDown:=10.0
@export var spdDown:=0.0
@export var atkUp:=20.0
@export var defUp:=20.0
@export var spdUp:=15.0
@export var stun:=0.0
@export var regen:=0
@export var attackSpeed:=625
@export var attackDamage:=30
@export var attackStun:=0
@export var attackBurn:=0
@export var attackPoison:=0
@export var attackSPDRev:=0
@export var attackATKRev:=0
@export var attackDEFRev:=0
@export var enemyType:=0
@export var bossType:=0
var turnTime:=randi_range(attackSpeed-120,attackSpeed)
var bturnTime:=randi_range(1300,1520)
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



func _ready() -> void:
	health=maxHealth

func _process(delta: float) -> void:
	if regen>0:
		regen-=1*delta
		if regen%125==0:
			if health!=maxHealth:
				health+=5
			var movie=damageIcon.instantiate()
			movie.damageAmount=-5
			movie.global_position=global_position
			frog_layer.add_child(movie)
	if stun_anim!=null:
		stun_anim.visible=stun>0
	if stun>0:
		stun-=1*delta
		moveProgress=randi_range(0,turnTime-50)
	fire_on.visible=fire>0
	if fire>0:
		fire-=10*delta
		if int(fire)%5==0:
			var movie=damageIcon.instantiate()
			fire-=1
			movie.damageAmount=5
			health-=5
			movie.global_position=global_position
			movie.damageType="fire"
			frog_layer.add_child(movie)
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
		health_bar.scale.x=(health/maxHealth)*-1.925
		turn_bar.scale.x=(bmoveProgress/bturnTime)*1.766
		if bmoveProgress<bturnTime:
			if stun>0:
				pass
			else:
				bmoveProgress+=60*delta
				if spdUp>0:
					bmoveProgress+=30*delta
				if spdDown>0:
					bmoveProgress-=30*delta
		else:
			bmoveProgress=0
			bturnTime=randi_range(1300,1520)
		if moveProgress<turnTime:
			moveProgress+=60*delta
			if spdUp>0:
				moveProgress+=30*delta
			if spdDown>0:
				moveProgress-=30*delta
		else:
			enemy_spr_1.play("punch")
			moveProgress=0
			turnTime=randi_range(attackSpeed-120,attackSpeed+75)
			await get_tree().create_timer(0.36).timeout
			var hit=basicHit.instantiate()
			hit.damage=attackDamage
			hit.stun=attackStun
			hit.burn=attackBurn
			hit.poison=attackPoison
			hit.strRev=attackATKRev
			hit.defRev=attackDEFRev
			hit.spdRev=attackSPDRev
			if atkDown>0:
				hit.damage/=2
			hit.collision_layer=4
			hit.collision_mask=5
			hit.randomNumbers=true
			var alivePeople=party_handler.getAlivePlayers()
			if alivePeople!=[null,null,null,null]:
				var numTargets=0
				var target=randi_range(0,3)
				while party_handler.getAlivePlayers()[target]==null:
					target=randi_range(0,party_handler.getAlivePlayers().size()-1)
				if party_handler.getAlivePlayers()[target]!=null:
					var targese=party_handler.getAlivePlayers()[target]
					hit.global_position=targese.global_position
				frog_layer.add_child(hit)
			else:
				var only1:=0
				for d in CManager.party:
					if d!=0:
						only1+=1
				if only1>1:
					get_tree().change_scene_to_file("res://gameOver.tscn")
				else:
					var send2Limbo:=false
					for g in CManager.currentPatches:
						if g==14:
							send2Limbo=true
					if !send2Limbo:
						get_tree().change_scene_to_file("res://gameOver.tscn")
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
		regen+=area.regen*20
		if area.damage!=0:
			if area.damage>0:
				if area.damage>5:
					hit_sprite.play("default")
				if defUp>0:
					area.damage/=2
				if defDown>0:
					area.damage*=1.5
			if !area.envenom || poison<1:
				var movie=damageIcon.instantiate()
				movie.damageAmount=area.damage
				movie.global_position=global_position
				if area.damage>3000:
					movie.damageType="cleaving"
					area.damage=3000+health*0.05
				if area.glitch:
					movie.damageType="glitch"
				frog_layer.add_child(movie)
		if area.envenom:
			if poison>0:
				var movie=damageIcon.instantiate()
				movie.damageAmount=poison*(maxHealth*0.00005)+area.damage
				movie.global_position=global_position
				movie.damageType="poison"
				frog_layer.add_child(movie)
				health-=poison*(maxHealth*0.00005)
				poison=0
			else:
				poison+=area.poison
		else:
			poison+=area.poison
		health-=area.damage
		stun+=area.stun/2
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
			if area.defRev>2:
				defDown+=(area.defRev/2)
		
		if area.oneHit:
			area.queue_free()


func _on_death_anim_animation_finished() -> void:
	perished.emit(self.enemyType)
	queue_free()


func _on_attack_animator_animation_finished(anim_name: StringName) -> void:
	if anim_name=="die":
		perished.emit(self.enemyType)
		queue_free()


func _on_poison_damage_timeout() -> void:
	var am=randi_range(6,10)
	var movie=damageIcon.instantiate()
	movie.damageAmount=am+(maxHealth*0.0025)
	movie.global_position=global_position
	movie.damageType="poison"
	poison_dam.play("default")
	frog_layer.add_child(movie)
	health-=am+(maxHealth*0.0025)
	poison-=am
	poison_damage.start(randi_range(1,5))


func _on_enemy_spr_1_animation_finished() -> void:
	enemy_spr_1.play("idle")
