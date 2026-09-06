extends CanvasLayer
@onready var heart_1: AnimatedSprite2D = $Health/heart1
@onready var heart_2: AnimatedSprite2D = $Health/heart2
@onready var heart_3: AnimatedSprite2D = $Health/heart3
@onready var heart_4: AnimatedSprite2D = $Health/heart4
@onready var heart_5: AnimatedSprite2D = $Health/heart5
@onready var heart_6: AnimatedSprite2D = $Health/heart6
@onready var heart_7: AnimatedSprite2D = $Health/heart7
@onready var heart_8: AnimatedSprite2D = $Health/heart8
@onready var heart_9: AnimatedSprite2D = $Health/heart9
@onready var character_body_2d: CharacterBody2D = $".."


func _ready() -> void:
	if character_body_2d.maxHealth>3.0:
		heart_4.visible=true
	if character_body_2d.maxHealth>4.0:
		heart_5.visible=true
	if character_body_2d.maxHealth>5.0:
		heart_6.visible=true
	if character_body_2d.maxHealth>6.0:
		heart_7.visible=true
	if character_body_2d.maxHealth>7.0:
		heart_8.visible=true
	if character_body_2d.maxHealth>8.0:
		heart_9.visible=true
	character_body_2d.health=character_body_2d.maxHealth
	
func updateHearts()->void:
	if heart_1.visible && heart_2.animation=="empty":
		if character_body_2d.health<0.5:
			if heart_1.animation=="blinkHalf":
				heart_1.play("blinkNone")
			elif heart_1.animation=="whole":
				heart_1.play("blinkHalf")
			elif heart_1.animation=="blinkNone":
				heart_1.play("empty")
		elif character_body_2d.health<1.0:
			if heart_1.animation=="whole":
				heart_1.play("blinkHalf")
			elif heart_1.animation=="empty":
				heart_1.play_backwards("blinkNone")
		else:
			if character_body_2d.health>1.0:
				if heart_1.animation=="empty":
					heart_1.play_backwards("blinkNone")
				elif heart_1.animation=="blinkNone":
					heart_1.play_backwards("blinkHalf")
				else:
					heart_1.play("whole")
			elif character_body_2d.health>0.5:
				if heart_1.animation=="blinkNone":
					heart_1.play_backwards("blinkHalf")
				elif heart_1.animation=="empty":
					heart_1.play_backwards("blinkNone")
	
	if heart_2.visible:
		if character_body_2d.health<1.5:
			if heart_2.animation=="blinkHalf":
				heart_2.play("blinkNone")
			elif heart_2.animation=="whole":
				heart_2.play("blinkHalf")
			else:
				heart_2.play("empty")
		elif character_body_2d.health<2.0:
			if heart_2.animation=="whole":
				heart_2.play("blinkHalf")
			elif heart_2.animation=="empty":
				heart_2.play_backwards("blinkNone")
		else:
			if character_body_2d.health>2.0:
				if heart_2.animation=="empty":
					heart_2.play_backwards("blinkNone")
				elif heart_2.animation=="blinkNone":
					heart_2.play_backwards("blinkHalf")
				else:
					heart_2.play("whole")
			elif character_body_2d.health>1.5:
				if heart_2.animation=="blinkNone":
					heart_2.play_backwards("blinkHalf")
				elif heart_2.animation=="empty":
					heart_2.play_backwards("blinkNone")
			
func _process(delta: float) -> void:
	print(heart_1.animation)


func _on_heart_1_animation_finished() -> void:
	updateHearts()
