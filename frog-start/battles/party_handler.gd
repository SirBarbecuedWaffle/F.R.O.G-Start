extends Node2D
@onready var party_1: Node2D = $party1
@onready var party_2: Node2D = $party2
@onready var party_3: Node2D = $party3
@onready var party_4: Node2D = $party4


@onready var steve: AnimatedSprite2D = $steve
@onready var mask: AnimatedSprite2D = $mask
@onready var pink: AnimatedSprite2D = $pink
@onready var frog: AnimatedSprite2D = $frog

@onready var animation_player: AnimationPlayer = $AnimationPlayer


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
