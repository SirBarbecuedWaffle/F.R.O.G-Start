extends Node2D
@onready var health_bar: Sprite2D = $healthBar
@onready var turn_bar: Sprite2D = $turnBar
@onready var health_label: Label = $healthLabel
@onready var move_handler: Node2D = $moveHandler

@export var character:=""

@export var health:=140.0
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

func _process(delta: float) -> void:
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
	health-=0.05
	if health>0:
		health_label.modulate=Color(1.0, 1.0, 1.0, 1.0)
		turn_bar.scale.x=(moveProgress/turnTime)*0.354
		health_bar.scale.x=(health/maxHealth)*-0.377
		if moveProgress<turnTime:
			moveProgress+=1
			if spdUp>0:
				moveProgress+=0.5
			if spdDown>0:
				moveProgress-=0.5
		else:
			if !move_handler.visible:
				move_handler.visible=true
				move_handler.fadeIn()
	else:
		health_label.modulate=Color(1.0, 0.0, 0.0, 1.0)
		move_handler.visible=false
		moveProgress=0
		turn_bar.scale.x=(moveProgress/turnTime)*0.354


func _on_move_handler_move_used(move: String) -> void:
	print(move)
	moveProgress=0
	turnTime=randi_range(420,650)
	
func getChar()->String:
	return character
