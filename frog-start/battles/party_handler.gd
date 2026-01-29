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


func _ready() -> void:
	if CManager.party[0]==1:
		frog.global_position=party_1.global_position
		frog.visible=true
		party_1.character="frog"
	if CManager.party[1]==2:
		steve.global_position=party_2.global_position
		steve.visible=true
	if CManager.party[2]==3:
		mask.global_position=party_3.global_position
		mask.visible=true
	if CManager.party[3]==4:
		pink.global_position=party_4.global_position
		pink.visible=true
