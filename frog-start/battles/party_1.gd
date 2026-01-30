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

#move preloads
var strikeMove=preload("res://moves/strike_move.tscn")
var blockMove=preload("res://moves/block_move.tscn")


@export var health:=140.0:
	set(newHP):
		if health<maxHealth:
			if newHP<health-1:
				hit_sprite.play("default")
				if curChar.animation=="idle":
					curChar.play("hurt")
		if defUp:
			newHP+=(health-newHP)/2
		if defDown:
			newHP-=(health-newHP)/2
		health=newHP
		
			
@export var maxHealth:=140.0
@export var moveProgress:=0.0
@export var poison:=0
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
@onready var curChar = frog
@onready var frog_layer: CanvasLayer = $"../.."

func _ready() -> void:
	if character=="frog":
		var curChar=frog
	if character=="steve":
		curChar=steve
	if character=="mask":
		curChar=mask
	if character=="pink":
		curChar=pink

func _process(delta: float) -> void:
	if health<0:
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
	if health>0:
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
func getChar()->String:
	return character


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area is damager:
		if area.damage!=0:
			health-=area.damage
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
