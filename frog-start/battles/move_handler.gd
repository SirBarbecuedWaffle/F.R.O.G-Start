extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal moveUsed(move : String)
@onready var move_handler: Node2D = $"."

@onready var move_1: TextureButton = $move1
@onready var move_1_lab: Label = $move1/move1Lab
@onready var move_2: TextureButton = $move2
@onready var move_2_lab: Label = $move2/move2Lab
@onready var move_3: TextureButton = $move3
@onready var move_3_lab: Label = $move3/move3Lab
@onready var move_4: TextureButton = $move4
@onready var move_4_lab: Label = $move4/move4Lab
@onready var move_explainer: Label = $CanvasLayer/moveExplainer
@onready var explan_animator: AnimationPlayer = $CanvasLayer/explanAnimator
var moveHovered :=""

func _ready() -> void:
	move_handler.visible=false

func _process(delta: float) -> void:
	if moveHovered=="":
		move_explainer.text="Hover over a move to see what it does"
	if moveHovered=="Strike":
		move_explainer.text="Deals medium damage to a single random enemy"
	if moveHovered=="Arrow Barrage":
		move_explainer.text="Deals low damage and applies three random debuffs to random enemies"
	if moveHovered=="Block":
		move_explainer.text="Temporarily raises the defense of your entire party"
	if moveHovered=="Frogsicle":
		move_explainer.text="Applies medium heals to your entire party"
	if moveHovered=="Overclock":
		move_explainer.text="Temporarily raises the speed of your entire party"
	if moveHovered=="Zip Bomb":
		move_explainer.text="Deals medium damage to every enemy"
	if moveHovered=="Infect":
		move_explainer.text="Deals low damage and poisons a single enemy"
	if moveHovered=="Alt F4":
		move_explainer.text="Has a 1/5 chance to instakill a random non-boss enemy"
		
	
	if get_parent().getChar()=="frog":
		move_1_lab.text="Arrow Barrage"
		move_2_lab.text="Block"
		move_3_lab.text="Strike"
		move_4_lab.text="Frogsicle"
	if get_parent().getChar()=="steve":
		move_1_lab.text="Overclock"
		move_2_lab.text="Zip Bomb"
		move_3_lab.text="Infect"
		move_4_lab.text="Alt F4"

func fadeIn()->void:
	moveHovered=""
	animation_player.play("fadeIn")
	explan_animator.play("showText")

func _on_move_1_pressed() -> void:
	animation_player.play("press1")
	moveUsed.emit(move_1_lab.text)
	explan_animator.play("hideText")


func _on_move_2_pressed() -> void:
	animation_player.play("press2")
	moveUsed.emit(move_2_lab.text)
	explan_animator.play("hideText")


func _on_move_3_pressed() -> void:
	animation_player.play("press3")
	moveUsed.emit(move_3_lab.text)
	explan_animator.play("hideText")


func _on_move_4_pressed() -> void:
	animation_player.play("press4")
	moveUsed.emit(move_4_lab.text)
	explan_animator.play("hideText")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name!="fadeIn":
		move_handler.visible=false
		animation_player.play("RESET")


func _on_move_mouse_entered() -> void:
	moveHovered=move_1_lab.text
	


func _on_move_mouse_exited() -> void:
	moveHovered=""


func _on_move_2_mouse_entered() -> void:
	moveHovered=move_2_lab.text


func _on_move_3_mouse_entered() -> void:
	moveHovered=move_3_lab.text


func _on_move_4_mouse_entered() -> void:
	moveHovered=move_4_lab.text
