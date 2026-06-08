extends Node2D
class_name partyMember
@onready var health_bar: Sprite2D = $healthBar
@onready var turn_bar: Sprite2D = $turnBar
@onready var health_label: Label = $healthLabel
@onready var move_handler: Node2D = $moveHandler
@onready var hit_sprite: AnimatedSprite2D = $hitSprite
@onready var frog: AnimatedSprite2D = $"../frog"
@onready var steve: AnimatedSprite2D = $"../steve"
@onready var mask: AnimatedSprite2D = $"../mask"
@onready var pink: AnimatedSprite2D = $"../pink"
@onready var gorf: AnimatedSprite2D = $"../gorf"
@onready var robot: AnimatedSprite2D = $"../robot"
@onready var lizard: AnimatedSprite2D = $"../lizard"
@onready var joe: AnimatedSprite2D = $"../joe"
@onready var fox: AnimatedSprite2D = $"../fox"
@onready var barrel: AnimatedSprite2D = $"../barrel"
@onready var party_handler: Node2D = $".."
@onready var turnbar_animator: AnimationPlayer = $turnBar/turnbarAnimator
@onready var node_2d: Node2D = $"../../Node2D"



@export var character:=""

#buff animations

@onready var poison_dam: AnimatedSprite2D = $poisonDam
@onready var poison_on: AnimatedSprite2D = $poisonOn
@onready var def_buff_anim: AnimatedSprite2D = $defBuffAnim
@onready var str_buff_anim: AnimatedSprite2D = $strBuffAnim
@onready var spd_buff_anim: AnimatedSprite2D = $spdBuffAnim
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2

#move preloads
var strikeMove=preload("res://moves/strike_move.tscn")
var blockMove=preload("res://moves/block_move.tscn")
var arrowMove=preload("res://moves/arrow_barrage.tscn")
var frogMove=preload("res://moves/frogsicle.tscn")
var overclockMove=preload("res://moves/overclock.tscn")
var zipMove=preload("res://moves/zipbomb.tscn")
var altMove=preload("res://moves/altf4.tscn")
var infectMove=preload("res://moves/infect_move.tscn")
var curPoiMove=preload("res://moves/poison_curse.tscn")
var curWeakMove=preload("res://moves/weak_curse.tscn")
var coinMove=preload("res://moves/coinMove.tscn")
var strengthMove=preload("res://moves/strength_move.tscn")
var swordMove=preload("res://moves/swordbarrage.tscn")
var healthPotion=preload("res://moves/healthPotion.tscn")
var fireball=preload("res://moves/fireball.tscn")
var cannon=preload("res://moves/cannon_barrage.tscn")
var smite=preload("res://moves/smite_move.tscn")
var elect=preload("res://moves/electrocute.tscn")
var coff=preload("res://moves/coffee break.tscn")
var scald=preload("res://moves/scald.tscn")
var fired=preload("res://moves/Fired.tscn")
var DDoSed=preload("res://moves/d_do_s_move.tscn")
var barraged=preload("res://moves/arrow_barrage_2.tscn")
var blued=preload("res://moves/bluescreen_move.tscn")
var corupted=preload("res://moves/corrupt_move.tscn")
var damageIcon=preload("res://damageIndicator.tscn")
var flash=preload("res://screenFlash.tscn")
var flashed=preload("res://moves/flashbang.tscn")
var pummeld=preload("res://moves/pummel.tscn")
var toxiced=preload("res://moves/toxicsludge.tscn")
var cleanse=preload("res://moves/pressure_wash.tscn")
var bottoms=preload("res://moves/BottomsUp.tscn")
@onready var curChar : AnimatedSprite2D

@export var health:=10.0:
	set(newHP):
		if health<maxHealth:
			if newHP<health-1:
				hit_sprite.play("default")
		if newHP<health:
			if newHP<health-5:
				if newHP<maxHealth:
					if curChar!=null:
						if curChar.animation=="idle":
							curChar.play("hurt")
							hit_sprite.play("default")
			if defUp>0:
				newHP+=(health-newHP)/2
			if defDown>0:
				newHP-=(health-newHP)/2
		else:
			if newHP!=maxHealth:
				var tweent := create_tween()
				tweent.tween_property(curChar, "self_modulate", Color(0.0, 4.416, 0.0, 1.0), 0.2)
				await tweent.finished
				var tweent2 := create_tween()
				tweent2.tween_property(curChar, "self_modulate", Color(1.0, 1.0, 1.0, 1.0), 0.2)
		health=newHP
		
			
@export var maxHealth:=140.0
@export var moveProgress:=0.0
@export var poison:=0.0
@export var fire:=0
@export var atkDown:=00.0
@export var defDown:=00.0
@export var spdDown:=00.0
@export var atkUp:=0.0
@export var defUp:=0.0
@export var spdUp:=0.0
@export var stun:=0.0
@export var regen:=0
var turnTime:=randi_range(120,450)
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
@onready var frog_layer: CanvasLayer = $"../.."
@onready var poison_damage: Timer = $poisonDamage
@onready var stun_anim: AnimatedSprite2D = $stunAnim

func _ready() -> void:
	await get_tree().create_timer(0.01).timeout
	if character=="":
		maxHealth=-999
		visible=false
		global_position.y=-2000
	if character=="frog":
		curChar=frog
		maxHealth=CManager.charHP[0]+CManager.charLVL[0]*20
	if character=="steve":
		curChar=steve
		curChar.play("idle")
		maxHealth=CManager.charHP[1]+CManager.charLVL[1]*10
	if character=="mask":
		curChar=mask
		curChar.play("idle")
		maxHealth=CManager.charHP[2]+CManager.charLVL[2]*15
	if character=="pink":
		curChar=pink
		maxHealth=CManager.charHP[3]+CManager.charLVL[3]*20
	if character=="robot":
		curChar=robot
		curChar.play("idle")
		maxHealth=CManager.charHP[4]+CManager.charLVL[4]*30
	if character=="joe":
		curChar=joe
		curChar.play("idle")
		maxHealth=CManager.charHP[5]+CManager.charLVL[5]*20
	if character=="fox":
		curChar=fox
		curChar.play("idle")
		maxHealth=CManager.charHP[6]+CManager.charLVL[6]*10
	if character=="lizard":
		curChar=lizard
		curChar.play("idle")
		maxHealth=CManager.charHP[7]+CManager.charLVL[7]*30
	if character=="gorf":
		curChar=gorf
		curChar.play("idle")
		maxHealth=999.0
	if character=="barrel":
		curChar=barrel
		curChar.play("idle")
		maxHealth=CManager.charHP[8]+CManager.charLVL[8]*30
	health=maxHealth

func _process(delta: float) -> void:
	stun_anim.visible=stun>0
	if stun>0:
		if turnbar_animator.current_animation!="flash":
			stun-=1*delta
			moveProgress=randi_range(0,turnTime-50)
	if regen>0:
		regen-=1*delta
		if regen%125==0:
			health+=5
			var movie=damageIcon.instantiate()
			movie.damageAmount=-5
			movie.global_position=global_position
			frog_layer.add_child(movie)
	poison_on.visible=poison>0
	poison_damage.paused=!poison>0
	if health<1:
		if curChar!=null:
			if curChar.animation!="die":
				node_2d.playerDowned()
				curChar.play("die")
				health-=randi_range(30,90)
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
		if health_label.modulate==Color(1.0, 0.0, 0.0, 1.0):
			curChar.play("unDie")
			health_label.modulate=Color(1.0, 1.0, 1.0, 1.0)
		turn_bar.scale.x=(moveProgress/turnTime)*0.354
		health_bar.scale.x=(health/maxHealth)*-0.377
		if moveProgress<turnTime:
			moveProgress+=70*delta
			if spdUp>0:
				moveProgress+=40*delta
			if spdDown>0:
				moveProgress-=20*delta
		else:
			turnbar_animator.play("flash")
			if !party_handler.moveMenuOpen:
				if !move_handler.visible:
					move_handler.visible=true
					party_handler.moveMenuOpen=true
					move_handler.fadeIn()
	else:
		health_bar.scale.x=0
		health_label.modulate=Color(1.0, 0.0, 0.0, 1.0)
		if move_handler.visible:
			move_handler.visible=false
			party_handler.moveMenuOpen=false
			curChar.rotation_degrees=0
		spdUp=0
		spdDown=0
		atkDown=0
		atkUp=0
		defDown=0
		defUp=0
		stun=0
		fire=0
		poison=0
		moveProgress=0
		turn_bar.scale.x=(moveProgress/turnTime)*0.354


func _on_move_handler_move_used(move: String) -> void:
	print(move)
	party_handler.moveMenuOpen=false
	turnbar_animator.play("RESET")
	moveProgress=0
	turnTime=randi_range(420,650)
	#if character=="barrel":
		#stun=1
	if curChar!=null:
		curChar.play("useMove")
	if move=="Strike":
		var striked=strikeMove.instantiate()
		if atkUp>0:
			striked.multiplier+=0.5
		if atkDown>0:
			striked.multiplier-=0.5
		frog_layer.add_child(striked)
	if move=="Block":
		var blocked=blockMove.instantiate()
		frog_layer.add_child(blocked)
	if move=="Frogsicle":
		var siced=frogMove.instantiate()
		frog_layer.add_child(siced)
	if move=="Arrow Barrage":
			var arrowed=arrowMove.instantiate()
			arrowed.spawnLoca=global_position
			arrowed.spawnLoca.y=global_position.y-150
			if atkUp>0:
				arrowed.multiplier+=0.5
			if atkDown>0:
				arrowed.multiplier-=0.5
			frog_layer.add_child(arrowed)
	
	if move=="Overclock":
		var clocked=overclockMove.instantiate()
		frog_layer.add_child(clocked)
	if move=="Zip Bomb":
		var ziped=zipMove.instantiate()
		if atkUp>0:
			ziped.multiplier+=0.5
		if atkDown>0:
			ziped.multiplier-=0.5
		frog_layer.add_child(ziped)
	if move=="Alt F4":
		var alted=altMove.instantiate()
		frog_layer.add_child(alted)
	if move=="Infect":
		var infed=infectMove.instantiate()
		if atkUp>0:
			infed.multiplier+=0.5
		if atkDown>0:
			infed.multiplier-=0.5
		frog_layer.add_child(infed)
		
	if move=="Curse: Poison":
		var cursed=curPoiMove.instantiate()
		frog_layer.add_child(cursed)
	if move=="Curse: Weaken":
		var cursed=curWeakMove.instantiate()
		frog_layer.add_child(cursed)
	if move=="All Skill Baby":
		var coined=coinMove.instantiate()
		if atkUp>0:
			coined.multiplier+=0.5
		if atkDown>0:
			coined.multiplier-=0.5
		frog_layer.add_child(coined)
		
	if move=="Strength Spell":
		var powered=strengthMove.instantiate()
		frog_layer.add_child(powered)
	if move=="Sword Barrage":
		var sworded=swordMove.instantiate()
		if atkUp>0:
			sworded.multiplier+=0.5
		if atkDown>0:
			sworded.multiplier-=0.5
		frog_layer.add_child(sworded)
	if move=="Health Potion":
		var healed=healthPotion.instantiate()
		frog_layer.add_child(healed)
	if move=="Fireball":
		var fired=fireball.instantiate()
		if atkUp>0:
			fired.multiplier+=0.5
		if atkDown>0:
			fired.multiplier-=0.5
		frog_layer.add_child(fired)
	
	if move=="Cannon Barrage":
		var caned=cannon.instantiate()
		
		frog_layer.add_child(caned)
	if move=="Smite":
		var smied=smite.instantiate()
		if atkUp>0:
			smied.multiplier+=0.5
		if atkDown>0:
			smied.multiplier-=0.5
		frog_layer.add_child(smied)
	if move=="Electrocute":
		var eled=elect.instantiate()
		if atkUp>0:
			eled.multiplier+=0.5
		if atkDown>0:
			eled.multiplier-=0.5
		frog_layer.add_child(eled)
		
	if move=="Coffee Break":
		var cofed=coff.instantiate()
		frog_layer.add_child(cofed)
	if move=="Scald":
		var scaed=scald.instantiate()
		if atkUp>0:
			scaed.multiplier+=0.5
		if atkDown>0:
			scaed.multiplier-=0.5
		scaed.spawnLoca=global_position
		scaed.spawnLoca.y=global_position.y
		frog_layer.add_child(scaed)
	if move=="You're Fired":
		var fred=fired.instantiate()
		frog_layer.add_child(fred)
		
	if move=="Flashbang":
		var fled=flashed.instantiate()
		if atkUp>0:
			fled.multiplier+=0.5
		if atkDown>0:
			fled.multiplier-=0.5
		frog_layer.add_child(fled)
	if move=="Pummel":
		var pued=pummeld.instantiate()
		if atkUp>0:
			pued.multiplier+=0.5
		if atkDown>0:
			pued.multiplier-=0.5
		frog_layer.add_child(pued)
	if move=="Toxic Fumes":
		var toxed=toxiced.instantiate()
		frog_layer.add_child(toxed)
	if move=="Pressure Wash":
		var cleaned=cleanse.instantiate()
		frog_layer.add_child(cleaned)
	if move=="Bottoms Up":
		var botted=bottoms.instantiate()
		frog_layer.add_child(botted)
		
	if move=="DDoS":
		var dded=DDoSed.instantiate()
		frog_layer.add_child(dded)
	if move=="Bluescreen":
		var bled=blued.instantiate()
		frog_layer.add_child(bled)
	if move=="Curse: Corrupt":
		var corped=corupted.instantiate()
		frog_layer.add_child(corped)
	if move=="Arrow Barrage 2":
		for i in range(10):
			var bared=barraged.instantiate()
			bared.spawnLoca=global_position
			bared.spawnLoca.y=global_position.y-150
			frog_layer.add_child(bared)
			await get_tree().create_timer(0.2).timeout
func getChar()->String:
	return character


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area is damager:
		regen+=area.regen*20
		if !area.damage<0:
			var flashe=flash.instantiate()
			frog_layer.add_child(flashe)
		if area.damage!=0:
			health-=area.damage
			if area.damage>0:
				if defUp>0:
					area.damage-=(area.damage)/2
				if defDown>0:
					area.damage+=(area.damage)/2
			var movie=damageIcon.instantiate()
			movie.damageAmount=area.damage
			movie.global_position=global_position
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
		if defUp<area.defBuf:
			defUp=area.defBuf
		else:
			defUp+=(area.defBuf/2)
		#plays buff animations
		if area.defBuf>0:
			def_buff_anim.play()
		if area.strBuf>0:
			str_buff_anim.play()
		if area.spdBuf>0:
			spd_buff_anim.play()
		
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


func _on_poison_damage_timeout() -> void:
	var am=randi_range(1,10)
	var movie=damageIcon.instantiate()
	movie.damageAmount=am
	movie.global_position=global_position
	movie.damageType="poison"
	poison_dam.play("default")
	frog_layer.add_child(movie)
	health-=am
	poison-=am
	poison_damage.start(randi_range(1,5))


func _on_cleanse_box_area_entered(area: Area2D) -> void:
	defDown=0
	spdDown=0
	atkDown=0
