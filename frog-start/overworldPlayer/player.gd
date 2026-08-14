extends CharacterBody2D
class_name Player
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var speed:=650
var firstPressed:=""
var lastPressed:=""
signal pickedupItem(item : int)
var canDropHands:=false
@export var frozen:=false
var shouldRepause:=false
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var itemPicked:=0
@export var curCut:=false
@onready var level_storage: Node2D = $levelStorage
@onready var levelUper=preload("res://levelIndicator.tscn")

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	for d in range(4):
		while CManager.levelUpDisplays[d]>0:
			CManager.levelUpDisplays[d]-=1
			var levelInst=levelUper.instantiate()
			if CManager.fauxParty[d]==1:
				levelInst.char="frog"
			if CManager.fauxParty[d]==2:
				levelInst.char="steve"
			if CManager.fauxParty[d]==3:
				levelInst.char="mask"
			if CManager.fauxParty[d]==4:
				levelInst.char="hood"
			if CManager.fauxParty[d]==5:
				levelInst.char="robot"
			if CManager.fauxParty[d]==6:
				levelInst.char="joe"
			if CManager.fauxParty[d]==7:
				levelInst.char="fox"
			if CManager.fauxParty[d]==8:
				levelInst.char="lizard"
			if CManager.fauxParty[d]==9:
				levelInst.char="barrel"
			level_storage.add_child(levelInst)
			await get_tree().create_timer(1.0).timeout
			


func levelUp()->void:
	animation_player.play("levelUp")

func itemCollect(patchID)->void:
	pickedupItem.emit(patchID)
	itemPicked=1
	animated_sprite_2d.play("itemPickup")
	await get_tree().create_timer(3.0).timeout

	animated_sprite_2d.play("itemPut")
	itemPicked=3

func battleStart()->void:
	animated_sprite_2d.play("scared")
	itemPicked=1

func _physics_process(delta: float) -> void:

	if !PManager.paused:
		if itemPicked==0:
			speed=65
			if velocity.x==0 && velocity.y==0:
				if lastPressed=="right"||lastPressed=="left":
					animated_sprite_2d.play("idleRight")
				if lastPressed=="down":
					animated_sprite_2d.play("idleFront")
				if lastPressed=="up":
					animated_sprite_2d.play("idleBack")
			if !curCut:
				if !frozen:
					if !(!Input.is_action_pressed("right") && !Input.is_action_pressed("left") && !Input.is_action_pressed("down") && !Input.is_action_pressed("up")):
						if firstPressed=="right" || firstPressed=="left":
							animated_sprite_2d.play("walkRight")
						if firstPressed=="up":
							animated_sprite_2d.play("walkBack")
						if firstPressed=="down":
							animated_sprite_2d.play("walkFront")
						
					if !Input.is_action_pressed("right") && !Input.is_action_pressed("left"):
						if firstPressed=="right"||firstPressed=="left":
							firstPressed=""	
					if !Input.is_action_pressed("down") && !Input.is_action_pressed("up"):
						if firstPressed=="down"||firstPressed=="up":
							firstPressed=""	
					if lastPressed=="right":
						animated_sprite_2d.flip_h=false
					if lastPressed=="left":
						animated_sprite_2d.flip_h=true
					if Input.is_action_pressed("up"):
						velocity.y=-1*speed
						if firstPressed==""|| firstPressed=="down":
							firstPressed="up"
						lastPressed="up"
					elif Input.is_action_pressed("down"):
						velocity.y=1*speed
						if firstPressed==""|| firstPressed=="up":
							firstPressed="down"
						lastPressed="down"
					else:
						velocity.y=0
					if Input.is_action_pressed("right"):
						velocity.x=1*speed
						if firstPressed==""|| firstPressed=="left":
							firstPressed="right"
						lastPressed="right"
					elif Input.is_action_pressed("left"):
						velocity.x=-1*speed
						if firstPressed==""|| firstPressed=="right":
							firstPressed="left"
						lastPressed="left"
					else:
						velocity.x=0
					
					
					if !Input.is_action_pressed("right") && !Input.is_action_pressed("left") && !Input.is_action_pressed("down") && !Input.is_action_pressed("up"):
						firstPressed=""
					if (Input.is_action_pressed("right") || Input.is_action_pressed("left")) && (Input.is_action_pressed("up") || Input.is_action_pressed("down")):
						if velocity.x<0:
							velocity.x=speed*0.8*-1
						else:
							velocity.x=speed*0.8
						if velocity.y<0:
							velocity.y=speed*0.8*-1
						else:
							velocity.y=speed*0.8
					move_and_slide()
			else:
				animated_sprite_2d.play("idleBack")


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation=="itemPut":
		
		lastPressed="down"
		animated_sprite_2d.play("idleFront")
		await get_tree().create_timer(0.1).timeout
		itemPicked=0
