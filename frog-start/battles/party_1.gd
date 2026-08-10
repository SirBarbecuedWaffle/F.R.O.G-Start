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
@onready var invin_on: AnimatedSprite2D = $invinOn
@onready var explan_animator: AnimationPlayer = $"../party2/moveHandler/CanvasLayer/explanAnimator"
@onready var hitcol: CollisionShape2D = $hitBox/hitcol
var curProt=null
@onready var move_explainer: Label = $moveHandler/CanvasLayer/moveExplainer


@export var character:=""

#buff animations

@onready var poison_dam: AnimatedSprite2D = $poisonDam
@onready var poison_on: AnimatedSprite2D = $poisonOn
@onready var fire_on: AnimatedSprite2D = $fireOn
@onready var def_buff_anim: AnimatedSprite2D = $defBuffAnim
@onready var str_buff_anim: AnimatedSprite2D = $strBuffAnim
@onready var spd_buff_anim: AnimatedSprite2D = $spdBuffAnim
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2
@onready var hit_box: Area2D = $hitBox

#move preloads
var strikeMove=preload("res://moves/strike_move.tscn")
var blockMove=preload("res://moves/block_move.tscn")
var arrowMove=preload("res://moves/arrow_barrage.tscn")
var frogMove=preload("res://moves/frogsicle.tscn")
var overclockMove=preload("res://moves/overclock.tscn")
var zipMove=preload("res://moves/zipbomb.tscn")
var altMove=preload("res://moves/altf4.tscn")
var infectMove=preload("res://moves/infect_move.tscn")
var infectMove2=preload("res://moves/infect_2_move.tscn")
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
var dice=preload("res://moves/diceRoll.tscn")


var hDef=preload("res://patches/hDefense.tscn")
var hStr=preload("res://patches/hStrength.tscn")
var hSpd=preload("res://patches/hSpeed.tscn")
var secoNat=preload("res://patches/secondNature.tscn")
var secoChan=preload("res://patches/secChance.tscn")
var burnenem=preload("res://patches/burnEnemies.tscn")
var secWind=preload("res://patches/secondWind.tscn")

var frogProt=preload("res://patches/protocols/frog_protocol.tscn")
var steveProt=preload("res://patches/protocols/steve_protocol.tscn")
var maskProt=preload("res://patches/protocols/mask_protocol.tscn")
var hoodProt=preload("res://patches/protocols/hood_protocol.tscn")
var robotProt=preload("res://patches/protocols/robot_protocol.tscn")
var joeProt=preload("res://patches/protocols/joe_protocol.tscn")
var foxProt=preload("res://patches/protocols/fox_protocol.tscn")
@onready var curChar : AnimatedSprite2D
var permaDead:=false
@export var health:=10.0:
	set(newHP):	
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
@export var fire:=0.0
@export var atkDown:=00.0
@export var defDown:=00.0
@export var spdDown:=00.0
@export var atkUp:=0.0
@export var defUp:=0.0
@export var spdUp:=0.0
@export var stun:=0.0
@export var regen:=0
@export var invincible:=0.0
@export var curPatch:=0
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
@export var revived:=false
@export var canLoseSecWind:=false

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
	
	if curPatch==6:
		var frogees=frogProt.instantiate()
		if character=="frog":
			frogees.bonus=1
		if character=="mask":
			frogees.bonus=2
		curProt=frogees
		self.add_child(frogees)
	if curPatch==7:
		var frogees=steveProt.instantiate()
		if character=="steve":
			frogees.bonus=1
		if character=="joe":
			frogees.bonus=2
		curProt=frogees
		self.add_child(frogees)
	if curPatch==8:
		var frogees=maskProt.instantiate()
		if character=="mask":
			frogees.bonus=1
		if character=="lizard":
			frogees.bonus=2
		curProt=frogees
		self.add_child(frogees)
		
	if curPatch==16:
		var frogees=hoodProt.instantiate()
		if character=="pink":
			frogees.bonus=1
		if character=="frog":
			frogees.bonus=2
		curProt=frogees
		self.add_child(frogees)
	if curPatch==17:
		var frogees=robotProt.instantiate()
		if character=="robot":
			frogees.bonus=1
		if character=="steve":
			frogees.bonus=2
		curProt=frogees
		self.add_child(frogees)
		
	if curPatch==18:
		var frogees=joeProt.instantiate()
		if character=="joe":
			frogees.bonus=1
		if character=="pink":
			frogees.bonus=2
		curProt=frogees
		self.add_child(frogees)
	
	if curPatch==26:
		var frogees=foxProt.instantiate()
		if character=="fox":
			frogees.bonus=1
		if character=="steve":
			frogees.bonus=2
		curProt=frogees
		self.add_child(frogees)
	
	if curPatch==9:
		if character=="robot":
			maxHealth*=2
		elif character=="fox":
			maxHealth*=randf_range(0.8,2.5)
		else:
			maxHealth*=1.5
	if curPatch==11 && character=="joe":
		maxHealth*=1.2
	health=maxHealth
	if curPatch==11:
		defUp=9999
	if curPatch==12:
		atkUp=9999
	
	if curPatch==13 && character!="lizard":
		spdUp=9999
	await get_tree().create_timer(1.0).timeout
	if curPatch==1:
		var haha=hDef.instantiate()
		if character=="robot":
			haha.addRegen=150
		if character=="lizard":
			haha.addInvinc=20
			haha.addDef=-31
		frog_layer.add_child(haha)
	if curPatch==2:
		var haha=hStr.instantiate()
		if character=="frog":
			haha.addSpd=5
		if character=="pink":
			haha.subSpd=31
			haha.addStr=30
			
		frog_layer.add_child(haha)
	if curPatch==3:
		var haha=hSpd.instantiate()
		if character=="fox":
			haha.addSpd=30
			haha.subDef=20
		if character=="steve":
			haha.addSpd=10
		frog_layer.add_child(haha)
	if curPatch==22:
		if character=="pink":
			fire_on.modulate=Color(0.0, 1.353, 0.0, 0.718)
func invincAnim()->void:
		var tweente := create_tween()
		tweente.tween_property(invin_on, "modulate", Color(1.0, 1.0, 1.0, 1.0), 0.5)
		var tweent := create_tween()
		tweent.tween_property(curChar, "self_modulate", Color(1.825, 0.93, 0.0, 1.0), 0.5)
		await tweent.finished
		if !invincible>0:
			var tweented := create_tween()
			tweented.tween_property(invin_on, "modulate", Color(1.0, 1.0, 1.0, 0.0), 0.5)
			var tweent3 := create_tween()
			tweent3.tween_property(curChar, "self_modulate", Color(1.0, 1.0, 1.0, 1.0), 0.5)
		var tweent2 := create_tween()
		tweent2.tween_property(curChar, "self_modulate", Color(2.454, 2.454, 0.0, 1.0), 0.5)
		await tweent2.finished
		if invincible>0:
			invincAnim()
		else:
			var tweenteE := create_tween()
			tweenteE.tween_property(invin_on, "modulate", Color(1.0, 1.0, 1.0, 0.0), 0.5)
			var tweent3 := create_tween()
			tweent3.tween_property(curChar, "self_modulate", Color(1.0, 1.0, 1.0, 1.0), 0.5)

func _process(delta: float) -> void:
	if party_handler.battleWon:
		if curProt!=null:
			curProt.deactivated=true
	fire_on.visible=fire>0
	if fire>0:
		fire-=10*delta
		if int(fire)%5==0:
			if character=="fox":
				fire_on.modulate=Color(1.0, 1.0, 1.0, 1.0)
			var movie=damageIcon.instantiate()
			fire-=1
			var fireBlock:=false
			for g in CManager.currentPatches:
					if g==22:
						fireBlock=true
			if fireBlock:
				if character=="pink":
					movie.damageAmount=-5
					health-=-5
				elif character=="fox":
					var fireDam=randi_range(-2,3)
					movie.damageAmount=fireDam
					health-=fireDam
					if fireDam>0:
						fire_on.modulate=Color(1.0, 1.0, 1.0, 1.0)
						movie.damageType="fire"
					else:
						fire_on.modulate=Color(0.0, 1.353, 0.0, 0.718)
						
				else:
					movie.damageAmount=3
					movie.damageType="fire"
					health-=3
			else:
				movie.damageAmount=5
				movie.damageType="fire"
				health-=5
			movie.global_position=global_position
			
			frog_layer.add_child(movie)
	invin_on.visible=health>0
	if permaDead:
		health=-99999
		if hitcol!=null:
			hitcol.disabled=true
		regen=0
	if invincible>0:	
		invincible-=1*delta
		fire=0
		poison=0
	stun_anim.visible=stun>0
	if stun>0:
		if turnbar_animator.current_animation!="flash":
			stun-=1*delta
			moveProgress=randi_range(0,turnTime-50)
	if regen>0:
		regen-=25*delta
		if regen%50==0:
			if health!=maxHealth:
				
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
				explan_animator.play("hideText")
				curChar.play("die")
				move_explainer.visible=false
				if curProt!=null:
					curProt.die()
				if health>-300:
					health-=randi_range(30,90)
				if curPatch==10 && !revived:
					await get_tree().create_timer(1.0).timeout
					var revive=secoChan.instantiate()
					revive.place=global_position
					frog_layer.add_child(revive)
					if character=="barrel":
						await get_tree().create_timer(1.0).timeout
						var haha=hSpd.instantiate()
						haha.addRegen=200
						haha.addSpd=-31
						frog_layer.add_child(haha)
					if character=="pink":
						await get_tree().create_timer(1.0).timeout
						var haha=burnenem.instantiate()
						frog_layer.add_child(haha)
					await get_tree().create_timer(1.0).timeout
					revived=true
					
				else:
					if curPatch==14:
						permaDead=true
						var siced=secWind.instantiate()
						var guys=party_handler.getOtherPlayers(self)
						print(guys)
						siced.targets=guys
						siced.spawnLoca=self.global_position
						frog_layer.add_child(siced)
						if character=="robot":
							await get_tree().create_timer(1.0).timeout
							var haha=burnenem.instantiate()
							haha.addBurn=-120
							haha.addStun=10
							frog_layer.add_child(haha)
						if character=="mask":
							await get_tree().create_timer(1.0).timeout
							var haha=burnenem.instantiate()
							haha.addBurn=-120
							haha.subSpd=31
							haha.subStr=31
							haha.subDef=31
							frog_layer.add_child(haha)
						await get_tree().create_timer(1.1).timeout
						canLoseSecWind=true
					node_2d.playerDowned()
				
				
					
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
	if !permaDead:
		health_label.text=str(int(health))
	else:
		health_label.text="DEAD"
		health_label.modulate=Color(0.474, 0.474, 0.474, 1.0)
	if health>=1 && !permaDead:
		if health_label.modulate==Color(1.0, 0.0, 0.0, 1.0):
			if curPatch==11:
				defUp=9999
			if curPatch==12:
				atkUp=9999
			if curPatch==13 && character!="lizard":
				spdUp=9999
			if curProt!=null:
				curProt.alive()
			curChar.play("unDie")
			moveProgress=0
			health_label.modulate=Color(1.0, 1.0, 1.0, 1.0)
		turn_bar.scale.x=(moveProgress/turnTime)*0.354
		if health<maxHealth+1:
			health_bar.scale.x=(health/maxHealth)*-0.377
		if moveProgress<turnTime:
			moveProgress+=70*delta
			if invincible>0:
				moveProgress+=120*delta
			if spdUp>0:
				moveProgress+=40*delta
			if spdDown>0:
				moveProgress-=20*delta
		else:
			turnbar_animator.play("flash")
			if !party_handler.moveMenuOpen:
				if !move_handler.visible:
					if curPatch==13 && character=="frog":
						atkUp+=2
					move_handler.visible=true
					party_handler.moveMenuOpen=true
					move_handler.fadeIn()
	else:
		health_bar.scale.x=0
		if health_label.modulate==Color(1.0, 1.0, 1.0, 1.0):
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
	if curPatch==11 && character=="steve":
		invincible=1
		invincAnim()
	if curPatch==12 && character=="pink":
		spdUp=3
	if curPatch==12 && character=="robot":
		health+=10
		var movie=damageIcon.instantiate()
		movie.damageAmount=-10
		movie.global_position=global_position
		frog_layer.add_child(movie)
	if curPatch==4:
		var haha=secoNat.instantiate()
		haha.char=character
		frog_layer.add_child(haha)
	print(move)
	party_handler.moveMenuOpen=false
	turnbar_animator.play("RESET")
	moveProgress=0
	turnTime=randi_range(420,650)
	if curPatch==13 && character=="lizard":
		stun=0.03
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
	if move=="Infect 2":
		var infed=infectMove2.instantiate()
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
	if move=="Even More Skill":
		var diced=dice.instantiate()
		frog_layer.add_child(diced)
		
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
			var damned:=true
			if invin_on.modulate==Color(1.0, 1.0, 1.0, 0.0):
				
				if area.damage>9998:
					for g in CManager.currentPatches:
						if g==21:
							var movie=damageIcon.instantiate()
							movie.blocked=true
							movie.global_position=global_position
							frog_layer.add_child(movie)
							damned=false
							if character=="steve":
								spdUp+=5
							if character=="joe":
								health+=(maxHealth*0.3)
								await get_tree().create_timer(0.25).timeout
								var movie2=damageIcon.instantiate()
								movie2.damageAmount=maxHealth*-0.3
								movie2.global_position=global_position
								frog_layer.add_child(movie2)
					if damned:
						health-=999+health
						await get_tree().create_timer(0.01).timeout
						if health<0:
							health=-999
				elif area.damage>0:
					if curPatch==24:
						var striked=strikeMove.instantiate()
						if character=="frog":
							striked.multiplier=3
						if character=="mask":
							striked.slowSpd=true
						frog_layer.add_child(striked)
					if curPatch==25:
						var striked=pummeld.instantiate()
						if character=="lizard":
							striked.multiplier=2
						frog_layer.add_child(striked)
						if character=="robot":
							await get_tree().create_timer(1.5).timeout
							var striked2=pummeld.instantiate()
							frog_layer.add_child(striked2)
					if curPatch==29:
						var striked=elect.instantiate()
						striked.stunLength=3
						if character=="robot":
							striked.stunLength=5
						if character=="fox":
							striked.stunLength=randi_range(1,9)
						frog_layer.add_child(striked)
					
					if defUp>0:
						area.damage-=(area.damage)/2
					if defDown>0:
						area.damage+=(area.damage)/2
					for g in CManager.currentPatches:
						if g==21:
							if area.damage>maxHealth && health==maxHealth:
								area.damage=maxHealth-1
								if character=="steve":
									spdUp+=5
								if character=="joe":
									health+=maxHealth*0.3
									var movie=damageIcon.instantiate()
									movie.damageAmount=maxHealth*-0.3
									movie.global_position=global_position
									frog_layer.add_child(movie)
					health-=area.damage
				else:
					health-=area.damage
			if damned:
				var movie=damageIcon.instantiate()
				if  invin_on.modulate==Color(1.0, 1.0, 1.0, 0.0):
					if area.damage!=0:
						movie.damageAmount=area.damage
					if area.damage>9998:
						movie.damageType="cleaving"
				else:
					if area.damage<0:
						health-=area.damage
						movie.damageAmount=area.damage
					else:					
						movie.damageAmount=0
				movie.global_position=global_position
				frog_layer.add_child(movie)
		if invin_on.modulate==Color(1.0, 1.0, 1.0, 0.0):
			poison+=area.poison
			var stunBlocked:=false
			if area.stun>0:
				for g in CManager.currentPatches:
					if g==22:
						stunBlocked=true
						await get_tree().create_timer(0.25).timeout
						var movie=damageIcon.instantiate()
						movie.blocked=true
						movie.global_position=global_position
						frog_layer.add_child(movie)
			if !stunBlocked:
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
		var blockDebuff:=false
		for g in CManager.currentPatches:
			if g==23:
				blockDebuff=true
		if !blockDebuff:
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
		else:
			if area.spdRev>0 || area.strRev>0 || area.defRev>0:
				
				if character=="mask":
					spdUp+=area.spdRev
					defUp+=area.defRev
					atkUp+=area.strRev
				
				var movie=damageIcon.instantiate()
				movie.blocked=true
				movie.global_position=global_position
				frog_layer.add_child(movie)
				await get_tree().create_timer(0.25).timeout
				if character=="lizard":
					health+=maxHealth*0.3
					var movie2=damageIcon.instantiate()
					movie2.damageAmount=maxHealth*-0.3
					movie2.global_position=global_position
					frog_layer.add_child(movie2)
		if area.invincible>invincible+1:
			invincible=area.invincible
			invincAnim()
	if area!=null:
		if area is damager:
			if area.oneHit:
				area.queue_free()


func _on_poison_damage_timeout() -> void:
	var am=randi_range(1,10)
	var movie=damageIcon.instantiate()
	movie.damageAmount=am+(maxHealth*0.02)
	movie.global_position=global_position
	movie.damageType="poison"
	poison_dam.play("default")
	frog_layer.add_child(movie)
	health-=am+(maxHealth*0.02)
	poison-=am
	poison_damage.start(randi_range(1,5))


func _on_cleanse_box_area_entered(area: Area2D) -> void:
	defDown=0
	spdDown=0
	atkDown=0
