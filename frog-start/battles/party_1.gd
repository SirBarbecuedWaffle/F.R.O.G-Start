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


var damageIcon=preload("res://damageIndicator.tscn")
var flash=preload("res://screenFlash.tscn")


@export var health:=140.0:
	set(newHP):
		if health<maxHealth:
			if newHP<health-1:
				hit_sprite.play("default")
		if newHP<health:
			if newHP<health-1:
				if curChar.animation=="idle":
					curChar.play("hurt")
			if defUp>0:
				newHP+=(health-newHP)/2
			if defDown>0:
				newHP-=(health-newHP)/2
		health=newHP
		
			
@export var maxHealth:=140.0
@export var moveProgress:=0.0
@export var poison:=0.0
@export var fire:=0
@export var atkDown:=00.0
@export var defDown:=00.0
@export var spdDown:=00.0
@export var atkUp:=00.0
@export var defUp:=10.0
@export var spdUp:=10.0
@export var stun:=0
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
@onready var curChar : AnimatedSprite2D
@onready var frog_layer: CanvasLayer = $"../.."
@onready var poison_damage: Timer = $poisonDamage

func _ready() -> void:
	await get_tree().create_timer(0.01).timeout
	if character=="frog":
		curChar=frog
	if character=="steve":
		curChar=steve
		curChar.play("idle")
	if character=="mask":
		curChar=mask
		curChar.play("idle")
	if character=="pink":
		curChar=pink

func _process(delta: float) -> void:
	poison_on.visible=poison>0
	poison_damage.paused=!poison>0
	if health<1:
		if curChar.animation!="die":
			curChar.play("die")
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
				moveProgress+=70*delta
			if spdDown>0:
				moveProgress-=20*delta
		else:
			if !move_handler.visible:
				move_handler.visible=true
				move_handler.fadeIn()
	else:
		health_bar.scale.x=0
		health_label.modulate=Color(1.0, 0.0, 0.0, 1.0)
		move_handler.visible=false
		spdUp=0
		spdDown=0
		atkDown=0
		atkUp=0
		defDown=0
		defUp=0
		moveProgress=0
		turn_bar.scale.x=(moveProgress/turnTime)*0.354


func _on_move_handler_move_used(move: String) -> void:
	print(move)
	moveProgress=0
	turnTime=randi_range(420,650)
	curChar.play("useMove")
	if move=="Strike":
		var striked=strikeMove.instantiate()
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
			frog_layer.add_child(arrowed)
	
	if move=="Overclock":
		var clocked=overclockMove.instantiate()
		frog_layer.add_child(clocked)
	if move=="Zip Bomb":
		var ziped=zipMove.instantiate()
		frog_layer.add_child(ziped)
	if move=="Alt F4":
		var alted=altMove.instantiate()
		frog_layer.add_child(alted)
	if move=="Infect":
		var infed=infectMove.instantiate()
		frog_layer.add_child(infed)
		
	if move=="Curse: Poison":
		var cursed=curPoiMove.instantiate()
		frog_layer.add_child(cursed)
	if move=="Curse: Weaken":
		var cursed=curWeakMove.instantiate()
		frog_layer.add_child(cursed)
	if move=="All Skill Baby":
		var coined=coinMove.instantiate()
		frog_layer.add_child(coined)
		
	if move=="Strength Spell":
		var powered=strengthMove.instantiate()
		frog_layer.add_child(powered)
	if move=="Sword Barrage":
		var sworded=swordMove.instantiate()
		frog_layer.add_child(sworded)
func getChar()->String:
	return character


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area is damager:
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
