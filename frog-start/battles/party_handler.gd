extends Node2D
@onready var party_1: Node2D = $party1
@onready var party_2: Node2D = $party2
@onready var party_3: Node2D = $party3
@onready var party_4: Node2D = $party4


@onready var steve: AnimatedSprite2D = $steve
@onready var mask: AnimatedSprite2D = $mask
@onready var pink: AnimatedSprite2D = $pink
@onready var frog: AnimatedSprite2D = $frog
@onready var gorf: AnimatedSprite2D = $gorf
@onready var robot: AnimatedSprite2D = $robot
@onready var lizard: AnimatedSprite2D = $lizard
@onready var joe: AnimatedSprite2D = $joe
@onready var barrel: AnimatedSprite2D = $barrel
@onready var fox: AnimatedSprite2D = $fox



func getAlivePlayers()->Array:
	var alivePlayers:=[0,0,0,0]
	var curSlot:=0
	for i in get_children():
		if i is partyMember:
			if i.health>0:
				alivePlayers[curSlot]=i
			curSlot+=1
	if alivePlayers==[0,0,0,0]:
		get_tree().quit()
	return alivePlayers

func _process(delta: float) -> void:
	if frog.animation=="useMove":
		frog.rotation_degrees=-90*(frog.frame%4)
	if steve.animation=="useMove":
		steve.rotation_degrees=-90*(steve.frame%4)
	if mask.animation=="useMove":
		mask.rotation_degrees=-90*(mask.frame%4)
	if pink.animation=="useMove":
		pink.rotation_degrees=-90*(pink.frame%4)
	if robot.animation=="useMove":
		robot.rotation_degrees=-90*(robot.frame%4)
	if joe.animation=="useMove":
		joe.rotation_degrees=-90*(joe.frame%4)
	if fox.animation=="useMove":
		fox.rotation_degrees=-90*(fox.frame%4)
	if gorf.animation=="useMove":
		gorf.rotation_degrees=-90*(gorf.frame%4)
	
	
func _ready() -> void:
	if CManager.party[0]==1:
		frog.global_position=party_1.global_position
		frog.visible=true
		party_1.character="frog"
	if CManager.party[0]==2:
		steve.global_position=party_1.global_position
		steve.visible=true
		party_1.character="steve"
	if CManager.party[0]==3:
		mask.global_position=party_1.global_position
		mask.visible=true
		party_1.character="mask"
	if CManager.party[0]==4:
		pink.global_position=party_1.global_position
		pink.visible=true
		party_1.character="pink"
	if CManager.party[0]==5:
		robot.global_position=party_1.global_position
		robot.visible=true
		party_1.character="robot"
	if CManager.party[0]==6:
		joe.global_position=party_1.global_position
		joe.visible=true
		party_1.character="joe"
	if CManager.party[0]==7:
		fox.global_position=party_1.global_position
		fox.visible=true
		party_1.character="fox"
	if CManager.party[0]==8:
		lizard.global_position.y=party_1.global_position.y-50
		lizard.global_position.x=party_1.global_position.x-70
		lizard.visible=true
		party_1.character="lizard"
	if CManager.party[0]==9:
		barrel.global_position.x=party_1.global_position.x+5
		barrel.global_position.y=party_1.global_position.y-45
		barrel.visible=true
		party_1.character="barrel"
	if CManager.party[0]==10:
		gorf.global_position=party_1.global_position
		gorf.visible=true
		party_1.character="gorf"


func _on_frog_animation_finished() -> void:
	if frog.animation!="die":
		frog.play("idle")


func _on_steve_animation_finished() -> void:
	if steve.animation!="die":
		steve.play("idle")


func _on_mask_animation_finished() -> void:
	if mask.animation!="die":
		mask.play("idle")


func _on_pink_animation_finished() -> void:
	if pink.animation!="die":
		pink.play("idle")


func _on_gorf_animation_finished() -> void:
	if gorf.animation!="die":
		gorf.play("idle")


func _on_robot_animation_finished() -> void:
	if robot.animation!="die":
		robot.play("idle")


func _on_lizard_animation_finished() -> void:
	if lizard.animation!="die":
		lizard.play("idle")


func _on_joe_animation_finished() -> void:
	if joe.animation!="die":
		joe.play("idle")


func _on_barrel_animation_finished() -> void:
	if barrel.animation!="die":
		barrel.play("idle")


func _on_fox_animation_finished() -> void:
	if fox.animation!="die":
		fox.play("idle")


func _on_gorf_timer_timeout() -> void:
	pass # Replace with function body.
