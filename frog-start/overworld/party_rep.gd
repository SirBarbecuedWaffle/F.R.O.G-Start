extends Node2D
@onready var frog_box: Sprite2D = $frogBox
@onready var frog_box_2: Sprite2D = $frogBox2
@onready var frog_box_3: Sprite2D = $frogBox3
@onready var frog_box_4: Sprite2D = $frogBox4
@onready var frog: AnimatedSprite2D = $frog
@onready var gorf: AnimatedSprite2D = $gorf
@onready var robot: AnimatedSprite2D = $robot
@onready var lizard: AnimatedSprite2D = $lizard
@onready var joe: AnimatedSprite2D = $joe
@onready var fox: AnimatedSprite2D = $fox
@onready var steve: AnimatedSprite2D = $steve
@onready var mask: AnimatedSprite2D = $mask
@onready var pink: AnimatedSprite2D = $pink
@onready var barrel: AnimatedSprite2D = $barrel
@onready var party_rep: Node2D = $"."
@onready var glitch_lab: Label = $gorf/box1Vis/AnimatedSprite2D2/glitchLab
var glitchedChars=["$","#",":D","%","1","*","!"]
var boxes=[null,null,null,null]
func _ready() -> void:
	updateParty()

func updateParty()->void:
		for f in party_rep.get_children():
			if f is Sprite2D:
				for i in range(4):
					if boxes[i]==null:
						boxes[i]=f
						break
			if f is AnimatedSprite2D:
				f.global_position.x-=4000
		for i in range(4):
			if CManager.party[i]==1:
				frog.global_position.x=boxes[i].global_position.x
				frog.global_position.y=boxes[i].global_position.y-3
			if CManager.party[i]==2:
				steve.global_position.x=boxes[i].global_position.x
				steve.global_position.y=boxes[i].global_position.y-3
			if CManager.party[i]==3:
				mask.global_position.x=boxes[i].global_position.x
				mask.global_position.y=boxes[i].global_position.y-3
			if CManager.party[i]==4:
				pink.global_position.x=boxes[i].global_position.x
				pink.global_position.y=boxes[i].global_position.y-3
			if CManager.party[i]==5:
				robot.global_position.x=boxes[i].global_position.x
				robot.global_position.y=boxes[i].global_position.y-3
			if CManager.party[i]==6:
				joe.global_position.x=boxes[i].global_position.x
				joe.global_position.y=boxes[i].global_position.y-3
			if CManager.party[i]==7:
				fox.global_position.x=boxes[i].global_position.x
				fox.global_position.y=boxes[i].global_position.y-3
			if CManager.party[i]==8:
				lizard.global_position.x=boxes[i].global_position.x+55
				lizard.global_position.y=boxes[i].global_position.y-38
			if CManager.party[i]==9:
				barrel.global_position.x=boxes[i].global_position.x
				barrel.global_position.y=boxes[i].global_position.y-38
			if CManager.party[i]==10:
				gorf.global_position.x=boxes[i].global_position.x
				gorf.global_position.y=boxes[i].global_position.y-3


func _on_glitch_timer_timeout() -> void:
	glitch_lab.text="Protocol:\nERROR"
	for i in range(2):
		var scramble1=randi_range(0,glitch_lab.text.length()-1)
		if glitch_lab.text[scramble1]!="\n":
			glitch_lab.text[scramble1]=glitchedChars[randi_range(0,glitchedChars.size()-1)]
